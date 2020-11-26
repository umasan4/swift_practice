//
//  AuthenticationViewModel.swift
//  UIKit_Practice
//
//  Created by 井上由真 on 2020/11/11.
//

import UIKit

// Controller側で準拠
// Structで実装したインターフェースの実装用
protocol FormViewModel {
    func updataForm()
}

// ここのStruckに準拠
// 必要な機能の実装を確実に行う為
protocol AuthenticationViewModel {
    var buttonEnabled: Bool { get }
    var buttonBackGroundColor: UIColor { get }
    var buttonTintcolor: UIColor { get }
}

// MARK: -  LoginViewModel

struct LoginViewModel: AuthenticationViewModel{
    
    var email: String?
    var password: String?
    
    // フォーム両方に値が存在する場合のみ、真を返す
    var buttonEnabled: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    // 真の場合、ボタンの背景を変更する
    var buttonBackGroundColor: UIColor {
        return buttonEnabled ? #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
    }
    
    // 真の場合、ボタンのデフォルトカラーを変更する
    var buttonTintcolor: UIColor {
        return buttonEnabled ? .white : UIColor(white: 1, alpha: 0.67)
    }
}

// MARK: - RegistrationViewModel

struct RegistrationViewModel: AuthenticationViewModel {
    
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    
    // フォーム両方に値が存在する場合のみ、真を返す
    var buttonEnabled: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
            && fullname?.isEmpty == false && username?.isEmpty == false
    }
    
    // 真の場合、ボタンの背景を変更する
    var buttonBackGroundColor: UIColor {
        return buttonEnabled ? #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
    }
    
    // 真の場合、ボタンのデフォルトカラーを変更する
    var buttonTintcolor: UIColor {
        return buttonEnabled ? .white : UIColor(white: 1, alpha: 0.67)
    }
}
