//
//  IBaseViewModel.swift
//  DemoApp
//
//  Created by Lohith on 04/08/2022.
//

import Foundation
import WebImageLoader

protocol IBaseViewModel{
      
    
    func clearAllData()
    func getCachedImageAddress() -> String
    func getCashedImageSize() -> String
    
}

extension IBaseViewModel{
    
    func clearAllData(){
        
        WebImageLoader.shared.removeAllImages()
        
    }
    func getCachedImageAddress() -> String{
        return WebImageLoader.shared.getImagePath()
    }
    func getCashedImageSize() -> String{
        
        return String (Double(WebImageLoader.shared.totalImageSize()) * Double(0.000001)) + "In MB"
    }
    
    
}


