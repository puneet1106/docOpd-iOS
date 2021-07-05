//
//  CategoryList.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 26/06/21.
//


import Foundation

struct CategoryList: Codable {

    var status: Int?
    var category: [CategoryItem]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case category = "category"
    }


     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decodeIfPresent(Int.self, forKey: .status)
        self.category = try container.decodeIfPresent([CategoryItem].self, forKey: .category)
    }
}


struct CategoryItem: Codable {
    var name: String?
    var image: String?
    var categoryId: Int?

    enum CodingKeys: String, CodingKey {
        case name
        case image
        case categoryId
    }

    init(from decoder: Decoder) throws  {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.categoryId = try container.decodeIfPresent(Int.self, forKey: .categoryId)
    }
}
