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
    case getSingle(date: String)
}

extension RetroRouter: BaseTargetType {
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getTotal:
            return .get
        case .getSingle:
            return .get
        }
        
    }
    
    var path: String {
        switch self {
        case .getTotal:
            return APIConstants.retro + "all"
        case .getSingle:
            return APIConstants.retro
            
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getTotal(let month):
            return .query(["month": month])
        case .getSingle(let date):
            return .query(["date": date])
        }
    }
}

