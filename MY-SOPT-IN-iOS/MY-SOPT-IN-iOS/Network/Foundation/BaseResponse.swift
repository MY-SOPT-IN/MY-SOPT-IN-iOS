//
//  BaseResponse.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/24.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    var status: Int?
    var success: Bool?
    var message: String?
    var data: T?
}

/// data가 없는 API 통신에서 사용할 BlankData 구조체
struct BlankData: Codable {
}
