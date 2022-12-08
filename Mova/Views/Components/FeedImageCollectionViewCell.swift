//
//  FeedImageCollectionViewCell.swift
//  Netflix Clone
//
//  Created by HauNguyen on 07/12/2565 BE.
//

import UIKit

class FeedImageCollectionViewCell: UICollectionViewCell {
        
    static let identifier = "FeedImageCollectionViewCellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
