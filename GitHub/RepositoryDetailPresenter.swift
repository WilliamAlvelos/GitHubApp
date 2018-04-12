//
//  RepositoryDetailPresenter.swift
//  GitHub
//
//  Created by William Alvelos on 16/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation

protocol RepositoryDetailPresenterProtocol: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setPullRequests(pullRequests: [PullRequest], open: Int, close: Int)
    func setEmptyPullRequests()
    func setErrorWith(error: Error)
}


class RepositoryDetailPresenter {
    weak private var delegate : RepositoryDetailPresenterProtocol?
    
    func attachView(delegate: RepositoryDetailPresenterProtocol){
        self.delegate = delegate
    }
    
    func detachView() {
        delegate = nil
    }
    
    func getPullRequestsWith(_ repository: Repository?){
        self.delegate?.startLoading()
        
        APIGithubManager.getPullRequestsList(repository: repository, success: { (pullRequests, open, close) in
            
            pullRequests.count == 0 ? self.delegate?.setEmptyPullRequests() : self.delegate?.setPullRequests(pullRequests: pullRequests, open: open, close: close)
            
            self.delegate?.finishLoading()
        }) { (error) in
            self.delegate?.setErrorWith(error: error)
        }
    }
}
