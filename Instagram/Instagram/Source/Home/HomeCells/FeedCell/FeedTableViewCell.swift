//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/26.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    static let identifier = "FeedTableViewCell"
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var feedImg: UIImageView!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var commentBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(_ feedData: FeedDataModel) {
        profileImg.image = feedData.profileImage
        profileName.text = feedData.profileName
        feedImg.image = feedData.feedImage
        likeLabel.text = "좋아요 \(feedData.likeCount)개"
        nameLabel.text = feedData.profileName
        contentLabel.text = feedData.feedContent
        commentBtn.setTitle("댓글 \(feedData.commentCount)개 모두 보기", for: .normal)
    }
}
