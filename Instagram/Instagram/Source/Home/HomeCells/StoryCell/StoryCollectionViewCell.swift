//
//  StoryCollectionViewCell.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/26.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "StoryCollectionViewCell"
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ storyData: StoryDataModel) {
        profileImg.image = storyData.profileImage
        profileName.text = storyData.profileName
    }
}
