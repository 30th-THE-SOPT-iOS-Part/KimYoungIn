//
//  SignupPasswordViewController.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/08.
//

import UIKit

class SignupPasswordViewController: UIViewController {

    var name: String?
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        setTextField()
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
    
    private func setButton() {
        nextBtn.layer.cornerRadius = 5
    }
    
    private func setTextField() {
        passwordTextField.clearButtonMode = .whileEditing
        passwordTextField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if (passwordTextField.hasText) {
            nextBtn.backgroundColor = .systemBlue
            nextBtn.isEnabled = true
        } else {
            nextBtn.backgroundColor = .systemBlue.withAlphaComponent(0.5)
            nextBtn.isEnabled = false
        }
    }

}
