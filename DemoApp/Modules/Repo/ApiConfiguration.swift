//
//  ApiConfiguration.swift
//  DemoApp
//
//  Created by Lohith on 04/08/2022.
//

import Foundation


protocol ApiConfiguration{
    
    var headers : [String: String] {get}
   
    var url : URL {get}
    
}


extension ApiConfiguration{
   
    var headers:  [String: String]  {
        
         return ["Accept": "application/json",
                 "Accept-Encoding":"gzip,deflate",
                 "Content-Type" :"application/json"]
    }
    
    var url : URL {
        
        return URL(string:  Constant.productDetailsUrl)!
    }
    
    
}
