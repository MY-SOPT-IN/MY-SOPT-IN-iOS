//
//  TotalRetroResponseDTO.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/24.
//

import Foundation

struct TotalRetroResponseDTO: Codable {
    let retrospectID: Int
    let descRoutine, descBest, descSelf, writtenDate: String
    let datumPublic, isPublic: Bool

    enum CodingKeys: String, CodingKey {
        case retrospectID = "retrospectId"
        case descRoutine, descBest, descSelf, writtenDate
        case datumPublic = "public"
        case isPublic
    }
}
