//
//  SuccessViewController.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/08.
//

import UIKit

class SuccessViewController: UIViewController {
    
    var name: String?
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
    }
    
    @IBAction func successBtnDidTap(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func setLabel() {
        if let name = name {
            welcomeLabel.text = "\(name)님, Instagram에 오신 것을 환영합니다"
        }
    }
    
}
