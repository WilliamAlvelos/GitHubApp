
import Foundation
import SwiftyJSON


class Href {
	public var href : String?

	required public init(json: JSON) {
		href = json["href"].stringValue
	}

	public func dictionaryRepresentation() -> NSDictionary {

		let dictionary = NSMutableDictionary()
		dictionary.setValue(self.href, forKey: "href")
		return dictionary
	}

}
