//
//  VideoListVC.swift
//  PodrezHw13.1_new
//
//  Created by Oleg Podrez on 14.08.24.
//

import UIKit

class VideoListVC: UIViewController {

    var tableView = UITableView()
    var videos: [Video] = []
    
    struct Cells {
        static let VideoCell = "VideoCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Щутки за код"
        videos = fetchData()
        cofigureTableView()
    }
    
  
    
    func cofigureTableView() {
        view.addSubview(tableView)
        setTableViewDelagates()
        tableView.rowHeight = 100
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.VideoCell)
        tableView.pin(to: view)
    
    }

    func setTableViewDelagates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
   
}

extension VideoListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.VideoCell) as! VideoCell
        let video = videos[indexPath.row]
        cell.set(video: video)
        
        
        return cell
    }
    
}


extension VideoListVC {
    func fetchData() -> [Video] {
        let video1 = Video(image: Images.Swift!, title: "Ласточка (символ Swift), которая носится с невероятной скоростью, доставляя код, пока программист изо всех сил пытается за ней угнаться.")
        let video2 = Video(image: Images.Go!, title: "Гигантская буква “G” с руками и ногами, которая гоняется за программистом с криками: “Сделай это быстро и эффективно!”")
        let video3 = Video(image: Images.HTML!, title: "Сцена, где программист пытается выровнять элемент на странице, а над ним висит капризная коробка (div), которая двигается куда угодно, только не туда, куда нужно.")
        let video4 = Video(image: Images.PHP!, title: "Программист в маске хакера, пытающийся вставить PHP-код в HTML с надписью: “PHP — всё равно что тыкать палкой в работу серверов")
        let video5 = Video(image: Images.Ruby!, title: "Сценка, где программист буквально лепит драгоценный камень (Ruby), создавая чистый и красивый код, с надписью: “Программисты Ruby: ищем красоту во всём”.")
        let video6 = Video(image: Images.Rust!, title: "Ржавый робот, который невероятно устойчив и не подвержен ошибкам, с надписью: “Программист на Rust: не бойся ржавчины, бойся ошибок”.")
        let video7 = Video(image: Images.cPlusPlus!, title: "Программист с огромной кучей инструментов, пытающийся отладить код, а над ним табличка: “Здесь начинается настоящая боль”.")
        let video8 = Video(image: Images.java!, title: "Чашка кофе, которая наполняется настолько медленно, что программист успевает задремать, прежде чем программа скомпилируется.")
        let video9 = Video(image: Images.javaScript!, title: "Комичная сцена, где программист пытается исправить баг, а на фоне — хаос из-за асинхронного кода. Может быть добавлен мем с надписью: “Works on my machine”.")
        let video10 = Video(image: Images.python!, title: "Изображение питона (змеи), который обвивает программиста, предлагая ему кофе и расслабляющий код с минимальным количеством скобок.")
                           
        return [video1, video2, video3, video4, video5, video6, video7, video8, video9, video10]
    }
}
