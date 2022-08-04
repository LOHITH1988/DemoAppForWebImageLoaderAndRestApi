//
//  IProductDetails.swift
//  DemoApp
//
//  Created by Lohith on 04/08/2022.
//

import Foundation

protocol IPosterDetailsViewModel{
    
    func getPosterCount() -> Int
    func getSelectPoster( _ index : Int) -> PosterDetail?
    func getPosters()
    
}
