//
//  ViewController.swift
//  PodrezHw11
//
//  Created by Oleg Podrez on 14.07.24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        lazy var calculatorMainView = UIStackView()
        lazy var calculatorLabelResult = UILabel()
        lazy var row1 = UIStackView()
        lazy var row2 = UIStackView()
        lazy var row3 = UIStackView()
        lazy var row4 = UIStackView()
        lazy var row5 = UIStackView()
        
        view.addSubview(calculatorMainView)
        view.addSubview(calculatorLabelResult)
        
        calculatorMainView.translatesAutoresizingMaskIntoConstraints = false
        calculatorLabelResult.translatesAutoresizingMaskIntoConstraints = false
        
        calculatorMainView.axis = .vertical
        calculatorMainView.spacing = 10
        calculatorMainView.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        calculatorMainView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        rowsInMainStackView(row1, row2, row3, row4, row5)
        
        calculatorLabelResult.text = "0"
        calculatorLabelResult.font = .systemFont(ofSize: 80)
        calculatorLabelResult.textColor = .white
        calculatorLabelResult.textAlignment = .right
        
        calculatorLabelResult.bottomAnchor.constraint(equalTo: calculatorMainView.topAnchor, constant: -10).isActive = true
        calculatorLabelResult.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 210).isActive = true
        calculatorLabelResult.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
//MARK: row1
    

        row1.spacing = 10
        row1.distribution = .fillEqually
        
        row1.addArrangedSubview(grayItem(itemTitle: "AC"))
        row1.addArrangedSubview(grayItem(itemTitle: "+/-"))
        row1.addArrangedSubview(grayItem(itemTitle: "%"))
        row1.addArrangedSubview(orangeItem(itemTitle: "÷"))
        
//MARK: row2
       
        row2.spacing = 10
        row2.distribution = .fillEqually
       
        row2.addArrangedSubview(blackItem(itemTitle: "7"))
        row2.addArrangedSubview(blackItem(itemTitle: "8"))
        row2.addArrangedSubview(blackItem(itemTitle: "9"))
        row2.addArrangedSubview(orangeItem(itemTitle: "x"))
        
//MARK: row4
        
        row3.spacing = 10
        row3.distribution = .fillEqually
       
        row3.addArrangedSubview(blackItem(itemTitle: "4"))
        row3.addArrangedSubview(blackItem(itemTitle: "5"))
        row3.addArrangedSubview(blackItem(itemTitle: "6"))
        row3.addArrangedSubview(orangeItem(itemTitle: "-"))
        
//MARK: row4
        
        row4.spacing = 10
        row4.distribution = .fillEqually
        
        row4.addArrangedSubview(blackItem(itemTitle: "1"))
        row4.addArrangedSubview(blackItem(itemTitle: "2"))
        row4.addArrangedSubview(blackItem(itemTitle: "3"))
        row4.addArrangedSubview(orangeItem(itemTitle: "+"))
        
//MARK: row5
        
       
        row5.spacing = 10
        row5.distribution = .fill
     
        row5.addArrangedSubview(zeroItem(itemTitle: "0"))
        row5.addArrangedSubview(blackItem(itemTitle: ","))
        row5.addArrangedSubview(orangeItem(itemTitle: "="))
        
//MARK: = Functions
        
        func grayItem(itemTitle: String) -> UIButton {
            let item = UIButton()
            item.backgroundColor = .systemGray
            item.layer.cornerRadius = 40
            item.titleLabel?.font = .systemFont(ofSize: 44)
            item.setTitle(itemTitle, for: .normal)
            item.snp.makeConstraints {make in
                make.width.equalTo(80)
                make.height.equalTo(80)
            }
            return item
        }
        
        func orangeItem(itemTitle: String) -> UIButton {
            let item = UIButton()
            item.backgroundColor = .systemOrange
            item.layer.cornerRadius = 40
            item.titleLabel?.font = .systemFont(ofSize: 44)
            item.setTitle(itemTitle, for: .normal)
            item.snp.makeConstraints {make in
                make.width.equalTo(80)
                make.height.equalTo(80)
            }
            return item
        }
        
        func blackItem(itemTitle: String) -> UIButton {
            let item = UIButton()
            item.backgroundColor = .darkGray
            item.layer.cornerRadius = 40
            item.titleLabel?.font = .systemFont(ofSize: 44)
            item.setTitle(itemTitle, for: .normal)
            item.snp.makeConstraints {make in
                make.width.equalTo(80)
                make.height.equalTo(80)
            }
            return item
        }
        func zeroItem(itemTitle: String) -> UIButton {
            let item = UIButton()
            item.backgroundColor = .darkGray
            item.layer.cornerRadius = 40
            item.titleLabel?.font = .systemFont(ofSize: 44)
            item.setTitle(itemTitle, for: .normal)
            item.snp.makeConstraints {make in
                make.width.equalTo(160)
                make.height.equalTo(80)
            }
            return item
        }

        func rowsInMainStackView(_ rows: UIStackView...) {
            rows.forEach{calculatorMainView.addArrangedSubview($0)
            
            }
        }
        
        
        
    }
}
