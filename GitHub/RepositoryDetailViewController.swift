//
//  RepositoryDetailViewController.swift
//  GitHub
//
//  Created by William Alvelos on 15/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import UIKit

class RepositoryDetailViewController: UIViewController {

    //MARK: - Vars and lets
    var repository: Repository?
    
    var pullRequests: [PullRequest] = [PullRequest]() {
        didSet{
            self.tableViewPullRequests.reloadData()
        }
    }
    private let repositoryDetailPresenter: RepositoryDetailPresenter  = RepositoryDetailPresenter()
    var tableViewRefreshControl: UIRefreshControl = UIRefreshControl()
    
    //MARK: - IBOutlets
    @IBOutlet weak var tableViewPullRequests: UITableView!
    
    //MARK: ViewError
    @IBOutlet weak var viewError: UIView!
    @IBOutlet weak var imgErrorPlaceholder: UIImageView!
    @IBOutlet weak var lblErrorText: UILabel!
    
    //MARK: ViewPullRequests Count
    @IBOutlet weak var viewPullRequestsCount: UIView!
    @IBOutlet weak var lblPullRequestsOpen: UILabel!
    @IBOutlet weak var lblPullRequestsClose: UILabel!
    
    //MARK: - Cycle of life
    override func viewDidLoad() {
        super.viewDidLoad()
        repositoryDetailPresenter.attachView(delegate: self)
        repositoryDetailPresenter.getPullRequestsWith(repository)
        configTitle(title: repository?.name ?? "Nome do Repositório")
        
        configViewController()
    }

    
    //MARK: - Body
    func configViewErrorWith(error: Error){
        imgErrorPlaceholder.image = Images.errorPlaceholder
        lblErrorText.text = ErrorManager.message(error: error)
    }
    
    
    func configViewController(){
        viewPullRequestsCount.shadow(color: Constants.shadow.cgColor)
        lblPullRequestsOpen.textColor = Colors.quaternary
        lblPullRequestsClose.textColor = Colors.primary
        
        tableViewPullRequests.rowHeight = UITableViewAutomaticDimension
        tableViewPullRequests.estimatedRowHeight = 150
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}

//MARK: - TableView Implementation

extension RepositoryDetailViewController: UITableViewDelegate, UITableViewDataSource{
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pullRequests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repositoryDetailCellReuseIdentifier", for: indexPath) as! RepositoryDetailTableViewCell
        
        let pullRequest = pullRequests[indexPath.item]
        
        cell.configCellWith(pullRequest)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = URL(string: pullRequests[indexPath.item].html_url ?? ""){
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:], completionHandler: { (finished) in
                    self.tableViewPullRequests.deselectRow(at: indexPath, animated: true)
                })
            }
        }
        
    }
    
}

//MARK: - Presenter Implementation
extension RepositoryDetailViewController : RepositoryDetailPresenterProtocol{

    func startLoading(){
        ActivityIndicator.show(view: self.view)
        tableViewPullRequests.isHidden = true
        viewPullRequestsCount.isHidden = true
        viewError.isHidden = true
    }
    func finishLoading(){
        ActivityIndicator.stopAnimating()
    }
    func setPullRequests(pullRequests: [PullRequest], open: Int, close: Int) {
        self.pullRequests = pullRequests
        tableViewPullRequests.isHidden = false
        viewPullRequestsCount.isHidden = false
        viewError.isHidden = true
        
        lblPullRequestsOpen.text  = "\(open) opened"
        lblPullRequestsClose.text = "/ \(close) closed"
    }
    
    func setEmptyPullRequests(){
        tableViewPullRequests.isHidden = true
        viewPullRequestsCount.isHidden = true
        viewError.isHidden = false
    }
    func setErrorWith(error: Error){
        tableViewPullRequests.isHidden = true
        viewPullRequestsCount.isHidden = true
        viewError.isHidden = false
    }
}
