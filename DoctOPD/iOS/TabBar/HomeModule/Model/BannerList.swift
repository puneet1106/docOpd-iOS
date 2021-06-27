//
//  BannerList.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 27/06/21.
//

import Foundation

struct BannerList: Codable {

    var status: Int?
    var inventory: [Inventory]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case inventory = "inventory"
    }


     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decodeIfPresent(Int.self, forKey: .status)
        self.inventory = try container.decodeIfPresent([Inventory].self, forKey: .inventory)
    }
}


struct Inventory: Codable {
    var description: String?
    var image: String?
    var inventoryId: Int?
    var status: Int?
    var title: String?
    var url: String?

    enum CodingKeys: String, CodingKey {
        case description
        case image
        case inventoryId
        case status
        case title
        case url
    }

    init(from decoder: Decoder) throws  {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.inventoryId = try container.decodeIfPresent(Int.self, forKey: .inventoryId)
        self.status = try container.decodeIfPresent(Int.self, forKey: .status)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
    }
}
