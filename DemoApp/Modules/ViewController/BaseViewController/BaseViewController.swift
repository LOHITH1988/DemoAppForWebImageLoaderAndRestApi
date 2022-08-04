//
//  BaseViewController.swift
//  DemoApp
//
//  Created by Lohith on 04/08/2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    @IBOutlet weak var displayLabel : UILabel!

    override func viewDidLoad() {
      
        super.viewDidLoad()
        displayLabel.text = ""
        // Do any additional setup after loading the view.
    }
    

    @IBAction func onClearAllButtunPressed(_ sender : Any){
      
        clearAllData()
        displayLabel.text = "All Images got cleared"
    }
    
    @IBAction func onGetImageStoragePath(_ sender : Any){
        displayLabel.text = "Path :" + getCachedImageAddress()
 
    }
    
    @IBAction func onGetImageStorageSize(_ sender : Any){
        
        displayLabel.text = "Size :" + getCashedImageSize()
 
    }

}

extension BaseViewController : IBaseViewModel{
    
    
    
}
