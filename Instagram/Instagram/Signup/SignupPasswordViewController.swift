//
//  SignupPasswordViewController.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/08.
//

import UIKit

class SignupPasswordViewController: UIViewController {

    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goToSuccessVC(_ sender: Any) {
        guard let successVC = self.storyboard?.instantiateViewController(withIdentifier: "SuccessViewController") as? SuccessViewController else { return }
        successVC.name = self.name
        successVC.modalPresentationStyle = .fullScreen
        self.present(successVC, animated: true)
        self.navigationController?.popToRootViewController(animated: true)
    }

}
