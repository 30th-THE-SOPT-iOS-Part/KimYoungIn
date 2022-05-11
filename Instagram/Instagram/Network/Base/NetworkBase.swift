//
//  NetworkBase.swift
//  Instagram
//
//  Created by 김영인 on 2022/05/12.
//

import Foundation

struct NetworkBase {
    
    static func judgeStatus<T: Codable> (by statusCode: Int, _ data: Data, _ type: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(type.self, from: data)
        else { return .pathErr }
        
        switch statusCode {
        case 200 ..< 300: return .success(decodedData as Any)
        case 401 ..< 500: return .requestErr(decodedData as Any)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
}
