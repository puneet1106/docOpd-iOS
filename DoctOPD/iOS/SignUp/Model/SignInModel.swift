//
//  SignInModel.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 23/06/21.
//

import Foundation

struct SignInModel: Codable {

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


struct UserModel: Codable {

    var email: String?
    var inviteCode: String?
    var mobileNumber: String?
    var name: String?
    var password: String?
    var status: Int?
    var userId: Int?

    enum CodingKeys: String, CodingKey {
        case email
        case inviteCode
        case mobileNumber
        case name
        case password
        case status
        case userId

    }

    init(from decoder: Decoder) throws  {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.inviteCode = try container.decodeIfPresent(String.self, forKey: .inviteCode)
        self.mobileNumber = try container.decodeIfPresent(String.self, forKey: .mobileNumber)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.password = try container.decodeIfPresent(String.self, forKey: .password)
        self.status = try container.decodeIfPresent(Int.self, forKey: .status)
        self.userId = try container.decodeIfPresent(Int.self, forKey: .userId)
    }
}
