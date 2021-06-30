//
//  UserPoliciesModel.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 30/06/21.
//

import Foundation

struct UserPoliciesModel: Codable {

    var status: Int?
    var userPolicy: [UserPolicy]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case userPolicy = "userPolicy"
    }

    init(from decoder: Decoder) throws  {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decodeIfPresent(Int.self, forKey: .status)
        self.userPolicy = try container.decodeIfPresent([UserPolicy].self, forKey: .userPolicy)
    }
}



struct UserPolicy: Codable {

    var company: String?
    var insuranceDate: String?
    var mobileNumber: String?
    var name: String?
    var policyFile: String?
    var policyNo: String?
    var premium: String?
    var product: String?
    var renewalDate: String?
    var status: String?
    var sumInsured: String?


    enum CodingKeys: String, CodingKey {
        case company = "company"
        case insuranceDate = "insuranceDate"
        case mobileNumber = "mobileNumber"
        case name = "name"
        case policyFile = "policyFile"
        case policyNo = "policyNo"
        case premium = "premium"
        case product = "product"
        case renewalDate = "renewalDate"
        case status = "status"
        case sumInsured = "sumInsured"
    }


     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.company = try container.decodeIfPresent(String.self, forKey: .company)
        self.insuranceDate = try container.decodeIfPresent(String.self, forKey: .insuranceDate)
        self.mobileNumber = try container.decodeIfPresent(String.self, forKey: .mobileNumber)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.policyFile = try container.decodeIfPresent(String.self, forKey: .policyFile)
        self.policyNo = try container.decodeIfPresent(String.self, forKey: .policyNo)
        self.premium = try container.decodeIfPresent(String.self, forKey: .premium)
        self.product = try container.decodeIfPresent(String.self, forKey: .product)
        self.renewalDate = try container.decodeIfPresent(String.self, forKey: .renewalDate)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
        self.sumInsured = try container.decodeIfPresent(String.self, forKey: .sumInsured)
    }
}


