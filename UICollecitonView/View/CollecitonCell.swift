//
//  CollecitonCell.swift
//  UIKit_Practice
//
//  Created by 井上由真 on 2020/11/26.
//

import UIKit

class CollecitonCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "plus_photo")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        
        addSubview(postImageView)
        // fillSuperview
        // 親(CollectionCell)にあたるViewを満たすように表示 (※ 拡張機能)
        postImageView.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
