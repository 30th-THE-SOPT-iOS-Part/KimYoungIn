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
    static let imageURL = "https://picsum.photos/v2/list"

    // MARK: - Feature URL
    
    static let loginURL = baseURL + "/auth/signin"
    static let signupURL = baseURL + "/auth/signup"
    
}
