//
//  Repository.swift
//  GitHub
//
//  Created by William Alvelos on 14/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation
import SwiftyJSON

class Repository{

    public var id : Int?
    public var name : String?
    public var full_name : String?
    public var owner : Owner?
    public var isPrivate : String?
    public var html_url : String?
    public var description : String?
    public var fork : String?
    public var url : String?
    public var forks_url : String?
    public var keys_url : String?
    public var collaborators_url : String?
    public var teams_url : String?
    public var hooks_url : String?
    public var issue_events_url : String?
    public var events_url : String?
    public var assignees_url : String?
    public var branches_url : String?
    public var tags_url : String?
    public var blobs_url : String?
    public var git_tags_url : String?
    public var git_refs_url : String?
    public var trees_url : String?
    public var statuses_url : String?
    public var languages_url : String?
    public var stargazers_url : String?
    public var contributors_url : String?
    public var subscribers_url : String?
    public var subscription_url : String?
    public var commits_url : String?
    public var git_commits_url : String?
    public var comments_url : String?
    public var issue_comment_url : String?
    public var contents_url : String?
    public var compare_url : String?
    public var merges_url : String?
    public var archive_url : String?
    public var downloads_url : String?
    public var issues_url : String?
    public var pulls_url : String?
    public var milestones_url : String?
    public var notifications_url : String?
    public var labels_url : String?
    public var releases_url : String?
    public var deployments_url : String?
    public var created_at : String?
    public var updated_at : String?
    public var pushed_at : String?
    public var git_url : String?
    public var ssh_url : String?
    public var clone_url : String?
    public var svn_url : String?
    public var homepage : String?
    public var size : Int?
    public var stargazers_count : Int?
    public var watchers_count : Int?
    public var language : String?
    public var has_issues : String?
    public var has_projects : String?
    public var has_downloads : String?
    public var has_wiki : String?
    public var has_pages : String?
    public var forks_count : Int?
    public var mirror_url : String?
    public var open_issues_count : Int?
    public var forks : Int?
    public var open_issues : Int?
    public var watchers : Int?
    public var default_branch : String?
    public var score : Int?
    
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let items = Items(JSON)
     
     - parameter dictionary: JSON.
     
     - returns: Items Instance.
     */
    required public init(json: JSON) {
        
        id = json["id"].intValue
        name = json["name"].stringValue
        full_name = json["full_name"].stringValue
        if (json["owner"] != JSON.null) { owner = Owner(json: json["owner"]) }
        isPrivate = json["private"].stringValue
        html_url = json["html_url"].stringValue
        description = json["description"].stringValue
        fork = json["fork"].stringValue
        url = json["url"].stringValue
        forks_url = json["forks_url"].stringValue
        keys_url = json["keys_url"].stringValue
        collaborators_url = json["collaborators_url"].stringValue
        teams_url = json["teams_url"].stringValue
        hooks_url = json["hooks_url"].stringValue
        issue_events_url = json["issue_events_url"].stringValue
        events_url = json["events_url"].stringValue
        assignees_url = json["assignees_url"].stringValue
        branches_url = json["branches_url"].stringValue
        tags_url = json["tags_url"].stringValue
        blobs_url = json["blobs_url"].stringValue
        git_tags_url = json["git_tags_url"].stringValue
        git_refs_url = json["git_refs_url"].stringValue
        trees_url = json["trees_url"].stringValue
        statuses_url = json["statuses_url"].stringValue
        languages_url = json["languages_url"].stringValue
        stargazers_url = json["stargazers_url"].stringValue
        contributors_url = json["contributors_url"].stringValue
        subscribers_url = json["subscribers_url"].stringValue
        subscription_url = json["subscription_url"].stringValue
        commits_url = json["commits_url"].stringValue
        git_commits_url = json["git_commits_url"].stringValue
        comments_url = json["comments_url"].stringValue
        issue_comment_url = json["issue_comment_url"].stringValue
        contents_url = json["contents_url"].stringValue
        compare_url = json["compare_url"].stringValue
        merges_url = json["merges_url"].stringValue
        archive_url = json["archive_url"].stringValue
        downloads_url = json["downloads_url"].stringValue
        issues_url = json["issues_url"].stringValue
        pulls_url = json["pulls_url"].stringValue
        milestones_url = json["milestones_url"].stringValue
        notifications_url = json["notifications_url"].stringValue
        labels_url = json["labels_url"].stringValue
        releases_url = json["releases_url"].stringValue
        deployments_url = json["deployments_url"].stringValue
        created_at = json["created_at"].stringValue
        updated_at = json["updated_at"].stringValue
        pushed_at = json["pushed_at"].stringValue
        git_url = json["git_url"].stringValue
        ssh_url = json["ssh_url"].stringValue
        clone_url = json["clone_url"].stringValue
        svn_url = json["svn_url"].stringValue
        homepage = json["homepage"].stringValue
        size = json["size"].intValue
        stargazers_count = json["stargazers_count"].intValue
        watchers_count = json["watchers_count"].intValue
        language = json["language"].stringValue
        has_issues = json["has_issues"].stringValue
        has_projects = json["has_projects"].stringValue
        has_downloads = json["has_downloads"].stringValue
        has_wiki = json["has_wiki"].stringValue
        has_pages = json["has_pages"].stringValue
        forks_count = json["forks_count"].intValue
        mirror_url = json["mirror_url"].stringValue
        open_issues_count = json["open_issues_count"].intValue
        forks = json["forks"].intValue
        open_issues = json["open_issues"].intValue
        watchers = json["watchers"].intValue
        default_branch = json["default_branch"].stringValue
        score = json["score"].intValue
    }
    
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.full_name, forKey: "full_name")
        dictionary.setValue(self.owner?.dictionaryRepresentation(), forKey: "owner")
        dictionary.setValue(self.isPrivate, forKey: "private")
        dictionary.setValue(self.html_url, forKey: "html_url")
        dictionary.setValue(self.description, forKey: "description")
        dictionary.setValue(self.fork, forKey: "fork")
        dictionary.setValue(self.url, forKey: "url")
        dictionary.setValue(self.forks_url, forKey: "forks_url")
        dictionary.setValue(self.keys_url, forKey: "keys_url")
        dictionary.setValue(self.collaborators_url, forKey: "collaborators_url")
        dictionary.setValue(self.teams_url, forKey: "teams_url")
        dictionary.setValue(self.hooks_url, forKey: "hooks_url")
        dictionary.setValue(self.issue_events_url, forKey: "issue_events_url")
        dictionary.setValue(self.events_url, forKey: "events_url")
        dictionary.setValue(self.assignees_url, forKey: "assignees_url")
        dictionary.setValue(self.branches_url, forKey: "branches_url")
        dictionary.setValue(self.tags_url, forKey: "tags_url")
        dictionary.setValue(self.blobs_url, forKey: "blobs_url")
        dictionary.setValue(self.git_tags_url, forKey: "git_tags_url")
        dictionary.setValue(self.git_refs_url, forKey: "git_refs_url")
        dictionary.setValue(self.trees_url, forKey: "trees_url")
        dictionary.setValue(self.statuses_url, forKey: "statuses_url")
        dictionary.setValue(self.languages_url, forKey: "languages_url")
        dictionary.setValue(self.stargazers_url, forKey: "stargazers_url")
        dictionary.setValue(self.contributors_url, forKey: "contributors_url")
        dictionary.setValue(self.subscribers_url, forKey: "subscribers_url")
        dictionary.setValue(self.subscription_url, forKey: "subscription_url")
        dictionary.setValue(self.commits_url, forKey: "commits_url")
        dictionary.setValue(self.git_commits_url, forKey: "git_commits_url")
        dictionary.setValue(self.comments_url, forKey: "comments_url")
        dictionary.setValue(self.issue_comment_url, forKey: "issue_comment_url")
        dictionary.setValue(self.contents_url, forKey: "contents_url")
        dictionary.setValue(self.compare_url, forKey: "compare_url")
        dictionary.setValue(self.merges_url, forKey: "merges_url")
        dictionary.setValue(self.archive_url, forKey: "archive_url")
        dictionary.setValue(self.downloads_url, forKey: "downloads_url")
        dictionary.setValue(self.issues_url, forKey: "issues_url")
        dictionary.setValue(self.pulls_url, forKey: "pulls_url")
        dictionary.setValue(self.milestones_url, forKey: "milestones_url")
        dictionary.setValue(self.notifications_url, forKey: "notifications_url")
        dictionary.setValue(self.labels_url, forKey: "labels_url")
        dictionary.setValue(self.releases_url, forKey: "releases_url")
        dictionary.setValue(self.deployments_url, forKey: "deployments_url")
        dictionary.setValue(self.created_at, forKey: "created_at")
        dictionary.setValue(self.updated_at, forKey: "updated_at")
        dictionary.setValue(self.pushed_at, forKey: "pushed_at")
        dictionary.setValue(self.git_url, forKey: "git_url")
        dictionary.setValue(self.ssh_url, forKey: "ssh_url")
        dictionary.setValue(self.clone_url, forKey: "clone_url")
        dictionary.setValue(self.svn_url, forKey: "svn_url")
        dictionary.setValue(self.homepage, forKey: "homepage")
        dictionary.setValue(self.size, forKey: "size")
        dictionary.setValue(self.stargazers_count, forKey: "stargazers_count")
        dictionary.setValue(self.watchers_count, forKey: "watchers_count")
        dictionary.setValue(self.language, forKey: "language")
        dictionary.setValue(self.has_issues, forKey: "has_issues")
        dictionary.setValue(self.has_projects, forKey: "has_projects")
        dictionary.setValue(self.has_downloads, forKey: "has_downloads")
        dictionary.setValue(self.has_wiki, forKey: "has_wiki")
        dictionary.setValue(self.has_pages, forKey: "has_pages")
        dictionary.setValue(self.forks_count, forKey: "forks_count")
        dictionary.setValue(self.mirror_url, forKey: "mirror_url")
        dictionary.setValue(self.open_issues_count, forKey: "open_issues_count")
        dictionary.setValue(self.forks, forKey: "forks")
        dictionary.setValue(self.open_issues, forKey: "open_issues")
        dictionary.setValue(self.watchers, forKey: "watchers")
        dictionary.setValue(self.default_branch, forKey: "default_branch")
        dictionary.setValue(self.score, forKey: "score")
        
        return dictionary
    }
    
    
}
