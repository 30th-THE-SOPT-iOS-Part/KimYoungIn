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

    @IBAction func backBtnDidTap(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goToPasswordVC(_ sender: Any) {
        let signupPasswordSB = UIStoryboard.init(name: Const.Storyboard.Name.signupPassword, bundle: nil)
        guard let signupPasswordVC = signupPasswordSB.instantiateViewController(withIdentifier: Const.ViewController.Identifier.signupPasswordVC) as? SignupPasswordViewController else { return }
        signupPasswordVC.name = nameTextField.text
        self.navigationController?.pushViewController(signupPasswordVC, animated: true)
    }
    
    private func setButton() {
        nextBtn.layer.cornerRadius = 5
    }
    
    private func setTextField() {
        nameTextField.clearButtonMode = .whileEditing
        nameTextField.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
    }
    
    @objc func editingChanged(_ textField: UITextField) {
        if (nameTextField.hasText) {
            nextBtn.backgroundColor = .systemBlue
            nextBtn.isEnabled = true
        } else {
            nextBtn.backgroundColor = .systemBlue.withAlphaComponent(0.5)
            nextBtn.isEnabled = false
        }
    }

}
