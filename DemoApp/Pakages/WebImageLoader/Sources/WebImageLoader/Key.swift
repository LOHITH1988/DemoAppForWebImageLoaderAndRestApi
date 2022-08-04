//
//  Key.swift
//  
//
//  Created by Lohith on 03/08/2022.
//

import Foundation
import UIKit

class Key : Hashable{
    
   
    
    let url : URL
    let scale : CGFloat
    
    init(_ url: URL, _ scale: CGFloat = 1) {
      self.url = url
      self.scale = scale
    }
    
    static func == (lhs: Key, rhs: Key) -> Bool {
        return lhs.url.absoluteString == rhs.url.absoluteString && lhs.scale == rhs.scale
    }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(url.absoluteString)
           hasher.combine(scale)
    }
    
    
    

}

