//
//  UIImageView+Ex.swift
//  DemoApp
//
//  Created by Lohith on 04/08/2022.
//

import Foundation
import UIKit
import WebImageLoader


extension UIImageView{
    
    
    func loadImageView( _ urlString : String? , placeHolder : UIImage , errorImage : UIImage? = nil){
        
        self.image = placeHolder
        
        guard let urlString = urlString  , let url = URL(string: urlString) else  {
            return
        }
        
        WebImageLoader.shared.loadImage(url: url) { [weak self] image in
            
            DispatchQueue.main.async { [weak self] in
                guard let image = image else{
                    
                    if errorImage != nil{
                        self?.image = errorImage
                    }
                    return
                }
                self?.image = image
            }
           
        }

        
        
    }
}
