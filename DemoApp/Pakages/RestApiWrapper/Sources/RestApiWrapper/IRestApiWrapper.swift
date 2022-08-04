//
//  IRestApiWrapper.swift
//  
//
//  Created by Lohith on 02/08/2022.
//

import Foundation

public protocol IRestApiWrapper{
    
    func load<T, K>(resource: Resource<T, K>, completion: @escaping (Result<T?, NetworkError>) -> Void)
    
}
