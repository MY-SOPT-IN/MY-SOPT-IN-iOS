//
//  NetworkBase.swift
//  MY-SOPT-IN-iOS
//
//  Created by 김인영 on 2023/05/24.
//

import Foundation

import Alamofire

struct NetworkBase {
    
    public func disposeNetwork<T: Codable>(_ result: AFDataResponse<Data>, dataModel: T.Type, completion: @escaping (NetworkResult<Any>) -> Void){
        switch result.result {
        case .success:
            guard let statusCode = result.response?.statusCode else { return }
            guard let data = result.data else { return }
            
            print(data)
            let networkResult = self.judgeStatus(by: statusCode, data, dataModel.self)
            completion(networkResult)
            
        case .failure(let error):
            print("여기서 에러나는 경우는 무슨경우?")
            print(error)
        }
    }
    
    private func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(BaseResponse<T>.self, from: data)
        else {
            return .pathErr
        }
        
        guard let realData = try? decoder.decode(object.self, from: data) else {
            return .decodedErr
        }
        
        print(realData)
        switch statusCode {
        case 200..<205:
            return .success(realData as Any)
        case 400..<500:
            return .requestErr(decodedData.message ?? "요청에러")
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    
}
