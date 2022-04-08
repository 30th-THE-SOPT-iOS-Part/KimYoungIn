//
//  SignupNameViewController.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/08.
//

import UIKit

class SignupNameViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nextBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButton()
        setTextField()
    }

    @IBAction func backBtnClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goToPasswordVC(_ sender: Any) {
        guard let signupPasswordVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupPasswordViewController") as? SignupPasswordViewController else { return }
        signupPasswordVC.name = nameTextField.text
        self.navigationController?.pushViewController(signupPasswordVC, animated: true)
    }
    
    private func setButton() {
        nextBtn.layer.cornerRadius = 5
    }
    
    private func setTextField() {
        nameTextField.clearButtonMode = .whileEditing
        nameTextField.addTarget(self, action: #selector(textFieldChanged(_:)), for: .editingChanged)
    }
    
    @objc func textFieldChanged(_ textField: UITextField) {
        if (nameTextField.hasText) {
            nextBtn.backgroundColor = .systemBlue
            nextBtn.isEnabled = true
        } else {
            nextBtn.backgroundColor = .systemBlue.withAlphaComponent(0.5)
            nextBtn.isEnabled = false
        }
    }

}