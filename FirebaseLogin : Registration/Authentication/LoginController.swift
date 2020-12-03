//
//  LoginController.swift
//  UIKit_Practice
//
//  Created by 井上由真 on 2020/11/11.
//

import UIKit

class LoginController: UIViewController {
    
    // MARK: - Properties
    
    // AuthenticationViewModel
    private var viewModel = LoginViewModel()
    
    // アイコン
    private let iconImage: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "Instagram_logo_white"))
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    // Eメール
    private let emailTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Email")
        return tf
    }()
    
    // パスワード
    private let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    // ログインボタン
    private let loginButton: UIButton = {
        let button = CustomButton(title: "Log in", enabled: false)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    // パスワード変更ボタン
    private let fogotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(title: "パスワードを忘れてしまった場合")
        button.addTarget(self, action: #selector(handleChangePassword), for: .touchUpInside)
        return button
    }()
    
    // 新規登録ボタン
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(title: "アカウントをお持ちでない場合")
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configure_Notfication_Observers()
    }
    
    // MARK: - Actions
    
    // 各フォームへの値の入力を監視
    // sender: 入力された値を格納、入力抜けがないかBool値で返す
    // updataForm: Bool値に応じて、ボタンの有効、無効化を行う
    @objc func textDidChange(sender: UITextField) {
        if sender == emailTextField {
            viewModel.email = emailTextField.text
        } else {
            viewModel.password = passwordTextField.text
        }
        updataForm()
    }
    
    
    @objc func handleChangePassword() {
        print("パスワードの変更を実行します")
    }
    
    @objc func handleShowSignUp() {
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc func handleLogin() {
        print("ログイン処理を実行")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        configureGradientLayer()
        
        // navバー
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        // アイコン
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 80, width: 120)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        // 入力フォーム、ボタン類
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField,
                                                   loginButton, fogotPasswordButton])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                     paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        // 新規作成ボタン
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    // フォームの監視（入力があれば通知）
    func configure_Notfication_Observers() {
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

// MARK: - FormViewModel

// buttonEnabled: の真偽に応じてボタンを有効化する
extension LoginController: FormViewModel {
    func updataForm() {
        loginButton.backgroundColor = viewModel.buttonBackGroundColor
        loginButton.setTitleColor(viewModel.buttonTintcolor, for: .normal)
        loginButton.isEnabled = viewModel.buttonEnabled
    }
}

