//
//  ViewController++.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/16.
//

import UIKit

extension UIViewController {
    
    func changeRootViewController(_ viewControllerToPresent: UIViewController) {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = viewControllerToPresent
        } else {
            viewControllerToPresent.modalPresentationStyle = .overFullScreen
            self.present(viewControllerToPresent, animated: true, completion: nil)
        }
    }
    
    // MARK: - alert창 확인버튼 눌러서 화면 전환
    func alertPresent(message: String, sb: String, vc: String) {
        let alertVC = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: { action in
            let vc = UIStoryboard(name: sb, bundle: nil).instantiateViewController(withIdentifier: vc)
            self.changeRootViewController(vc)
        })
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }
    
    // MARK: - alert창 확인버튼
    func alert(message: String) {
        let alertVC = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true)
    }

    
}
