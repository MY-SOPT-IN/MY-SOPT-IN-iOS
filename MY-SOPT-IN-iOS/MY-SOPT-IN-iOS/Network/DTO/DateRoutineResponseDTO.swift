//
//  DateRoutineResponseDTO.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/26.
//

import Foundation

struct DateRoutineResponseDTO: Codable {
    let code: Int
    let message: String
    let data: [DateRoutineData]
}

struct DateRoutineData: Codable {
    let routineID: Int
    let routineName, routineAt: String
    
    enum CodingKeys: String, CodingKey {
        case routineID = "routineId"
        case routineName, routineAt
    }
}
