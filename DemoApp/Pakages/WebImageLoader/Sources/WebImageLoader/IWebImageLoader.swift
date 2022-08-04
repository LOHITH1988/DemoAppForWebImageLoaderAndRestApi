//
//  File.swift
//  
//
//  Created by Lohith on 03/08/2022.
//

import Foundation
import UIKit

public protocol IWebImageLoader : IWebImageBase{
    
    // load image from url
    func loadImage(url: URL ,  scale : CGFloat ,  completion : @escaping (WebImage?) -> Void)
    
    // Removes the image of the specified url in the cache
    func removeImage( url: URL ,  scale : CGFloat )
       
  
}
