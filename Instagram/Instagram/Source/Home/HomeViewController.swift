//
//  HomeViewController.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/16.
//

import UIKit

class HomeViewController: UIViewController {
    
    var images: [ImageData]?
    
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage()
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
        
        homeTableView.rowHeight = UITableView.automaticDimension
        homeTableView.estimatedRowHeight = 500
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return FeedDataModel.sampleData.count
        default:
            return 0
        }
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

extension HomeViewController {
    func getImage() {
        ImageService.shared.getImage() { response in
            switch response {
            case .success(let data):
                guard let images = data as? [ImageData] else { return }
                for idx in 0 ... FeedDataModel.sampleData.count - 1 {
                    FeedDataModel.sampleData[idx].feedImage = images[idx].download_url ?? ""
                }
                self.homeTableView.reloadData()
                print("🔥 \(data)")
            default:
                print("❌ \(response)")
                return
            }
        }
    }
    
}
