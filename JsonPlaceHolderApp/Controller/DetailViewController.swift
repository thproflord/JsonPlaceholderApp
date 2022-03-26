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
    var user: UserDto? = nil
    var commentsList :[CommentDto] = []
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTranslations()
        setFavorite()
        setTableView()
        fetchData()
    
    }
    
    //MARK: - Functions
    private func setFavorite(){
        favoriteButton.image = post!.favorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        
    }
    
    private func setTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setTranslations(){
        self.title = NSLocalizedString(Constants.detailView_title, comment: "Title for Navigation Bar")
    }
    
    private func fetchData(){
        if(Reachability.isConnectedToNetwork()){
            let group = DispatchGroup()
            group.enter()
            DispatchQueue.global().async {
                self.user = DetailViewService.getUserfromPost(userId: self.post!.userId)
                self.commentsList = DetailViewService.getCommentsList(postId: self.post!.id)
                group.leave()
            }
            group.notify(queue: .main){
                self.tableView.reloadData()
            }
        } else {
            Reachability.dispatchAlert(self)
        }
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
        return Constants.detailView_staticCells + commentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.descriptionCell, for: indexPath) as! DescriptionViewCell
            cell.setCell(body: post!)
            return cell
        }else if (indexPath.row == 1){
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.userCell, for: indexPath) as! UserViewCell
            if let safeUser = self.user {
                cell.setCell(author: safeUser)
            }
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.commentsCell, for: indexPath) as! CommentViewCell
            cell.setCell(comment: commentsList[indexPath.row - Constants.detailView_staticCells])
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
        userTitleLabel.text = NSLocalizedString(Constants.user_title, comment: "Title for User Section")
        commentsLabel.text = NSLocalizedString(Constants.comments_title, comment: "Title for Comments Section")
    }
    
    func setCell(author user : UserDto){
        usernameLabel.text = NSLocalizedString(Constants.name_label, comment: "Label for the name") + ":  \(user.name)"
        emailLabel.text = NSLocalizedString(Constants.email_label, comment: "Label for the email") + ": \(user.email)"
        phoneLabel.text = NSLocalizedString(Constants.phone_label, comment: "Label for the phone") + ": \(user.phone)"
        webLabel.text = NSLocalizedString(Constants.web_label, comment: "Label for the web") + ": \(user.website)"
    }
}

//MARK: - CommentsView Cell
class CommentViewCell : UITableViewCell {
    
    @IBOutlet weak var emailLabelComment : UILabel!
    @IBOutlet weak var commentBody : UILabel!
    
    override class func awakeFromNib() {
        
    }
    
    func setCell(comment : CommentDto) {
        emailLabelComment.text = comment.email
        commentBody.text = comment.body
        
    }
}
