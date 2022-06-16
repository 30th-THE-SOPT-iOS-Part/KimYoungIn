//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/26.
//

import UIKit

protocol TableViewCellDelegate {
    func likeBtnDidTapEvent(_ msg: String)
}

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
    
    var delegate: TableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setBtn()
    }
    
    private func setBtn() {
        likeBtn.setImage(Const.Icon.unlike, for: .normal)
        likeBtn.setImage(Const.Icon.like, for: .selected)
    }
    
    @IBAction func likeBtnDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        delegate?.likeBtnDidTapEvent(likeLabel.text ?? "")
    }
    
    func setData(_ feedData: FeedDataModel) {
        profileImg.image = feedData.profileImage
        profileName.text = feedData.profileName
        feedImg.urlToImg(feedData.feedImage ?? "")
        likeLabel.text = "좋아요 \(feedData.likeCount)개"
        nameLabel.text = feedData.profileName
        contentLabel.text = feedData.feedContent
        commentBtn.setTitle("댓글 \(feedData.commentCount)개 모두 보기", for: .normal)
    }
}
