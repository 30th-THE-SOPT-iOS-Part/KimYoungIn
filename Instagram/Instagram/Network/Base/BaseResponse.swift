//
//  BaseNetwork.swift
//  Instagram
//
//  Created by 김영인 on 2022/05/12.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    var status: Int
    var success: Bool?
    var message: String
    var data: T?
}
