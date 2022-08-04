# WebImageLoader

Web Image Loader is image Cache Pacage, download and store Images  into File manager


## Changelog
v1.0.0 (demo)


## Usage
A network image downloads and displays an image from a given URL; the download is asynchronous,

Once images downloaded it will store it in to Flie manager

Can create UIImageView extention like

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

 
//To removes all images from the cache
 
 WebImageLoader.shared.removeAllImages()

    
// to Know where the images are stored

WebImageLoader.sharedgetImagePath() -> String
    
    
// to get Total image size

WebImageLoader.totalImageSize() -> Int





