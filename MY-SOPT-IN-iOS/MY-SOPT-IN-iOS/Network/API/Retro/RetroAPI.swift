//
//  RetroAPI.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/24.
//

import Foundation

import Alamofire

final class RetroAPI: BaseAPI {
    static let shared = RetroAPI()
    
    private(set) var getTotalRetroData: TotalRetroResponseDTO?
    
    private override init() {}
}

extension RetroAPI {
    
    // 1. 전체 회고 조회
    
    public func getTotalRetroData(dateRequest: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(RetroRouter.getTotal(month: dateRequest)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: TotalRetroResponseDTO.self,
                                completion: completion)
        }
    }
    
    // 2. 단일 회고 조회
    
    public func getSingleRetroData(dateRequest: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        AFManager.request(RetroRouter.getSingle(date: dateRequest)).responseData { response in
            self.disposeNetwork(response,
                                dataModel: SingleRetroResponseDTO.self,
                                completion: completion)
        }
    }
}
