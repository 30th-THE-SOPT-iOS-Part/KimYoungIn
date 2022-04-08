//
//  LoginViewController.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/08.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextField()
    }

    @IBAction func loginBtnClick(_ sender: Any) {
        guard let successVC = self.storyboard?.instantiateViewController(withIdentifier: "SuccessViewController") as? SuccessViewController else { return }
        successVC.name = nameTextField.text
        successVC.modalPresentationStyle = .fullScreen
        self.present(successVC, animated: true)
    }
    
    @IBAction func SignupBtnClick(_ sender: Any) {
        guard let signupNameVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupNameViewController") else { return }
        self.navigationController?.pushViewController(signupNameVC, animated: true)
    }
    
    private func setTextField() {
        nameTextField.clearButtonMode = .whileEditing
    }
    
}

