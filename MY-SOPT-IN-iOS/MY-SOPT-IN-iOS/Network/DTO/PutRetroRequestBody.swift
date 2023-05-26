//
//  PutRetroRequestBody.swift
//  MY-SOPT-IN-iOS
//
//  Created by 천성우 on 2023/05/27.
//

import Foundation

struct PutRetroRequestBody: Encodable {
    let retroId: Int
    let isPublic: Bool
    let descRoutine: String
    let descBest: String
    let descSelf: String
    let writtenDate: String
}

