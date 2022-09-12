//
//  ViewController.swift
//  OneGoTestProject
//
//  Created by Василий on 15.02.2022.
//

import UIKit

final class TableViewController: UIViewController {

    // MARK: - properties

    let reuseId = "reuseId"
    let reuseId1 = "reuseId1"

    let tableView = UITableView()
    let firstModel = FirstModel.items
    let secondModel = SecondModel.items
    let thirdModel = ThirdModel.items

    // MARK: - lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - UI

    private func setupUI() {
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: reuseId)
        tableView.register(TableViewInCell.self, forCellReuseIdentifier: reuseId1)
        tableView.frame = view.bounds
        tableView.rowHeight = UITableView.automaticDimension
        view.addSubview(tableView)
    }

}

// MARK: - extensions

extension TableViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Ячейки с изменяемыми размерами"
        case 1:
            return "Одна секция с динамической ячейкой"
        case 2:
            return "Таблица с фиксированной высотой ячеек"
        default:
            return "Капут"
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return firstModel.count
        case 1:
            return secondModel.count
        case 2:
            return thirdModel.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
            cell.configure1(model: firstModel[indexPath.row])
            return cell
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId, for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
            cell.configure2(model: secondModel[indexPath.row])
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseId1, for: indexPath) as? TableViewInCell else { return UITableViewCell() }
            cell.textLabel?.text = thirdModel[indexPath.row].description
            return cell
        default:
            return UITableViewCell()
        }
    }

}
