//
//  APIConstants.swift
//  Instagram
//
//  Created by 김영인 on 2022/05/11.
//

import Foundation

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "http://13.124.62.236"
    
    // MARK: - Feature URL
    static let loginURl = baseURL + "/auth/signin"
    static let signupURL = baseURL + "/auth/signup"
}
