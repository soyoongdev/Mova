//
//  Extension+UIImageView.swift
//  Mova
//
//  Created by HauNguyen on 28/12/2565 BE.
//

import UIKit

extension UIImageView {
    
    func loadFromUrl(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let resultImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = resultImage
                    }
                }
            }
        }
    }
    
}
