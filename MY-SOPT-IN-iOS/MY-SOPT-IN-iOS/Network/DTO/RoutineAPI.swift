//
//  RoutineAPI.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김다예 on 2023/05/26.
//

import Foundation

import Alamofire

final class RoutineAPI: BaseAPI {
    static let shared = RoutineAPI()
    
    private override init() {}
}

extension RoutineAPI {
    
    // 1. 전체 루틴 조회
    
    public func getDateTotal(dateRequest: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(RoutineRouter.getDateTotal(date: dateRequest)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: DateRoutineResponseDTO.self,
                                completion: completion)
        }
    }
}
