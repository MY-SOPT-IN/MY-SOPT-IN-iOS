//
//  APIConstants.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/23.
//

import Foundation

struct APIConstants {
    static let contentType = "Content-Type"
    static let applicationJSON = "application/json"
    
    static let retro = "retro/"
    static let routine = "routine/"
}

extension APIConstants {
    
    static var defaultHeader: Dictionary<String,String> {
        [contentType: applicationJSON]
    }
}
