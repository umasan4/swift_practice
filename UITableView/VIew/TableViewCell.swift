//
//  ViewModelCell.swift
//  UIKit_Practice
//
//  Created by 井上由真 on 2020/10/30.
//

import UIKit

class TableViewCell: UITableViewCell {
    // MARK: -  Properties
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .systemGreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
