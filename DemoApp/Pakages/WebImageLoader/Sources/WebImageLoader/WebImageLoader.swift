
import Foundation
import UIKit
// WebImageLoader will be resposible for loading and saving images it will be single ton class

public final class WebImageLoader {
   
    public static let shared = WebImageLoader()
    private var cache: ICachedWebImage
    
    private init(cache: ICachedWebImage = CachedWebImage()) {
        self.cache = cache
    }
}


extension WebImageLoader : IWebImageLoader{
    
    
    
    public func loadImage(url: URL ,  scale : CGFloat = 1 , completion : @escaping (WebImage?) -> Void){
        
       
        DispatchQueue.global().async { [weak self] in
            
            if let image = self?.cache[Key(url, scale)]{
                  completion(image)
                
                return
            }
            
            let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, _) in
                if let data = data , let image = decodeImage(data: data, scale: scale)  {
                    
                    self?.cache[Key(url, scale)] = image
                    
                        completion(image)
                    
                    
                }else{
                        completion(nil)
                    
                }
            }
            
            // Start Data Task
            dataTask.resume()
        }
    }
    
    // Removes the image of the specified url in the cache
    public func removeImage( url: URL ,  scale : CGFloat = 1 ){
        cache.removeImage(key: Key(url, scale))
    }
    
    // Removes all images from the cache
    public func removeAllImages(){
        cache.removeAllImages()
    }
    
    public func getImagePath() -> String {
        return cache.getImagePath()
    }
    
    public func totalImageSize() -> Int {
        cache.totalImageSize()
    }
    
}
