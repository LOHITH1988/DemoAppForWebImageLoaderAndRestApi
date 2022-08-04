//
//  File.swift
//  
//
//  Created by Lohith on 04/08/2022.
//

import Foundation

public protocol IWebImageBase{
    
    

       
    // Removes all images from the cache
    func removeAllImages()

    
    // Removes all images from the cache
    func getImagePath() -> String
    
    
    // get Total image size
    func totalImageSize() -> Int

}
