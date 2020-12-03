//
//  RegistrationController.swift
//  UIKit_Practice
//
//  Created by 井上由真 on 2020/11/11.
//

import UIKit

class RegistrationController: UIViewController {
    // MARK: - Properties
    
    // AuthenticationViewModel
    private var viewModel = RegistrationViewModel()
    
    // ユーザが選択した画像（取得時点では値が存在しないのでオプショナル）
    private var profileImage: UIImage?
    
    // プロフ画像ボタン
    private let plusPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleProfileSelect), for: .touchUpInside)
        return button
    }()
    
    // メールアドレス
    private let emailTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Email")
        tf.keyboardType = .emailAddress
        return tf
    }()
    
    // パスワード
    private let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    
    // フルネーム
    private let fullnameTextField = CustomTextField(placeholder: "Fullname")
    
    // ユーザー名
    private let usernameTextField = CustomTextField(placeholder: "username")
    
    // サインアップボタン
    private let signUpButton: UIButton = {
        let button = CustomButton(title: "Sign up", enabled: false)
        button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
        return button
    }()
    
    // ログイン画面に遷移ボタン
    private let alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(title: "既にアカウントをお持ちの場合")
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureFormOfserver()
    }
    
    // MARK: - Actions
    
    // フォーム全てに値が存在する場合のみ、ボタンを有効化
    @objc func textDidchanged(sender: UITextField) {
        switch sender {
        case emailTextField:
            viewModel.email = sender.text
            
        case passwordTextField:
            viewModel.password = sender.text
            
        case fullnameTextField:
            viewModel.fullname = sender.text
            
        case usernameTextField:
            viewModel.username = sender.text
        default:
            print("Switch文でエラー")
        }
        updataForm()
    }
    
    @objc func handleSignUp() {
        print("サインアップの処理")
    }
    
    // プロフ画像ボタン
    // イメージピッカーへ遷移
    @objc func handleProfileSelect() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        configureGradientLayer()
        
        // 画像追加ボタン
        view.addSubview(plusPhotoButton)
        plusPhotoButton.centerX(inView: view)
        plusPhotoButton.setDimensions(height: 140, width: 140)
        plusPhotoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        // メール、パスワード, フルネーム、ユーザ名、サインアップボタン
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField,
                                                   fullnameTextField, usernameTextField,
                                                   signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: plusPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                     paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        // アカウント作成ボタン
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    // フォームの監視（入力があれば通知）
    func configureFormOfserver() {
        emailTextField.addTarget(self, action: #selector(textDidchanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidchanged), for: .editingChanged)
        fullnameTextField.addTarget(self, action: #selector(textDidchanged), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(textDidchanged), for: .editingChanged)
    }
}

// MARK: - FormViewModel

extension RegistrationController: FormViewModel {
    func updataForm() {
        signUpButton.backgroundColor = viewModel.buttonBackGroundColor
        signUpButton.tintColor = viewModel.buttonTintcolor
        signUpButton.isEnabled = viewModel.buttonEnabled
    }
}

extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // didFinishPickingMediaWithInfo: 画像の選択後に走る処理
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // editedImage: ユーザーが選択した画像にアクセス
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        
        // ユーザーが選択した画像を保持
        profileImage = selectedImage
        
        // ボタンのフレーム設定（ここに画像を表示）
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width / 2
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.borderWidth = 2
        
        // ユーザーが選択した画像をセット
        // alwaysOriginal: 画像の元の形式を保ち、変更しない
        plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        // イメージピッカーから退出する
        self.dismiss(animated: true, completion: nil)
    }
}
