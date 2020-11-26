//
//  CustomButton.swift
//  UIKit_Practice
//
//  Created by 井上由真 on 2020/11/11.
//

import UIKit

class CustomButton: UIButton {
    init(title: String, enabled: Bool) {
        super.init(frame: .zero)
        
        // タイトル色
        setTitleColor(.white, for: .normal)
        // 背景色
        backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        // 角の丸み
        layer.cornerRadius = 5
        // 高さ
        setHeight(50)
        // 文字の書式
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        // ボタンの無効化
        isEnabled = enabled
        // ボタンの名前
        setTitle(title, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
