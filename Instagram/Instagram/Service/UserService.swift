//
//  UserService.swift
//  Instagram
//
//  Created by 김영인 on 2022/05/11.
//

import Foundation
import Alamofire

class UserService {
    static let shared = UserService()
    
    private init() {}
    
    func login(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void)
    {
        let url = APIConstants.loginURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = NetworkBase.judgeStatus(by: statusCode, value, LoginResponse.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    
    func signup(name: String,
                email: String,
                password: String,
                completion: @escaping (NetworkResult<Any>) -> Void)
    {
        let url = APIConstants.signupURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "name": name,
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = NetworkBase.judgeStatus(by: statusCode, value, SignupResponse.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
}
