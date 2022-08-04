//
//  PosterDetails.swift
//  DemoApp
//
//  Created by Lohith on 04/08/2022.
//

import Foundation


// MARK: - PosterDetail
struct PosterDetail: Codable {
    
    let posterPath: String?
    let id: Int?
    let originalTitle :String?
    let originalLanguage: String?
    let popularity: Double?

    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case id = "id"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case popularity = "popularity"
    }
}

typealias PosterDetails = [PosterDetail]
