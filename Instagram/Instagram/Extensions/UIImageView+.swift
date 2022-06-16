//
//  UIImageView+.swift
//  Instagram
//
//  Created by 김영인 on 2022/05/12.
//

import Foundation
import UIKit

extension UIImageView {
    
    func urlToImg(_ imgURL: String) {
        let url = URL(string: imgURL)
        if url != nil {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: url!)
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }
        }
    }
    
}
