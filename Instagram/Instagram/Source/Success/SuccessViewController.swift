//
//  SuccessViewController.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/08.
//

import UIKit

class SuccessViewController: UIViewController {
    
    var name: String?
    var password: String?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
    }
    
    @IBAction func successBtnDidTap(_ sender: Any) {
        signup()
        let tabBarSB = UIStoryboard(name: Const.Storyboard.Name.tabBar, bundle: nil)
        guard let tabBarController = tabBarSB.instantiateViewController(withIdentifier: Const.TabBarController.Identifier.tabBarController) as? TabBarController else { return }
        changeRootViewController(tabBarController)  // tabBarController를 최상위 뷰컨으로 바꾸기
    }
    
    @IBAction func otherAccountBtnDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func setLabel() {
        if let name = name {
            welcomeLabel.text = "\(name)님, Instagram에 오신 것을 환영합니다"
        }
    }
    
}

extension SuccessViewController {
    func signup() {
        guard let email = name else { return }
        guard let password = password else { return }
        
        UserService.shared.signup(
            name: email,
            email: email,
            password: password) { response in
                switch response {
                case .success(let data):
                    guard let data = data as? SignupResponse else { return }
                    print("🔥 \(data)")
                default:
                    print("❌ \(response)")
                    return
                }
            }
    }
}
