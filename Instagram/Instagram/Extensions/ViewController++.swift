//
//  ViewController++.swift
//  Instagram
//
//  Created by 김영인 on 2022/04/16.
//

import UIKit

extension UIViewController {
    
    func changeRootViewController(_ viewControllerToPresent: UIViewController) {
        if let window = UIApplication.shared.windows.first {    //
            window.rootViewController = viewControllerToPresent
        } else {
            viewControllerToPresent.modalPresentationStyle = .overFullScreen
            self.present(viewControllerToPresent, animated: true, completion: nil)
        }
    }
    
}
