//
//  HomeTableViewCell.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/26.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    static let identifier = "StoryTableViewCell"
    
    @IBOutlet weak var storyCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCollectionView()
    }
    
    private func setCollectionView() {
        let nib = UINib(nibName: StoryCollectionViewCell.identifier, bundle: nil)
        storyCollectionView.register(nib, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
    }
}

extension StoryTableViewCell: UICollectionViewDelegate {
    
}

extension StoryTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StoryDataModel.sampleData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = storyCollectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell else { return UICollectionViewCell() }
        
        cell.setData(StoryDataModel.sampleData[indexPath.row])
        
        return cell
    }
    
}

extension StoryTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (58/375)
        let cellHeight = cellWidth * (72/58)
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 6, bottom: 8, right: 6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
