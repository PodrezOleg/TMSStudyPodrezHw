//
//  ViewController.swift
//  PodrezHw13
//
//  Created by Oleg Podrez on 13.08.24.
//

import UIKit

class ProgrammingLanguageCell: UITableViewCell {
    
    let languageLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(languageLabel)
        contentView.addSubview(descriptionLabel)
        
        languageLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        NSLayoutConstraint.activate([
            languageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            languageLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            languageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo: languageLabel.bottomAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        descriptionLabel.numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let tableView = UITableView()
    
    let languages = ["Swift", "Python", "Java", "C++", "Ruby", "JavaScript", "HTML/CSS", "Rust", "Go", "PHP"]
    
    let descriptions = [
        "Ласточка (символ Swift), которая носится с невероятной скоростью, доставляя код, пока программист изо всех сил пытается за ней угнаться.",
        "Изображение питона (змеи), который обвивает программиста, предлагая ему кофе и расслабляющий код с минимальным количеством скобок.",
        "Чашка кофе, которая наполняется настолько медленно, что программист успевает задремать, прежде чем программа скомпилируется.",
        "Программист с огромной кучей инструментов, пытающийся отладить код, а над ним табличка: “Здесь начинается настоящая боль.",
        "Сценка, где программист буквально лепит драгоценный камень (Ruby), создавая чистый и красивый код, с надписью: “Программисты Ruby: ищем красоту во всём.",
        "Комичная сцена, где программист пытается исправить баг, а на фоне — хаос из-за асинхронного кода. Может быть добавлен мем с надписью: “Works on my machine.",
        "Сцена, где программист пытается выровнять элемент на странице, а над ним висит капризная коробка (div), которая двигается куда угодно, только не туда, куда нужно.",
        "Ржавый робот, который невероятно устойчив и не подвержен ошибкам, с надписью: “Программист на Rust: не бойся ржавчины, бойся ошибок”.",
        "Гигантская буква “G” с руками и ногами, которая гоняется за программистом с криками: “Сделай это быстро и эффективно!”",
        "Программист в маске хакера, пытающийся вставить PHP-код в HTML с надписью: “PHP — всё равно что тыкать палкой в работу серверов”."
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        let titleLabel = UILabel()
        titleLabel.text = "Языки программирования и их шутки"
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let titleView = UIView()
        titleView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: titleView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: titleView.trailingAnchor),
            titleLabel.topAnchor.constraint(equalTo: titleView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: titleView.bottomAnchor),
            titleView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 100)
        ])
        
        self.navigationItem.titleView = titleView
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ProgrammingLanguageCell.self, forCellReuseIdentifier: "languageCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "indexCell")
        
        tableView.frame = self.view.frame
        self.view.addSubview(tableView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 20
        } else {
            return languages.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
          
            let cell = tableView.dequeueReusableCell(withIdentifier: "indexCell", for: indexPath)
            cell.textLabel?.text = "Ячейка № \(indexPath.row + 1)"
            return cell
        } else {
          
            let cell = tableView.dequeueReusableCell(withIdentifier: "languageCell", for: indexPath) as! ProgrammingLanguageCell
            cell.languageLabel.text = languages[indexPath.row]
            cell.descriptionLabel.text = descriptions[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Индексы"
        } else {
            return "Языки программирования"
        }
    }
}
