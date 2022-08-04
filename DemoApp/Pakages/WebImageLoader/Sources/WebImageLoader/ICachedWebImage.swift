//
//  ICachedWebImage.swift
//  
//
//  Created by Lohith on 03/08/2022.
//

import Foundation

protocol ICachedWebImage : IWebImageBase{

        // Returns the image associated with a given url
    func image(key : Key ) -> WebImage?
        // Inserts the image of the specified url in the cache
    func insertImage(_ image: WebImage?, key : Key)
        // Removes the image of the specified url in the cache
    func removeImage( key : Key)

    
    // Accesses the value associated with the given key for reading and writing
    subscript(_ key : Key) -> WebImage? { get set }
    

    
}
