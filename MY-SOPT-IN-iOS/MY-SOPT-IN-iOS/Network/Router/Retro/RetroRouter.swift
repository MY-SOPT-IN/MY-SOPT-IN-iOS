//
//  RetroRouter.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/24.
//

import Foundation

import Alamofire

enum RetroRouter {
    case getTotal(month: Int)
}

extension RetroRouter: BaseTargetType {
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getTotal:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getTotal:
            return APIConstants.retro + "all"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getTotal(let month):
            return .query(["month": month])
        }
    }
}

