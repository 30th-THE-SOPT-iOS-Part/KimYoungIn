//
//  SignupModel.swift
//  Instagram
//
//  Created by 김영인 on 2022/05/11.
//

import Foundation

struct SignupResponse: Codable {
    let status: Int
    let success: Bool?
    let message: String
    let data: SignupData?
}

struct SignupData: Codable {
    let id: Int
}
