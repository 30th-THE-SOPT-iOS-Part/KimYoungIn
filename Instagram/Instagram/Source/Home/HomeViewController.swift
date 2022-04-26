//
//  HomeViewController.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/16.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setNavigationBar()
        setTableView()
    }
    
    private func setNavigationBar() {
        self.navigationController?.navigationBar.backgroundColor = .systemBackground
        
        let instagramImgView: UIImageView = {
            let instagramImgView = UIImageView()
            instagramImgView.image = Const.Image.instagramSmall
            return instagramImgView
        }()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: instagramImgView)
        
        let addBtn = makeBtn(Const.Icon.add ?? UIImage())
        let likeBtn = makeBtn(Const.Icon.unlike ?? UIImage())
        let shareBtn = makeBtn(Const.Icon.share ?? UIImage())
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 15
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: shareBtn), spacer, UIBarButtonItem(customView: likeBtn), spacer, UIBarButtonItem(customView: addBtn)]
    }
    
    private func makeBtn( _ img: UIImage) -> UIButton {
        let btn = UIButton(type: .system)
        btn.setImage((img), for: .normal)
        btn.tintColor = .black
        return btn
    }
    
    private func setTableView() {
        homeTableView.separatorStyle = .none
        let nib = UINib(nibName: FeedTableViewCell.identifier, bundle: nil)
        homeTableView.register(nib, forCellReuseIdentifier: FeedTableViewCell.identifier)
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = UIScreen.main.bounds.width
        
        let cellWidth = width * (176/375)
        let cellHeight = cellWidth * (488/176)
        
        return cellHeight
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FeedDataModel.sampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
        
        cell.setData(FeedDataModel.sampleData[indexPath.row])
        
        return cell
    }
}
