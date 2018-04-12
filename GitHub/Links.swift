

import Foundation
import SwiftyJSON


class Links {
    var link: String = ""
    
    var html : Href?
    var issue : Href?
    var comments : Href?
    var review_comments : Href?
    var review_comment : Href?
    var commits : Href?
    var statuses : Href?



	required public init(json: JSON) {

        
        if (json["self"] != JSON.null) { link = json["self"]["href"].stringValue }
		if (json["html"] != JSON.null) { html = Href(json: json["html"]) }
		if (json["issue"] != JSON.null) { issue = Href(json: json["issue"]) }
		if (json["comments"] != JSON.null) { comments = Href(json: json["comments"]) }
		if (json["review_comments"] != JSON.null) { review_comments = Href(json: json["review_comments"]) }
		if (json["review_comment"] != JSON.null) { review_comment = Href(json: json["review_comment"]) }
		if (json["commits"] != JSON.null) { commits = Href(json: json["commits"]) }
		if (json["statuses"] != JSON.null) { statuses = Href(json: json["statuses"]) }
	}

		
/**
    Returns the dictionary representation for the current instance.
    
    - returns: NSDictionary.
*/
	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()

		dictionary.setValue(self.link, forKey: "link")
		dictionary.setValue(self.html?.dictionaryRepresentation(), forKey: "html")
		dictionary.setValue(self.issue?.dictionaryRepresentation(), forKey: "issue")
		dictionary.setValue(self.comments?.dictionaryRepresentation(), forKey: "comments")
		dictionary.setValue(self.review_comments?.dictionaryRepresentation(), forKey: "review_comments")
		dictionary.setValue(self.review_comment?.dictionaryRepresentation(), forKey: "review_comment")
		dictionary.setValue(self.commits?.dictionaryRepresentation(), forKey: "commits")
		dictionary.setValue(self.statuses?.dictionaryRepresentation(), forKey: "statuses")

		return dictionary
	}

}
