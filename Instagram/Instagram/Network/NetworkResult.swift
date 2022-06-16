//
//  NetworkResult.swift
//  Instagram
//
//  Created by 김영인 on 2022/05/11.
//

enum NetworkResult<T> {
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
