//
//  PosterDetails.swift
//  DemoApp
//
//  Created by Lohith on 04/08/2022.
//

import Foundation
import RestApiWrapper


class PosterDetailsRepo : IPosterDetailsRepo{

    var repoService : IRestApiWrapper!
    init( repoService : IRestApiWrapper = RestApiWrapper()){
        self.repoService = repoService
    }
    
    func getPosterDetails(completion: @escaping ([PosterDetail]?, String?) -> Void) {
        
        repoService.load(resource: getResource()) { result in
            switch result{
            case .failure( _ ):
                
                completion(nil, "Some Error Occured")
                
                
            case .success(let data):
                
                completion(data, nil)

               
                
            }
        }
    }
    
    private func getResource() -> Resource<[PosterDetail], PosterDetail>{
        
        return Resource<[PosterDetail] , PosterDetail>(url: url , httpMethod: .get,httpHeader:headers )
    }
    
    
    
}
