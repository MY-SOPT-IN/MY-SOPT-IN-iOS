//
//  BaseResponse.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/24.
//

import Foundation

struct SimpleResponse: Codable {
    var status: Int
    var success: Bool
    var message: String?
}

struct GenericResponse<T: Codable>: Codable {
    var status_code: Int?
    var success: Bool?
    var status_message: String?
}

struct VoidResult: Codable {
    var code: Int
    var data: Bool?
    var message: String?
}
