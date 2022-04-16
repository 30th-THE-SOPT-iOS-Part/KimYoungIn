//
//  TabBarController.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/16.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBarController()
    }
    
    func setTabBarController() {
        
        let homeSB = UIStoryboard.init(name: Const.Storyboard.Name.home, bundle: nil)
        let searchSB = UIStoryboard.init(name: Const.Storyboard.Name.search, bundle: nil)
        let reelsSB = UIStoryboard.init(name: Const.Storyboard.Name.reels, bundle: nil)
        let shopSB = UIStoryboard.init(name: Const.Storyboard.Name.shop, bundle: nil)
        let profileSB = UIStoryboard.init(name: Const.Storyboard.Name.profile, bundle: nil)
        
        guard let homeVC = homeSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.homeVC) as? HomeViewController,
              let searchVC = searchSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.searchVC) as? SearchViewController,
              let reelsVC = reelsSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.reelsVC) as? ReelsViewController,
              let shopVC = shopSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.shopVC) as? ShopViewController,
              let profileVC = profileSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.profileVC) as? ProfileViewController
        else { return }
        
        
        homeVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_home"),
            selectedImage: UIImage(named: "icn_home_selected")
        )
        searchVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_search"),
            selectedImage: UIImage(named: "icn_search_selected")
        )
        reelsVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_reels"),
            selectedImage: UIImage(named: "icn_reels_selected")
        )
        shopVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_shop"),
            selectedImage: UIImage(named: "icn_shop_selected")
        )
        profileVC.tabBarItem = UITabBarItem(
            title: "",
            image: UIImage(named: "icn_profile"),
            selectedImage: UIImage(named: "icn_profile_selected")
        )
        
        setViewControllers([homeVC, searchVC, reelsVC, shopVC, profileVC], animated: true)
    }
}
