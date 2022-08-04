//
//  File.swift
//  
//
//  Created by Lohith on 04/08/2022.
//

import Foundation

extension FileManager {
  /**
   Calculates the size of the directory at the provided `URL`
   - parameter url: the directory url
   - returns: the size of the provided directory in bytes
   */
  public func sizeOfDirectory(at url: URL) -> Int? {
    guard let enumerator = self.enumerator(at: url, includingPropertiesForKeys: [], options: [], errorHandler: { _, _ -> Bool in
      return false
    }) else {
      return nil
    }
    var size = 0
    for case let url as URL in enumerator {
      size += url.fileSize ?? 0
    }
    return size
  }
}




extension URL {
  /// Returns the file size of the file at the given `URL` in bytes
  var fileSize: Int? {
    do {
      let file = try self.resourceValues(forKeys: [.totalFileAllocatedSizeKey, .fileAllocatedSizeKey])
      return file.totalFileAllocatedSize ?? file.fileAllocatedSize
    } catch {
      return nil
    }
  }
}


extension Hasher {
    // Stolen from https://github.com/apple/swift/blob/master/stdlib/public/core/SipHash.swift
    // in order to replicate the exact format in bytes
    private struct _State {
      private var v0: UInt64 = 0x736f6d6570736575
      private var v1: UInt64 = 0x646f72616e646f6d
      private var v2: UInt64 = 0x6c7967656e657261
      private var v3: UInt64 = 0x7465646279746573
      private var v4: UInt64 = 0
      private var v5: UInt64 = 0
      private var v6: UInt64 = 0
      private var v7: UInt64 = 0
    }

    static func constantAccrossExecutions() -> Hasher {
        let offset = MemoryLayout<Hasher>.size - MemoryLayout<_State>.size
        var hasher = Hasher()
        withUnsafeMutableBytes(of: &hasher) { pointer in
            pointer.baseAddress!.storeBytes(of: _State(), toByteOffset: offset, as: _State.self)
        }
        return hasher
    }
}
