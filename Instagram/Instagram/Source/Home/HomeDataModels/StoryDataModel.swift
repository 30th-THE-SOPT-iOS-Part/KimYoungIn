//
//  StoryDataModel.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/26.
//

import Foundation
import UIKit

struct StoryDataModel {
    let profileImage: UIImage?
    let profileName: String
}

extension StoryDataModel {
    static let sampleData: [StoryDataModel] = [
        StoryDataModel(profileImage: Const.Image.avatar1, profileName: "avatar1"),
        StoryDataModel(profileImage: Const.Image.avatar2, profileName: "avatar2"),
        StoryDataModel(profileImage: Const.Image.avatar3, profileName: "avatar3"),
        StoryDataModel(profileImage: Const.Image.avatar4, profileName: "avatar4"),
        StoryDataModel(profileImage: Const.Image.avatar5, profileName: "avatar5"),
        StoryDataModel(profileImage: Const.Image.avatar6, profileName: "avatar6")
    ]
}
