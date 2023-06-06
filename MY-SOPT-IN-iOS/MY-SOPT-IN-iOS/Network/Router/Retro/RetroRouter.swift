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
    case putRetro(retroId: Int, requestBody: PutRetroRequestBody)
}

extension RetroRouter: BaseTargetType {
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getTotal:
            return .get
        case .getSingle:
            return .get
        case .putRetro:
            return .put
        }
        
    }
    
    var path: String {
        switch self {
        case .getTotal:
            return APIConstants.retro + "all"
        case .getSingle:
            return APIConstants.retro
        case .putRetro(let retroId, _):
            return APIConstants.retro + "\(retroId)"
        }
    }
    
    var parameters: RequestParams {
        switch self {
        case .getTotal(let month):
            return .query(["month": month])
        case .getSingle(let date):
            return .query(["date": date])
        case .putRetro(_, let requestBody):
            return .body(requestBody)
        }
    }

}
