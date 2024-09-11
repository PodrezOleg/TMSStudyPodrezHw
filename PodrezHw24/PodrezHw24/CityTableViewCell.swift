//
//  CityTableViewCell.swift
//  PodrezHw24
//
//  Created by Oleg Podrez on 10.09.24.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupUI()
     }
     
     required init?(coder: NSCoder) {
         super.init(coder: coder)
         setupUI()
     }
     
     private func setupUI() {
         contentView.backgroundColor = .clear
         contentView.layer.cornerRadius = 15
         contentView.layer.masksToBounds = true
         contentView.layer.borderColor = UIColor.clear.cgColor
         contentView.layer.borderWidth = 2
     }
 }
