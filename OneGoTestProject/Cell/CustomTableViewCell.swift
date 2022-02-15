//
//  CustomTableViewCell.swift
//  OneGoTestProject
//
//  Created by Василий on 15.02.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    // MARK: - properties

    let infoTextLabel: UILabel = {
        let infoTextLabel = UILabel()
        infoTextLabel.textColor = .black
        infoTextLabel.numberOfLines = 0
        return infoTextLabel
    }()

    let reuseId = "reuseId"

    // MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseId)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI

    private func setupUI(){
        let magnitude = contentView.layoutMarginsGuide
        contentView.addSubview(infoTextLabel)
        infoTextLabel.numberOfLines = 0
        infoTextLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            infoTextLabel.leadingAnchor.constraint(equalTo: magnitude.leadingAnchor),
            infoTextLabel.topAnchor.constraint(equalTo: magnitude.topAnchor),
            infoTextLabel.bottomAnchor.constraint(equalTo: magnitude.bottomAnchor),
            infoTextLabel.trailingAnchor.constraint(equalTo: magnitude.trailingAnchor)
        ])
        
    }

    // MARK: - configuration methods

    func configure1(model: FirstModel){
        self.infoTextLabel.text = model.description
    }

    func configure2(model: SecondModel){
        self.infoTextLabel.text = model.description
    }

}
