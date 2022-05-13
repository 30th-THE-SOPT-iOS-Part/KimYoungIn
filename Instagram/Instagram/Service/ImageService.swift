//
//  ImageService.swift
//  Instagram
//
//  Created by 김영인 on 2022/05/12.
//

import Foundation
import Alamofire

class ImageService {
    static let shared = ImageService()
    
    private init() {}
    
    func getImage(completion: @escaping (NetworkResult<Any>) -> Void)
    {
        let url = APIConstants.imageURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let param: Parameters = [
            "page": 6,
            "limit": 4
        ]
    
        let dataRequest = AF.request(url,
                                     method: .get,
                                     parameters: param,
                                     encoding: URLEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeImageStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    func judgeImageStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(ImageResponse.self, from: data)
        else { return .pathErr }
        
        switch statusCode {
        case 200 ..< 300: return .success(decodedData)
        case 401 ..< 500: return .requestErr(decodedData)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
}
