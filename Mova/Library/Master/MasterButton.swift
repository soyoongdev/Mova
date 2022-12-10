//
//  MasterButton.swift
//  Mova
//
//  Created by HauNguyen on 09/12/2565 BE.
//

import UIKit

class MasterButton: MasterView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("init1")
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
    }

}
