//
//  TableViewInCell.swift
//  OneGoTestProject
//
//  Created by Василий on 15.02.2022.
//

import UIKit

class TableViewInCell: UITableViewCell {

    // MARK: - properties

    let reuseId1 = "reuseId1"
    let tableView = UITableView()

    // MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseId1)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI

    func setupUI(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = contentView.bounds
        contentView.addSubview(tableView)
    }
    
}

// MARK: - extensions

extension TableViewInCell: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        cell.textLabel?.text = ""
        return cell
    }

}

extension TableViewInCell: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

}
