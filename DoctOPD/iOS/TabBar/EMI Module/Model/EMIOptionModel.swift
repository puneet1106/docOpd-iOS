//
//  EMIOptionModel.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 30/06/21.
//


import Foundation

struct EMIOptionModel: Codable {

    var status: Int?
    var userConsent: UserConsent?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case userConsent = "userConsent"
    }


     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decodeIfPresent(Int.self, forKey: .status)
        self.userConsent = try container.decodeIfPresent(UserConsent.self, forKey: .userConsent)
    }
}


struct UserConsent: Codable {
    var createdDate: String?
    var status: Int?
    var userId: Int?
    var widget: String?

    enum CodingKeys: String, CodingKey {
        case createdDate
        case status
        case userId
        case widget

    }

    init(from decoder: Decoder) throws  {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.createdDate = try container.decodeIfPresent(String.self, forKey: .createdDate)
        self.widget = try container.decodeIfPresent(String.self, forKey: .widget)
        self.status = try container.decodeIfPresent(Int.self, forKey: .status)
        self.userId = try container.decodeIfPresent(Int.self, forKey: .userId)
    }
}
