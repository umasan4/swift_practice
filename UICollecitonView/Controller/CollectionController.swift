//
//  CollectionController.swift
//  UIkit_Practice
//
//  Created by 井上由真 on 2020/11/02.
//

import UIKit

private let collectionIdentifier = "CollecitonCell"
private let headerIdentfier = "CollectionHeader"

class CollectionController: UICollectionViewController {
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    // MARK: - Herpers
    
    // UIを記述
    func configureCollectionView() {
        
        self.navigationItem.title = "Collection"
        
        collectionView.backgroundColor = .white
        
        // 使用するセルを登録
        collectionView.register(CollecitonCell.self, forCellWithReuseIdentifier: collectionIdentifier)
        
        // 使用するヘッダーを登録
        collectionView.register(CollectionHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerIdentfier)
    }
}

// MARK: - CollectionViewDataSource

// データソース
// 使用する、セルとヘッダーを定義

// ① numbrer Of Items Insection
// ② Cell For ItemAt
// ③ view For Supplementary Element Of Kind

extension CollectionController {
    
    // ① numbrer Of Items Insection
    // セル数を返す
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    // ② Cell For ItemAt
    // 生成するセルを定義
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // dequeueReusableCell
        // 画面から消えるとデコードされ、再利用されるセル
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionIdentifier, for: indexPath) as! CollecitonCell
        
        return cell
    }
    
    // ③ view For Supplementary Element Of Kind
    // サブViewを定義。(ここではヘッダーを定義)
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        // 追加するViewを登録(ここではヘッダー)
        // dequeueReusableSupplementaryView : 再利用可能なサブView
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                     withReuseIdentifier: headerIdentfier,
                                                                     for: indexPath) as! CollectionHeader
        return header
    }
}

// MARK: - CollectionViewDelegate

// セルタップ時の処理・アクションを定義
extension CollectionController {
    
}

// MARK: - CollectionViewDelegateFlowLayout

// DelegateFlowLayout
// 高さ・レイアウト等を定義

// ① minimum Interitem Spacing For Section At
// ② minimum LineSpacing For Section At
// ③ size For Item At
// ④ reference Size For Header In Section

extension CollectionController: UICollectionViewDelegateFlowLayout {
    
    // ① minimum Interitem Spacing For Section At
    // 垂直方向における、セル間のマージン
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // ② minimum LineSpacing For Section At
    // 水平方向における、セル間のマージン
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // ③ size For Item At
    // セルのサイズを定義
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 例) 3 × 3でセルを配置する
        // セルから、上で定義した、マージンを引き、3分割する
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
    
    // ④ reference Size For Header In Section
    // ヘッダーのサイズを定義
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 240)
    }
}
