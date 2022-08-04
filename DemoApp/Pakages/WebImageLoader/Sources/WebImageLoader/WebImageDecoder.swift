//
//  File.swift
//  
//
//  Created by Lohith on 03/08/2022.
//

#if os(iOS) || os(tvOS) || os(watchOS)
  import UIKit

  public typealias WebImage = UIImage

  func decodeImage( data: Data, scale: CGFloat)  -> WebImage? {
    guard let image = UIImage(data: data, scale: scale) else {
      return nil
    }

    // Inflates the underlying compressed image data to be backed by an uncompressed bitmap representation.
    _ = image.cgImage?.dataProvider?.data

    return image
  }

#elseif os(macOS)
  import Cocoa

  public typealias WebImage = NSImage

  func decodeImage(from data: Data, scale _: CGFloat)  -> WebImage? {
    guard let bitmapImageRep = NSBitmapImageRep(data: data) else {
      return nil
    }

    let image = NSImage(
      size: NSSize(
        width: bitmapImageRep.pixelsWide,
        height: bitmapImageRep.pixelsHigh
      )
    )
    image.addRepresentation(bitmapImageRep)

    return image
  }
#endif
