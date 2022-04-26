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
        
        let storyNib = UINib(nibName: StoryTableViewCell.identifier, bundle: nil)
        homeTableView.register(storyNib, forCellReuseIdentifier: StoryTableViewCell.identifier)
        
        let nib = UINib(nibName: FeedTableViewCell.identifier, bundle: nil)
        homeTableView.register(nib, forCellReuseIdentifier: FeedTableViewCell.identifier)
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let width = UIScreen.main.bounds.width
        var cellHeight: CGFloat
        
        switch indexPath.section {
        case 0:
            cellHeight = width * (82/375)
        case 1:
            cellHeight = width * (488/375)
        default:
            cellHeight = 0
        }
        
        return cellHeight
    }
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int
        
        switch section {
        case 0:
            count = 1
        case 1:
            count = FeedDataModel.sampleData.count
        default:
            count = 0
        }
        
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: StoryTableViewCell.identifier, for: indexPath) as? StoryTableViewCell else { return UITableViewCell() }
            return cell
        case 1:
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: FeedTableViewCell.identifier, for: indexPath) as? FeedTableViewCell else { return UITableViewCell() }
            cell.setData(FeedDataModel.sampleData[indexPath.row])
            
            cell.delegate = self
            
            return cell
        default:
            return UITableViewCell()
        }
    }
}

extension HomeViewController: TableViewCellDelegate {
    func likeBtnDidTapEvent(_ msg: String) {
        print(msg)
    }
}
