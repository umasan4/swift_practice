//
//  CustomTextField.swift
//  UIKit_Practice
//
//  Created by 井上由真 on 2020/11/11.
//

import UIKit

class CustomTextField: UITextField {
    init(placeholder: String) {
        super.init(frame: .zero)
        
        // 枠線
        borderStyle = .none
        // 文字色
        textColor = .white
        // 背景色(alpha: 透過)
        backgroundColor = UIColor(white: 1, alpha: 0.1)
        // 高さ
        setHeight(50)
        // キーボードの外観(dark: 黒)
        keyboardAppearance = .dark
        // キーボードの最適化(アドレス入力用）
        keyboardType = .emailAddress
        // プレースホルダー(attributes :装飾）
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                   attributes: [.foregroundColor: UIColor(white: 1,
                                                                                          alpha: 0.7)])
        // placeholder: 左側のpadding
        let spacer = UIView()
        spacer.setDimensions(height: 50, width: 12)
        leftView = spacer
        leftViewMode = .always
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
