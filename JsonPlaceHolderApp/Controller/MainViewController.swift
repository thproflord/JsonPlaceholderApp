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
    
    @IBOutlet weak var tableView: UITableView!
    
    var postArray : [String] = ["Prueba1" , "Prueba2", "Prueba3", "Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3Prueba3"]
    var favoriteArray : [Bool] = [true,false,false,true]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTranslations()
        setViews()
        setupTableView()
        
    }
    
    // MARK: - SetupVIews
    
    private func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setViews() {
        

        listSegmented.layer.backgroundColor = UIColor.white.cgColor
        listSegmented.layer.borderWidth = 2
        listSegmented.layer.borderColor = UIColor.systemTeal.cgColor
        listSegmented.setTitleTextAttributes([.foregroundColor: UIColor.systemTeal], for: .normal)
        listSegmented.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        
    }
    
    private func setTranslations(){
        
        self.listSegmented.setTitle(NSLocalizedString("mainView_segment1", comment: ""), forSegmentAt: 0)
        self.listSegmented.setTitle(NSLocalizedString("mainView_segment2", comment: ""), forSegmentAt: 1)
        self.title = NSLocalizedString("mainView_title", comment: "Title for Navigation Bar")
        self.deleteAllButon.setTitle(NSLocalizedString("mainView_deleteAll", comment: "Text for DeleteAll Button"), for: .normal)
    }

}


// MARK: - Table View Delegates
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCellView", for: indexPath) as! PostCell
        cell.setCell(title: self.postArray[indexPath.row], favorite: self.favoriteArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    

}

class PostCell : UITableViewCell {
    
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    
    override  func awakeFromNib() {
        
    }
    
    func setCell(title : String, favorite : Bool){
        titleText.text = title
        favoriteImage.isHidden = (favorite ?  false : true)
    }
}
 
