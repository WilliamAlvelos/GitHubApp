
import Foundation
import SwiftyJSON

public class PullRequest {
	public var url : String?
	public var id : Int?
	public var html_url : String?
	public var diff_url : String?
	public var patch_url : String?
	public var issue_url : String?
	public var number : Int?
	public var state : String?
	public var locked : String?
	public var title : String?
	public var user : Owner?
	public var body : String?
	public var created_at : String?
	public var updated_at : String?
	public var closed_at : String?
	public var merged_at : String?
	public var merge_commit_sha : String?
	public var assignee : String?
	public var assignees : Array<String>?
	public var requested_reviewers : Array<String>?
	public var milestone : String?
	public var commits_url : String?
	public var review_comments_url : String?
	public var review_comment_url : String?
	public var comments_url : String?
	public var statuses_url : String?
    var links : Links?



	required public init(json: JSON) {

		url = json["url"].stringValue
		id = json["id"].intValue
		html_url = json["html_url"] .stringValue
		diff_url = json["diff_url"] .stringValue
		patch_url = json["patch_url"] .stringValue
		issue_url = json["issue_url"] .stringValue
		number = json["number"].intValue
		state = json["state"] .stringValue
		locked = json["locked"] .stringValue
		title = json["title"] .stringValue
		if (json["user"] != JSON.null) { user = Owner(json: json["user"]) }
		body = json["body"] .stringValue
		created_at = json["created_at"] .stringValue
		updated_at = json["updated_at"] .stringValue
		closed_at = json["closed_at"] .stringValue
		merged_at = json["merged_at"] .stringValue
		merge_commit_sha = json["merge_commit_sha"] .stringValue
		assignee = json["assignee"] .stringValue
		milestone = json["milestone"] .stringValue
		commits_url = json["commits_url"] .stringValue
		review_comments_url = json["review_comments_url"] .stringValue
		review_comment_url = json["review_comment_url"] .stringValue
		comments_url = json["comments_url"] .stringValue
		statuses_url = json["statuses_url"] .stringValue
		if (json["_links"] != JSON.null) { links = Links(json: json["_links"]) }
	}

    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.url, forKey: "url")
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.html_url, forKey: "html_url")
        dictionary.setValue(self.diff_url, forKey: "diff_url")
        dictionary.setValue(self.patch_url, forKey: "patch_url")
        dictionary.setValue(self.issue_url, forKey: "issue_url")
        dictionary.setValue(self.number, forKey: "number")
        dictionary.setValue(self.state, forKey: "state")
        dictionary.setValue(self.locked, forKey: "locked")
        dictionary.setValue(self.title, forKey: "title")
        dictionary.setValue(self.user?.dictionaryRepresentation(), forKey: "user")
        dictionary.setValue(self.body, forKey: "body")
        dictionary.setValue(self.created_at, forKey: "created_at")
        dictionary.setValue(self.updated_at, forKey: "updated_at")
        dictionary.setValue(self.closed_at, forKey: "closed_at")
        dictionary.setValue(self.merged_at, forKey: "merged_at")
        dictionary.setValue(self.merge_commit_sha, forKey: "merge_commit_sha")
        dictionary.setValue(self.assignee, forKey: "assignee")
        dictionary.setValue(self.milestone, forKey: "milestone")
        dictionary.setValue(self.commits_url, forKey: "commits_url")
        dictionary.setValue(self.review_comments_url, forKey: "review_comments_url")
        dictionary.setValue(self.review_comment_url, forKey: "review_comment_url")
        dictionary.setValue(self.comments_url, forKey: "comments_url")
        dictionary.setValue(self.statuses_url, forKey: "statuses_url")
        dictionary.setValue(self.links?.dictionaryRepresentation(), forKey: "_links")
        
        return dictionary
    }


}
