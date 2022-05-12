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
                let networkResult = NetworkBase.judgeStatus(by: statusCode, value, ImageResponse.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
}
