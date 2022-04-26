//
//  HomeViewController.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/16.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setNavigationBar()
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
    
}
