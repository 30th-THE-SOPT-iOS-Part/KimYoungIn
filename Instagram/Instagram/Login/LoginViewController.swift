//
//  LoginViewController.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/08.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
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
    
    private func setButton() {
        loginBtn.layer.cornerRadius = 5
    }
    
    private func setTextField() {
        // 삭제 버튼
        nameTextField.clearButtonMode = .whileEditing
        // 이름, 비밀번호 값 채워지면 로그인 버튼 활성화
        [nameTextField, passwordTextField].forEach({ $0?.addTarget(self, action: #selector(textFieldChanged(_:)), for: .editingChanged) })
    }
    
    @objc func textFieldChanged(_ textField: UITextField) {
        if (nameTextField.hasText && passwordTextField.hasText) {
            loginBtn.backgroundColor = .systemBlue
            loginBtn.isEnabled = true
        } else {
            loginBtn.backgroundColor = .systemBlue.withAlphaComponent(0.5)
            loginBtn.isEnabled = false
        }
    }
    
}

