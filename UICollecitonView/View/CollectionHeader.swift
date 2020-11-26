//
//  CollectionHeader.swift
//  UIKit_Practice
//
//  Created by 井上由真 on 2020/11/26.
//

import UIKit

class CollectionHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    // プロフ画像
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .lightGray
        iv.clipsToBounds = true
        return iv
    }()
    
    // 名前ラベル
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    // プロフ編集ボタン
    // プロフ画像をボタンに設定しているため、遅延関数を使用する
    private lazy var editProfileFollowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Edit Profile", for: .normal)
        button.layer.cornerRadius = 3
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(handleEditProfileFollowTapped), for: .touchUpInside)
        return button
    }()
    
    // postラベル
    private lazy var postLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = attributedStatText(value: 2, label: "posts")
        return label
    }()
    
    // フォロアーラベル
    private lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = attributedStatText(value: 2, label: "followers")
        return label
    }()
    
    // フォローラベル
    private lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.attributedText = attributedStatText(value: 1, label: "following")
        return label
    }()
    
    // グリッドボタン
    let gridButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        return button
    }()
    
    // リストボタン
    let listButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        button.setImage(#imageLiteral(resourceName: "Instagram_logo_white"), for: .normal)
        return button
    }()
    
    // ブックマークボタン
    let bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor(white: 0, alpha: 0.2)
        button.setImage(#imageLiteral(resourceName: "plus_photo"), for: .normal)
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        // プロフ画像
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 12)
        profileImageView.setDimensions(height: 80, width: 80)
        profileImageView.layer.cornerRadius = 80 / 2
        
        // 名前ラベル
        addSubview(nameLabel)
        nameLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        
        // プロフ画像ラベル
        addSubview(editProfileFollowButton)
        editProfileFollowButton.anchor(top: nameLabel.bottomAnchor, left: leftAnchor,right: rightAnchor,
                                       paddingTop: 12, paddingLeft: 24, paddingRight: 24)
        
        let stack = UIStackView(arrangedSubviews: [postLabel, followersLabel, followingLabel])
        
        // スタック
        addSubview(stack)
        stack.distribution = .fillEqually // distribution: 配置、分布
        stack.centerY(inView: profileImageView)
        stack.anchor(left: profileImageView.rightAnchor, right: rightAnchor,
                     paddingLeft: 12, paddingRight: 12, height: 50)
        
        // 仕切り線(上)
        let topDivider = UIView()
        topDivider.backgroundColor = .lightGray
        
        // 仕切り線(下)
        let bottomDivider = UIView()
        bottomDivider.backgroundColor = .lightGray
        
        // ボタン群
        let buttonStack = UIStackView(arrangedSubviews: [gridButton, listButton, bookmarkButton])
        buttonStack.distribution = .fillEqually
        
        // ボタン群
        addSubview(buttonStack)
        buttonStack.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 50)
        
        // 仕切り線(上)
        addSubview(topDivider)
        topDivider.anchor(top: buttonStack.topAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
        
        // 仕切り線(下)
        addSubview(bottomDivider)
        bottomDivider.anchor(top: buttonStack.bottomAnchor, left: leftAnchor, right: rightAnchor, height: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func handleEditProfileFollowTapped() {
        print("TEST: 画像を編集します")
    }
    
    // MARK: - Helpers
    
    // label用の装飾テキスト
    func attributedStatText(value: Int, label: String) -> NSAttributedString {
        let attribuetedText = NSMutableAttributedString(string: "\(value)\n",
                                                        attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        
        attribuetedText.append(NSAttributedString(string: label,
                                                  attributes: [.font: UIFont.systemFont(ofSize: 14),
                                                  .foregroundColor: UIColor.lightGray]))
        return attribuetedText
    }
}
