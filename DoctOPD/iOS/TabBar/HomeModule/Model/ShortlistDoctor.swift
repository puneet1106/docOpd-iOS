//
//  ShortlistDoctor.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 26/06/21.
//

import Foundation

struct ShortlistDoctorList: Codable {

    var status: Int?
    var shortlistDoctors: [ShortlistDoctors]?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case shortlistDoctors = "shortlistDoctors"
    }

    init(from decoder: Decoder) throws  {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decodeIfPresent(Int.self, forKey: .status)
        self.shortlistDoctors = try container.decodeIfPresent([ShortlistDoctors].self, forKey: .shortlistDoctors)
    }
}



struct ShortlistDoctors: Codable {
    
    var category: String?
    var clinicAddress: [ClinicAddress]?
    var description: String?
    var gender: String?
    var image: String?
    var name: String?
    var profileId: Int?
    var qualification: String?
    var registrationNo: String?
    var status: String?


    enum CodingKeys: String, CodingKey {
        case category = "category"
        case clinicAddress = "clinicAddress"
        case description = "description"
        case gender = "gender"
        case image = "image"
        case name = "name"
        case profileId = "profileId"
        case qualification = "qualification"
        case registrationNo = "registrationNo"
        case status = "status"
    }


     init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.category = try container.decodeIfPresent(String.self, forKey: .category)
        self.clinicAddress = try container.decodeIfPresent([ClinicAddress].self, forKey: .clinicAddress)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.profileId = try container.decodeIfPresent(Int.self, forKey: .profileId)
        self.qualification = try container.decodeIfPresent(String.self, forKey: .qualification)
        self.registrationNo = try container.decodeIfPresent(String.self, forKey: .registrationNo)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
    }
}


struct ClinicAddress: Codable {
    var address: String?
    var city: String?
    var fee: String?
    var id: Int?
    var landmark: String?
    var location: String?
    var mobileNumber: String?
    var name: String?
    var phoneNumber: String?
    var profileId: Int?
    var registrationNo: String?
    var shiftTiming: String?
    var state: String?

    enum CodingKeys: String, CodingKey {
        case address
        case city
        case fee
        case id
        case landmark
        case location
        case mobileNumber
        case name
        case phoneNumber
        case profileId
        case registrationNo
        case shiftTiming
        case state
    }

    init(from decoder: Decoder) throws  {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try container.decodeIfPresent(String.self, forKey: .address)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.fee = try container.decodeIfPresent(String.self, forKey: .fee)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.landmark = try container.decodeIfPresent(String.self, forKey: .landmark)
        self.location = try container.decodeIfPresent(String.self, forKey: .location)
        self.mobileNumber = try container.decodeIfPresent(String.self, forKey: .mobileNumber)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber)
        self.profileId = try container.decodeIfPresent(Int.self, forKey: .profileId)
        self.registrationNo = try container.decodeIfPresent(String.self, forKey: .registrationNo)
        self.shiftTiming = try container.decodeIfPresent(String.self, forKey: .shiftTiming)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)
    }
}

