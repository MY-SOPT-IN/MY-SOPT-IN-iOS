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
    let `public`, isPublic: Bool

    enum CodingKeys: String, CodingKey {
        case retrospectId
        case descRoutine, descBest, descSelf, writtenDate
        case `public`
        case isPublic
    }
}
