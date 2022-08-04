//
//  ProductDetailsViewModel.swift
//  DemoApp
//
//  Created by Lohith on 04/08/2022.
//

import Foundation


class PosterDetailsViewModel {
    
    private var posterDetails : [PosterDetail]?
    private var posterRepo : IPosterDetailsRepo!
    private weak var  viewDelegate : PosterDetailViewDelegate?
    init(posterRepo : IPosterDetailsRepo = PosterDetailsRepo() , viewDelegate :  PosterDetailViewDelegate?){
        self.posterRepo = posterRepo
        self.viewDelegate = viewDelegate
    }
    
    
}

extension PosterDetailsViewModel : IPosterDetailsViewModel{
    
    func getPosters() {
        
        posterRepo.getPosterDetails {[weak self] posters, errorMessage in
            DispatchQueue.main.async { [weak self] in
                
                self?.posterDetails = posters
                self?.viewDelegate?.reloadTableView()
                  
            }
        }
    }
    
  
    func getPosterCount() -> Int {
        return posterDetails?.count ?? 0
    }
    
    func getSelectPoster(_ index: Int) -> PosterDetail? {
        
        guard let posterDetails = posterDetails , posterDetails.count > index else {
            return nil
        }
        return posterDetails[index]
        
    }
    
    
}
