//
//  PosterTableViewCell.swift
//  DemoApp
//
//  Created by Lohith on 04/08/2022.
//

import UIKit

class PosterTableViewCell: UITableViewCell {

    @IBOutlet weak  var subtitle: UILabel!
    @IBOutlet weak  var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func loadData(_ data :PosterDetail ){
        
        subtitle.text = data.originalTitle ?? ""
        posterImageView.loadImageView(data.posterPath, placeHolder: UIImage(named: "place_holder")!, errorImage: UIImage(named: "error_image"))
    }

}
