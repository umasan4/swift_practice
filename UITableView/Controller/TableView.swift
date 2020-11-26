//
//  ViewController.swift
//  UIKit_Practice
//
//  Created by 井上由真 on 2020/10/29.
//

import UIKit

// ~~ TableViewControllre ~~
// ① インスタンスを用意
// ②　DataSourceを宣言
// ③　UITableViewDelegateを宣言

// セルの識別子を定義
// TableView用のUIコンテナを定義

// セルの識別子を定義
private let reuseIdentifier = "TableViewCell"

class TableViewController: UIViewController {
    
    // MARK: - Properties
    
    // ① インスタンスを用意
    private let tableView = UITableView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemRed
        configureTableView()
    }
    
    // TableView用のUIコンテナを定義
    func configureTableView() {
        tableView.backgroundColor = .white
        // セル(高さ）
        tableView.rowHeight = 80
        // セル(登録)
        tableView.register(TableViewCell.self,
                           forCellReuseIdentifier: reuseIdentifier)
        // セル(余計な区切り線を消す)
        tableView.tableFooterView = UIView()
        // セル(Delegate)
        tableView.delegate = self
        // セル(DataSource)
        tableView.dataSource = self
        // TableView(Viewに追加)
        view.addSubview(tableView)
        // frameを同期
        tableView.frame = view.frame
    }
}

// MARK: - UITableViewDataSource
// ②　DataSourceを宣言

extension TableViewController: UITableViewDataSource {
    
    // セル数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    // セルの構成を返す
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell
        return cell
    }
}

// MARK: - UITableViewDelegate
// ③　UITableViewDelegateを宣言

// セルタッチ時のアクション
extension TableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("TEST: cell number of \(indexPath.row)")
    }
}
