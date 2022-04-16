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
    @IBOutlet weak var passwordShownBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        setTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        removeTextField()
    }
    
    @IBAction func loginBtnDidTap(_ sender: Any) {
        let successSB = UIStoryboard.init(name: Const.Storyboard.Name.success, bundle: nil)
        guard let successVC = successSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.successVC) as? SuccessViewController else { return }
        successVC.name = nameTextField.text
        successVC.modalPresentationStyle = .fullScreen
        self.present(successVC, animated: true)
    }
    
    @IBAction func signupBtnDidTap(_ sender: Any) {
        let signupNameSB = UIStoryboard.init(name: Const.Storyboard.Name.signupName, bundle: nil)
        guard let signupNameVC = signupNameSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.signupNameVC) as? SignupNameViewController else { return }
        self.navigationController?.pushViewController(signupNameVC, animated: true)
    }
    
    // 눈 모양 아이콘 클릭 이벤트
    @IBAction func passwordShownBtnDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        passwordTextField.isSecureTextEntry = !sender.isSelected
    }
    
    private func removeTextField() {
        [nameTextField, passwordTextField].forEach {
            $0?.text?.removeAll()
        }
    }
    
    private func setButton() {
        loginBtn.layer.cornerRadius = 5
    }
    
    private func setTextField() {
        nameTextField.clearButtonMode = .whileEditing
        [nameTextField, passwordTextField].forEach {
            $0?.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        }
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if (nameTextField.hasText && passwordTextField.hasText) {
            loginBtn.backgroundColor = .systemBlue
            loginBtn.isEnabled = true
        } else {
            loginBtn.backgroundColor = .systemBlue.withAlphaComponent(0.5)
            loginBtn.isEnabled = false
        }
    }
    
}

