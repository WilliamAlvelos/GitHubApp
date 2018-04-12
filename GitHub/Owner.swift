//
//  Owner.swift
//  GitHub
//
//  Created by William Alvelos on 14/08/17.
//  Copyright © 2017 William Alvelos. All rights reserved.
//

import Foundation
import SwiftyJSON

public class Owner {
    public var login : String?
    public var id : Int?
    public var avatar_url : String?
    public var gravatar_id : String?
    public var url : String?
    public var html_url : String?
    public var followers_url : String?
    public var following_url : String?
    public var gists_url : String?
    public var starred_url : String?
    public var subscriptions_url : String?
    public var organizations_url : String?
    public var repos_url : String?
    public var events_url : String?
    public var received_events_url : String?
    public var type : String?
    public var site_admin : String?

    
    
    /**
     Constructs the object based on the given a json.
     
     Sample usage:
     let owner = Owner(JSON)
     
     - parameter dictionary: JSON.
     
     - returns: Owner Instance.
     */
    required public init?(json: JSON) {
        
        login = json["login"].stringValue
        id = json["id"].intValue
        avatar_url = json["avatar_url"].stringValue
        gravatar_id = json["gravatar_id"].stringValue
        url = json["url"].stringValue
        html_url = json["html_url"].stringValue
        followers_url = json["followers_url"].stringValue
        following_url = json["following_url"].stringValue
        gists_url = json["gists_url"].stringValue
        starred_url = json["starred_url"].stringValue
        subscriptions_url = json["subscriptions_url"].stringValue
        organizations_url = json["organizations_url"].stringValue
        repos_url = json["repos_url"].stringValue
        events_url = json["events_url"].stringValue
        received_events_url = json["received_events_url"].stringValue
        type = json["type"].stringValue
        site_admin = json["site_admin"].stringValue
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.login, forKey: "login")
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.avatar_url, forKey: "avatar_url")
        dictionary.setValue(self.gravatar_id, forKey: "gravatar_id")
        dictionary.setValue(self.url, forKey: "url")
        dictionary.setValue(self.html_url, forKey: "html_url")
        dictionary.setValue(self.followers_url, forKey: "followers_url")
        dictionary.setValue(self.following_url, forKey: "following_url")
        dictionary.setValue(self.gists_url, forKey: "gists_url")
        dictionary.setValue(self.starred_url, forKey: "starred_url")
        dictionary.setValue(self.subscriptions_url, forKey: "subscriptions_url")
        dictionary.setValue(self.organizations_url, forKey: "organizations_url")
        dictionary.setValue(self.repos_url, forKey: "repos_url")
        dictionary.setValue(self.events_url, forKey: "events_url")
        dictionary.setValue(self.received_events_url, forKey: "received_events_url")
        dictionary.setValue(self.type, forKey: "type")
        dictionary.setValue(self.site_admin, forKey: "site_admin")
        
        return dictionary
    }


}
