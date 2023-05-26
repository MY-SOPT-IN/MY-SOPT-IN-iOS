//
//  RoutineRouter.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/26.
//

import Foundation

import Alamofire

enum RoutineRouter {
    case getDateTotal(date: String)
}

extension RoutineRouter: BaseTargetType {
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getDateTotal:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getDateTotal(let date):
            return APIConstants.routine + date
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getDateTotal:
            return .none
        }
    }
}
