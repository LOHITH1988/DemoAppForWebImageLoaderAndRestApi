//
//  File.swift
//  
//
//  Created by Lohith on 03/08/2022.
//

import Foundation

// CachedWebImage  resposible to store and retrive dounloaded images


final class CachedWebImage{
    
    // File Manager
    
    private var fileManager: FileManager!
    
    private var storedPath : String!
      
    private var lock = NSLock()

    public init(fileManager : FileManager = FileManager.default) {
        self.fileManager = fileManager
       
        let url = try! fileManager.url(
            for: .cachesDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
          )
        storedPath =  url.appendingPathComponent("CachedWebImage", isDirectory: true).path
        createDirectory()
    
    }
    
    // create directory for the file Manager
    
    func createDirectory()  {
        
      guard !fileManager.fileExists(atPath: storedPath) else {
        return
      }

      try? fileManager.createDirectory(atPath: storedPath, withIntermediateDirectories: true,
                                      attributes: nil)
    }
    
    
     func makeFileName(for key: Key) -> String {
     
      var hasher = Hasher.constantAccrossExecutions()
      key.hash(into: &hasher)
      return String(hasher.finalize())
        
    }
    
   /* - Parameter key: Unique key to identify the object in the cache
    - Returns: A string path based on key
    */
    
   func makeFilePath(for key: Key) -> String {
      
       return storedPath + "/" + makeFileName(for: key)
   
   }
    
    
}

extension CachedWebImage: ICachedWebImage{
   
    func getImagePath() -> String {
         return storedPath
    }
    
    func totalImageSize() -> Int {
        if let directory = URL(string: self.storedPath), let size = self.fileManager.sizeOfDirectory(at: directory) {
          return size
        }
        return 0
    }
    
    
    func image(key: Key) -> WebImage? {
        
        lock.lock(); defer { lock.unlock() }
        let filePath = makeFilePath(for: key)
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: filePath, isDirectory: false)) , let image = decodeImage(data: data, scale: key.scale) else{
            return nil
        }
        
        return image
    }
    
    func insertImage(_ image: WebImage?, key: Key) {
        
        guard let image = image else { return removeImage(key: key) }
        
        lock.lock(); defer { lock.unlock() }
       
        let data = image.pngData()
        let filePath = makeFilePath(for: key)
        
        _ = fileManager.createFile(atPath: filePath, contents: data, attributes: nil)
        
        
    }
    
    func removeImage(key: Key) {
        
        lock.lock(); defer { lock.unlock() }
        
        
        let filePath = makeFilePath(for: key)
        try? fileManager.removeItem(atPath: filePath)
    }
    
    func removeAllImages() {
        
        lock.lock(); defer { lock.unlock() }
        try? fileManager.removeItem(atPath: storedPath)
        createDirectory()
        
    }
    

    
    subscript(key: Key) -> WebImage? {
        get {
            return image(key: key)
        }
        set {
            return insertImage(newValue, key: key)
        }
    }
    
    
}
