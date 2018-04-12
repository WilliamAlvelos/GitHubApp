//
//  GithubTableViewController.swift
//  GitHub
//
//  Created by William Alvelos on 14/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import UIKit
import UIScrollView_InfiniteScroll

class GithubTableViewController: UITableViewController {

    //MARK: - Vars and lets
    var repositories: [Repository] = [Repository]() {
        didSet {
            if repositories.count == 0 {
                tableView.separatorStyle = .none
            } else {
                tableView.separatorStyle = .singleLine
            }
            self.tableView.reloadData()
        }
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let githubPresenter: GithubPresenter = GithubPresenter()
    var tableViewRefreshControl: UIRefreshControl = UIRefreshControl()
    
    var forkBarButton: UIBarButtonItem?
    var starBarButton: UIBarButtonItem?
    
    
    //MARK: - Cycle of life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTitle(title: "GitHub")
        self.setNeedsStatusBarAppearanceUpdate()
        self.configViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        githubPresenter.attachView(delegate: self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideBackButton()
        githubPresenter.detachView()
    }
    

    //MARK:- Body
    
    //MARK: ConfigViewController
    func configViewController(){
        starBarButton = UIBarButtonItem(image: Images.icStar, style: .plain, target: self, action: #selector(rightButtonActionStar(sender:)))
        forkBarButton = UIBarButtonItem(image: Images.icFork, style: .plain, target: self, action: #selector(rightButtonActionFork(sender:)))
        
        ActivityIndicator.show(view: self.view)
        githubPresenter.getFirstPageRepositories()
        
        addRefreshInTableView()
        addSearchInTableHeader()

        self.navigationItem.rightBarButtonItems = [starBarButton!, forkBarButton!]
    }
    
    @objc func rightButtonActionStar(sender: UIBarButtonItem){
        sender.tintColor = Colors.secondary
        forkBarButton?.tintColor = Colors.quinary
        githubPresenter.sort = "stars"
    }
    
    @objc func rightButtonActionFork(sender: UIBarButtonItem){
        sender.tintColor = Colors.secondary
        starBarButton?.tintColor = Colors.quinary
        githubPresenter.sort = "forks"
    }
    
    //MARK: Search
    func addSearchInTableHeader(){
        
        searchController.configWith(delegate: self)

        if #available(iOS 11.0, *) {
            self.navigationItem.hidesSearchBarWhenScrolling = true
            self.navigationItem.searchController = searchController
        }
    }
    
    //MARK: Refresh
    func addRefreshInTableView(){
    
        self.tableViewRefreshControl.config()
        self.tableViewRefreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
        
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl = self.tableViewRefreshControl
        } else {
            self.tableView.tableHeaderView?.addSubview(self.tableViewRefreshControl)
        }
        
        //MARK: Infinity Scroll
        tableView.addInfiniteScroll { (tableView) -> Void in
            self.githubPresenter.getRepositories()
        }
    }
    
    @objc func refresh(){
        self.githubPresenter.getFirstPageRepositories()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RepositoryDetailViewController{
            destination.repository = sender as? Repository
        }
        
        if let destination = segue.destination as? ErrorViewController{
            destination.error = sender as? NSError
        }
    }

}


//MARK: - TableView Implementation

extension GithubTableViewController{
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.ReuseIdentifiers.githubCell, for: indexPath) as! GithubTableViewCell
        
        let repository = repositories[indexPath.item]
        
        cell.configCellWith(repository)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: Constants.SegueIdentifiers.showDetail, sender: repositories[indexPath.item])
    }
    
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

}

//MARK: - UISearchBarDelegate Implementation

extension GithubTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        githubPresenter.query = searchBar.text!
        self.configTitle(title: searchBar.text!)
        githubPresenter.getFirstPageRepositories()
        searchBar.resignFirstResponder()
        self.searchController.isActive = false
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            repositories = githubPresenter.repositories
        } else {
            repositories = repositories.filter({$0.language == searchBar.text})
        }
    }
}


//MARK: - Presenter Implementation

extension GithubTableViewController: GithubPresenterProtocol {
    
    func finishLoading() {
        self.refreshControl?.endRefreshing()
        tableView.finishInfiniteScroll()
    }
    
    func setRepositories(repositories: [Repository]) {
        self.repositories = repositories
        ActivityIndicator.stopAnimating()
    }
    
    func setRepositoriesPaged(repositories: [Repository]) {
        self.repositories += repositories
    }
    
    func setErrorWith(error: Error) {
        tableView.separatorStyle = .none
        self.performSegue(withIdentifier: Constants.SegueIdentifiers.errorView, sender: error)
    }
    
    func setEmptyRepositories() {
        tableView.separatorStyle = .none
        let error = NSError(domain: "", code: AlamoError.JSONNil.rawValue, userInfo: nil)
        self.performSegue(withIdentifier: Constants.SegueIdentifiers.errorView, sender: error)
    }
}
