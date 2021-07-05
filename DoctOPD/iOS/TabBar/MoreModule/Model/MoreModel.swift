//
//  MoreModel.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 05/07/21.
//


import Foundation

struct MoreModel: Codable {

    var pointsValue: Int?
    var redeemBlocked: Bool?
    var totalPoints: Int?
    var status: Int?
  //  var underProcess: [UnderProcessInfo]?

    enum CodingKeys: String, CodingKey {
        case pointsValue = "pointsValue"
        case redeemBlocked = "redeemBlocked"
        case totalPoints = "totalPoints"
        case status = "status"
       // case underProcess = "underProcess"
    }
    

     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.pointsValue = try container.decodeIfPresent(Int.self, forKey: .pointsValue)
        self.redeemBlocked = try container.decodeIfPresent(Bool.self, forKey: .redeemBlocked)
        self.totalPoints = try container.decodeIfPresent(Int.self, forKey: .totalPoints)
        self.status = try container.decodeIfPresent(Int.self, forKey: .status)
      //  self.underProcess = try container.decodeIfPresent([UnderProcessInfo].self, forKey: .underProcess)

    }
}


struct UnderProcessInfo: Codable {

    var accountNo: String?
    var createdDate: String?
    var inviteCode: String?
    var panNumber: String?
    var redeemPoint: Int?
    var redeemStatus: Int?
    var id: Int?

    enum CodingKeys: String, CodingKey {
        case accountNo
        case createdDate
        case inviteCode
        case panNumber
        case redeemPoint
        case redeemStatus
        case id

    }

    init(from decoder: Decoder) throws  {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.accountNo = try container.decodeIfPresent(String.self, forKey: .accountNo)
        self.createdDate = try container.decodeIfPresent(String.self, forKey: .createdDate)
        self.inviteCode = try container.decodeIfPresent(String.self, forKey: .inviteCode)
        self.panNumber = try container.decodeIfPresent(String.self, forKey: .panNumber)
        self.redeemPoint = try container.decodeIfPresent(Int.self, forKey: .redeemPoint)
        self.redeemStatus = try container.decodeIfPresent(Int.self, forKey: .redeemStatus)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
    }
}
