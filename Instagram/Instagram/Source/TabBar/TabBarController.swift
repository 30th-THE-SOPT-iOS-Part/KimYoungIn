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
            image: Const.Icon.home,
            selectedImage: Const.Icon.homeSelected
        )
        searchVC.tabBarItem = UITabBarItem(
            title: "",
            image: Const.Icon.search,
            selectedImage: Const.Icon.searchSelected
        )
        reelsVC.tabBarItem = UITabBarItem(
            title: "",
            image: Const.Icon.reels,
            selectedImage: Const.Icon.reelSelected
        )
        shopVC.tabBarItem = UITabBarItem(
            title: "",
            image: Const.Icon.shop,
            selectedImage: Const.Icon.shopSelected
        )
        profileVC.tabBarItem = UITabBarItem(
            title: "",
            image: Const.Icon.profile,
            selectedImage: Const.Icon.profileSelected
        )
        
        setViewControllers([homeVC, searchVC, reelsVC, shopVC, profileVC], animated: true)
    }
}

extension TabBarController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("\(item)")
    }
}
