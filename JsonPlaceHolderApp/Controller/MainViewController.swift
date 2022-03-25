//
//  ViewController.swift
//  JsonPlaceHolderApp
//
//  Created by Fernando Gomes on 24/03/2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var deleteAllButon: UIButton!
    @IBOutlet weak var listSegmented: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTranslations()
        setViews()
        
    }
    
    private func setViews() {
        
        listSegmented.layer.backgroundColor = UIColor.white.cgColor
        listSegmented.layer.borderWidth = 2
        listSegmented.layer.borderColor = UIColor.systemTeal.cgColor
        listSegmented.setTitleTextAttributes([.foregroundColor: UIColor.systemTeal], for: .normal)
        listSegmented.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
    }
    
    private func setTranslations(){
        
        self.title = NSLocalizedString("mainView_title", comment: "Title for Navigation Bar")
        self.deleteAllButon.setTitle(NSLocalizedString("mainView_deleteAll", comment: "Text for DeleteAll Button"), for: .normal)
    }
    

    
}
