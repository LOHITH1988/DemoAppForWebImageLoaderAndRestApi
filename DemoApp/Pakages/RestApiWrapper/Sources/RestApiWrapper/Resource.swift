//
//  Resource.swift
//  
//
//  Created by Lohith on 02/08/2022.
//

import Foundation

// type alias HTTPHeaders

public typealias HTTPHeaders = [String: String]


public struct Resource<T: Codable, K: Codable > {
    
    let url: URL
    var httpMethod: HttpMethod
    var parameterModel: K? = nil
    var httpHeader :  HTTPHeaders
    
    public init(url: URL , httpMethod :HttpMethod , httpHeader :HTTPHeaders , parameterModel : K? = nil ) {
        
        self.url = url
        self.httpMethod = httpMethod
        self.httpHeader = httpHeader
        self.parameterModel = parameterModel
    }
    
}

extension Resource{
    
    var body : Data?{
        
        guard let para =  parameterModel , let data = try? JSONEncoder().encode(para) else{
            return nil
        }
        
        return data
    }
}

