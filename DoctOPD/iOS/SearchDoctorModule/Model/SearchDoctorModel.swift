//
//  SearchDoctorModel.swift
//  DoctOPD (iOS)
//
//  Created by Puneet on 29/06/21.
//


import Foundation

struct SearchDoctorModel: Codable {

    var status: Int?
    var profiles: [DoctorProfile]?
    var currentPage: Int?
    var totalItems: Int?
    var totalPages: Int?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case profiles = "profiles"
        case currentPage = "currentPage"
        case totalItems = "totalItems"
        case totalPages = "totalPages"

    }

    init(from decoder: Decoder) throws  {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decodeIfPresent(Int.self, forKey: .status)
        self.profiles = try container.decodeIfPresent([DoctorProfile].self, forKey: .profiles)
        self.currentPage = try container.decodeIfPresent(Int.self, forKey: .currentPage)
        self.totalItems = try container.decodeIfPresent(Int.self, forKey: .totalItems)
        self.totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)

    }
}

