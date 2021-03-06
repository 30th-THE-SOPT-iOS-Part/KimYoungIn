//
//  FeedDataModel.swift
//  Instagram
//
//  Created by κΉμμΈ on 2022/04/26.
//

import Foundation
import UIKit

struct FeedDataModel {
    let profileImage: UIImage?
    let profileName: String
    var feedImage: String?
    let likeCount: Int
    let feedContent: String
    let commentCount: Int
}

extension FeedDataModel {
    static var sampleData: [FeedDataModel] = [
        FeedDataModel(profileImage: Const.Image.avatar1, profileName: "avatar1", feedImage: "", likeCount: 30, feedContent: "π± κΈ°νλ μΌμ΄λλ κ²μ΄ μλλΌ λ§λ€μ΄λ΄λ κ²μ΄λ€.", commentCount: 19),
        FeedDataModel(profileImage: Const.Image.avatar2, profileName: "avatar2", feedImage: "", likeCount: 330, feedContent: "β° ν° λͺ©νλ₯Ό μ΄λ£¨κ³  μΆμΌλ©΄ νλ½μ κ΅¬νμ§ λ§λΌ", commentCount: 24),
        FeedDataModel(profileImage: Const.Image.avatar3, profileName: "avatar3", feedImage: "", likeCount: 130, feedContent: "π± λ νλ λλ‘ νλ©΄ λ μ»λ κ²μ μ»λλ€.", commentCount: 100),
        FeedDataModel(profileImage: Const.Image.avatar4, profileName: "avatar4", feedImage: "", likeCount: 240, feedContent: "β¨ νλμ λͺ¨λ  μ±κ³΅μ κ°μ₯ κΈ°μ΄μ μΈ ν΅μ¬μ΄λ€.", commentCount: 140)
    ]
}
