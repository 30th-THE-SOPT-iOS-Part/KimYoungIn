//
//  FeedDataModel.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/26.
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
        FeedDataModel(profileImage: Const.Image.avatar1, profileName: "avatar1", feedImage: "", likeCount: 30, feedContent: "🌱 기회는 일어나는 것이 아니라 만들어내는 것이다.", commentCount: 19),
        FeedDataModel(profileImage: Const.Image.avatar2, profileName: "avatar2", feedImage: "", likeCount: 330, feedContent: "⏰ 큰 목표를 이루고 싶으면 허락을 구하지 마라", commentCount: 24),
        FeedDataModel(profileImage: Const.Image.avatar3, profileName: "avatar3", feedImage: "", likeCount: 130, feedContent: "🌱 늘 하던 대로 하면 늘 얻던 것을 얻는다.", commentCount: 100),
        FeedDataModel(profileImage: Const.Image.avatar4, profileName: "avatar4", feedImage: "", likeCount: 240, feedContent: "✨ 행동은 모든 성공의 가장 기초적인 핵심이다.", commentCount: 140)
    ]
}
