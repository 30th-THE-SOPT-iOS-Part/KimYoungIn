//
//  SignupNameViewController.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/08.
//

import UIKit

class SignupNameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func backBtnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goToPasswordVC(_ sender: Any) {
        guard let signupPasswordVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupPasswordViewController") else { return }
        self.navigationController?.pushViewController(signupPasswordVC, animated: true)
    }
    
}
