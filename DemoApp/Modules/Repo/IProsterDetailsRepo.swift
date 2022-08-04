//
//  IProsterDetails.swift
//  DemoApp
//
//  Created by Lohith on 04/08/2022.
//

import Foundation


protocol IPosterDetailsRepo : ApiConfiguration {
    
    func getPosterDetails(completion: @escaping(_ posters :[PosterDetail]?  ,_  errorMessage : String? )-> Void)
}
