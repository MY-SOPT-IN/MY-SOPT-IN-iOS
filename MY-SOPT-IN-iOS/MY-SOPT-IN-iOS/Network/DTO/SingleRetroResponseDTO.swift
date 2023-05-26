//
//  SingleRetroResponseDTO.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/26.
//

import Foundation

struct SingleRetroResponseDTO: Codable {
    let retrospectId: Int
    let descRoutine, descBest, descSelf, writtenDate: String
    let dataPublic, isPublic: Bool

    enum CodingKeys: String, CodingKey {
        case retrospectId = "retrospectID"
        case descRoutine, descBest, descSelf, writtenDate
        case dataPublic = "public"
        case isPublic
    }
}

