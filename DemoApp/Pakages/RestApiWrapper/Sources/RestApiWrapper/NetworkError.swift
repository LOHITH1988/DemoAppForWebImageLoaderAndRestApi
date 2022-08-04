//
//  NetworkError.swift
//  
//
//  Created by Lohith on 02/08/2022.
//

import Foundation

public enum NetworkError: Error {
    
    case transportError(Error)
    case serverError(statusCode: Int)
    case noData
    case decodingError
    case encodingError(Error)
    

}
