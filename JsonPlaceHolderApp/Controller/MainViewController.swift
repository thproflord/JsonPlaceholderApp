//
//  ViewController.swift
//  JsonPlaceHolderApp
//
//  Created by Fernando Gomes on 24/03/2022.
//

import UIKit
import SwipeCellKit
class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var deleteAllButon: UIButton!
    @IBOutlet weak var listSegmented: UISegmentedControl!
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var postArray : [PostDto] = []
    var index = 0
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTranslations()
        setViews()
        setupTableView()
        loadItems()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    // MARK: - SetupVIews
    
    private func setupTableView(){

        tableView.delegate = self
        tableView.dataSource = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(doSomething), for: .valueChanged)
        tableView.refreshControl = refreshControl

    }
    
    @objc func doSomething(refreshControl: UIRefreshControl) {
        fetchPost()
        refreshControl.endRefreshing()
    }
    
    private func fetchPost(){
        if(Reachability.isConnectedToNetwork()){
            let group = DispatchGroup()
            group.enter()
            DispatchQueue.global().async {
                self.postArray = MainViewService.getPostList()
                group.leave()
            }
            group.notify(queue: .main){
                self.tableView.reloadData()
               
            }
        } else {
            Reachability.dispatchAlert(self)
        }
    }
    
    private func setViews() {
        listSegmented.layer.backgroundColor = UIColor.white.cgColor
        listSegmented.layer.borderWidth = 2
        listSegmented.layer.borderColor = UIColor.systemTeal.cgColor
        listSegmented.setTitleTextAttributes([.foregroundColor: UIColor.systemTeal], for: .normal)
        listSegmented.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
    }
    
    private func setTranslations(){
        
        self.listSegmented.setTitle(NSLocalizedString(Constants.mainView_segment1, comment: ""), forSegmentAt: 0)
        self.listSegmented.setTitle(NSLocalizedString(Constants.mainView_segment2, comment: ""), forSegmentAt: 1)
        self.title = NSLocalizedString(Constants.mainView_title, comment: "Title for Navigation Bar")
        self.deleteAllButon.setTitle(NSLocalizedString(Constants.mainView_deleteAll, comment: "Text for DeleteAll Button"), for: .normal)
    }
    
    func showAlertWithDistructiveButton() {
        let alert = UIAlertController(title: Constants.deleteAll_title, message: Constants.deleteAll_description, preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: Constants.deleteAll_cancel, style: .default))
        alert.addAction(UIAlertAction(title: Constants.deleteAll_delete,
                                          style: .destructive) { _ in
                self.deletePosts()
            })
            self.present(alert, animated: true, completion: nil)
        }
    // MARK: - Functions
    
    private func deletePosts() {
        startIndicator()
        postArray = []
        tableView.reloadData()
        stopIndicator()
    }
    
    private func loadItems(){
        if(postArray.isEmpty){
            startIndicator()
            fetchPost()
            stopIndicator()
        }
    }
    // MARK: - IBActions
    @IBAction func deleteAll(_ sender: UIButton) {
        showAlertWithDistructiveButton()
    }
    
    // MARK: - Prepare Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.destination is DetailViewController {
            let vc = segue.destination as? DetailViewController
            vc?.post = postArray[index]
        }
    }
}


// MARK: - Table View Delegates
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.postCell, for: indexPath) as! PostCell
        cell.delegate = self
        cell.setCell(post: self.postArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.index = indexPath.row
        performSegue(withIdentifier: Constants.toDetail, sender: nil)
    }
}


// MARK: - SwipeTableViewCell Delegate
extension MainViewController : SwipeTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil }
        let deleteAction = SwipeAction(style: .destructive, title: Constants.deleteAll_delete) { action, indexPath in
            self.postArray.remove(at: indexPath.row)
        }
        return [deleteAction]
    }
    
    func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
        var options = SwipeOptions()
        options.expansionStyle = .destructive
        options.transitionStyle = .border
        return options
    }
    
    
}
// MARK: - PostViewCell

class PostCell : SwipeTableViewCell {
    
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var titleText: UILabel!
    
    override  func awakeFromNib() {
        
    }
    
    func setCell(post : PostDto){
        titleText.text = post.title
        favoriteImage.isHidden = (post.favorite ?  false : true)
    }
}
 
