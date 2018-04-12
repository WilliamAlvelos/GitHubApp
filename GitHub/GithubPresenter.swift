//
//  GithubPresenter.swift
//  GitHub
//
//  Created by William Alvelos on 15/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation

protocol GithubPresenterProtocol: NSObjectProtocol {
    func finishLoading()
    func setRepositories(repositories: [Repository])
    func setRepositoriesPaged(repositories: [Repository])
    func setEmptyRepositories()
    func setErrorWith(error: Error)
}


class GithubPresenter {
    weak private var delegate : GithubPresenterProtocol?
    
    var repositories = [Repository]()
    
    var query = ""

    var querySearch: String {
        if query == "" {
            return "q=Swift&"
        } else {
            return "q=\(query)&"
        }
    }
    
    var sort = "" {
        didSet {
            self.getFirstPageRepositories()
        }
    }
    
    var sortSearch: String {
        if sort == "" {
            return ""
        } else {
            return "sort=\(sort)&"
        }
    }
    
    func attachView(delegate: GithubPresenterProtocol){
        self.delegate = delegate
    }
    
    func detachView() {
        delegate = nil
    }
    
    @objc func getFirstPageRepositories(){
        APIGithubManager.page = 1
        self.getRepositories()
    }
    
    func getRepositories(){
        APIGithubManager.getRepositoriesList(query: querySearch, sort: sortSearch, success: { (total_count, incomplete_results, repositories) in
            
            if repositories.count == 0 && APIGithubManager.page == 1 {
                self.delegate?.setEmptyRepositories()
            } else {
                if APIGithubManager.page == 1 {
                    self.delegate?.setRepositories(repositories: repositories)
                    self.repositories = repositories
                } else {
                    self.delegate?.setRepositoriesPaged(repositories: repositories)
                    self.repositories += repositories
                }
                
                APIGithubManager.page += 1
            }
            
            self.delegate?.finishLoading()
        }) { (error) in
            self.delegate?.setErrorWith(error: error)
            self.delegate?.finishLoading()
        }
    }
}
