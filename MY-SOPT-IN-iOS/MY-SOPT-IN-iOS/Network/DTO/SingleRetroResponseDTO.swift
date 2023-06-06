//
//  SingleRetroResponseDTO.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/26.
//

import Foundation

struct SingleRetroResponseDTO: Codable {
    let code: Int
    let message: String
    let data: SingleRetroData
}


struct SingleRetroData: Codable {
    let retrospectID: Int
    let descRoutine, descBest, descSelf, writtenDate: String
    let dataPublic, isPublic: Bool

    enum CodingKeys: String, CodingKey {
        case retrospectID = "retrospectId"
        case descRoutine, descBest, descSelf, writtenDate
        case dataPublic = "public"
        case isPublic
    }
}


