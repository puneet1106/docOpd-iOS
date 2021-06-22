//
//  OTPModel.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 23/06/21.
//


import Foundation

struct OTPModel: Codable {

    var message: String?
    var status: Int?
    var user: UserModel?

    enum CodingKeys: String, CodingKey {
        case message = "message"
        case status = "status"
        case user = "user"
    }
    

     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decodeIfPresent(String.self, forKey: .message)
        self.status = try container.decodeIfPresent(Int.self, forKey: .status)
        self.user = try container.decodeIfPresent(UserModel.self, forKey: .user)
    }
}
