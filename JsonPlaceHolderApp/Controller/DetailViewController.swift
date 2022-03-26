//
//  DetailViewController.swift
//  JsonPlaceHolderApp
//
//  Created by Fernando Gomes on 24/03/2022.
//

import Foundation
import UIKit

class DetailViewController : UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var favoriteButton: UIBarButtonItem!
    
    //MARK: - Properties
    var post: PostDto? = nil
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString(Constants.detailView_title, comment: "Title for Navigation Bar")
        setFavorite()
        tableView.delegate = self
        tableView.dataSource = self
    
    }
    
    //MARK: - Functions
    private func setFavorite(){
        favoriteButton.image = post!.favorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        
    }
    
    //MARK: - IBActions
    @IBAction func favoriteAction(_ sender: Any) {
        post!.favorite = !post!.favorite
        setFavorite()
    }
    
}

//MARK: - TableView Delegates
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: "descriptionCell", for: indexPath) as! DescriptionViewCell
            cell.setCell(body: post!)
            return cell
        }else if (indexPath.row == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "commentsCell", for: indexPath)
            return cell
        }
    }
}

//MARK: - DescriptionView Cell
class DescriptionViewCell: UITableViewCell {
    
    @IBOutlet weak var descriptionBody: UILabel!
    @IBOutlet weak var descripTitle: UILabel!
    override func awakeFromNib() {
        descripTitle.text = NSLocalizedString(Constants.descriptionCell_title, comment: "Description Title")
    }
    
    func setCell(body post: PostDto){
        descriptionBody.text = post.body
    }
}
//MARK: - UserView Cell
class UserViewCell: UITableViewCell {

    @IBOutlet weak var userTitleLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var webLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    override func awakeFromNib() {
        userTitleLabel.text = "Prueba"
        commentsLabel.text = "Funciona"
    }
}
