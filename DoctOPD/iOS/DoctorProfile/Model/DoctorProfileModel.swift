//
//  DoctorProfileModel.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 27/06/21.
//

import Foundation

struct DoctorProfileModel: Codable {

    var status: Int?
    var profile: DoctorProfile?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case profile = "profile"
    }

    init(from decoder: Decoder) throws  {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decodeIfPresent(Int.self, forKey: .status)
        self.profile = try container.decodeIfPresent(DoctorProfile.self, forKey: .profile)
    }
}



struct DoctorProfile: Codable {

    var category: String?
    var clinicAddress: [ClinicAddress]?
    var description: String?
    var experience: String?
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
        case experience = "experience"
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
        self.experience = try container.decodeIfPresent(String.self, forKey: .experience)
        self.gender = try container.decodeIfPresent(String.self, forKey: .gender)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.profileId = try container.decodeIfPresent(Int.self, forKey: .profileId)
        self.qualification = try container.decodeIfPresent(String.self, forKey: .qualification)
        self.registrationNo = try container.decodeIfPresent(String.self, forKey: .registrationNo)
        self.status = try container.decodeIfPresent(String.self, forKey: .status)
    }
}


