//
//  ApiCollection.swift
//  b2a-messenger-swiftui
//
//  Created by Daniel Gabzdyl on 09.05.2022.
//

import Foundation
import ObjectMapper

open class ApiCollection: ApiObject {

    open var total: Int?
    open var totalFiltered: Int?
    open var data: [ApiObject] = []
    open var type: String = "collection"

    public required init?(map: Map) {}

    public init(data: [String: Any]) {
        var dict: [[String: Any]]?
        if let dataCollection = data["data"] as? [String: Any] {
            total = dataCollection["total"] as? Int
            totalFiltered = dataCollection["totalFiltered"] as? Int
            dict = dataCollection["data"] as? [[String: Any]]
        } else {
            dict = data["data"] as? [[String: Any]]
            totalFiltered = data["totalFiltered"] as? Int
            total = data["total"] as? Int
        }
        if let dictUnwrapped = dict {
            for item in dictUnwrapped {
                guard let object = item.apiObject else { continue }
                self.data.append(object)
            }
        }
    }

    public func mapping(map: Map) {
        total <- map["total"]
        totalFiltered <- map["totalFiltered"]
        type <- map["type"]
        data <- (map["data"], AnyApiObjectTransformType())
    }
}
