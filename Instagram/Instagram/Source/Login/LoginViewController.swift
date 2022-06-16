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
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resetTextField()
    }
    
    @IBAction func loginBtnDidTap(_ sender: Any) {
        login()
//        let successSB = UIStoryboard.init(name: Const.Storyboard.Name.success, bundle: nil)
//        guard let successVC = successSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.successVC) as? SuccessViewController else { return }
//        successVC.name = nameTextField.text
//        successVC.modalPresentationStyle = .fullScreen
//        self.present(successVC, animated: true)
    }
    
    @IBAction func signupBtnDidTap(_ sender: Any) {
        let signupNameSB = UIStoryboard.init(name: Const.Storyboard.Name.signup, bundle: nil)
        guard let signupNameVC = signupNameSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.signupNameVC) as? SignupNameViewController else { return }
        self.navigationController?.pushViewController(signupNameVC, animated: true)
    }
    
    private func setUI() {
        setButton()
        setTextField()
    }
    
    private func resetTextField() {
        [nameTextField, passwordTextField].forEach {
            $0?.text?.removeAll()
        }
    }
    
    private func setButton() {
        setLoginBtn()
        setPasswordShownBtn()
    }
    
    private func setLoginBtn() {
        loginBtn.layer.cornerRadius = 5
    }
    
    private func setPasswordShownBtn() {
        let passwordShownBtn = UIButton(type: .custom)
        passwordShownBtn.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        passwordShownBtn.tintColor = .lightGray
        passwordShownBtn.setImage(Const.Icon.pwHidden, for: .normal)
        passwordShownBtn.setImage(Const.Icon.pwShown, for: .selected)
        passwordShownBtn.addTarget(self, action: #selector(passwordShownBtnDidTap(_:)), for: .touchUpInside)
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        rightView.addSubview(passwordShownBtn)
        passwordTextField.rightView = rightView
        passwordTextField.rightViewMode = .always
    }
    
    @objc func passwordShownBtnDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
        passwordTextField.isSecureTextEntry = !sender.isSelected
        sender.tintColor = sender.isSelected ? .systemBlue : .lightGray
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

extension LoginViewController {
    func login() {
        guard let email = nameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        UserService.shared.login(
            email: email,
            password: password) { response in
                switch response {
                case .success(let data):
                    guard let data = data as? BaseResponse<Login> else { return }
                    self.alertPresent(message: "로그인 성공", sb: Const.Storyboard.Name.tabBar, vc: Const.TabBarController.Identifier.tabBarController)
                    print("🔥 \(data)")
                default:
                    self.alert(message: "로그인 실패")
                    print("❌ \(response)")
                    return
                }
            }
    }
}
