//
//  ViewController.swift
//  PodrezHw10
//
//  Created by Oleg Podrez on 10.07.24.
//

import UIKit

class ViewController: UIViewController {
    
    let buttonTo5th = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        buttonTo5th.frame = .init(x: 50, y: 350, width: 100, height: 25)
        buttonTo5th.setTitle("5th Base", for: .normal)
        buttonTo5th.setTitleColor(.systemOrange, for: .normal)
        view.addSubview(buttonTo5th)
        buttonTo5th.addTarget(self, action: #selector(pushThebutton), for: .touchUpInside)
    }
    
    @objc func pushThebutton() {
        let vc2 = vc2()
        vc2.gotTheMessage = "Peekaboo"
        navigationController?.pushViewController(vc2, animated: true)
        print("Working")
    }
}

class vc2: UIViewController {
    var gotTheMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
            let vc3 = vc3()
            self.navigationController?.pushViewController(vc3, animated: true)
    }
}

class vc3: UIViewController {
    var gotTheMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
            let vc4 = vc4()
            self.navigationController?.pushViewController(vc4, animated: true)
    }
}

class vc4: UIViewController {
    var gotTheMessage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
            let vc5 = vc5()
            self.navigationController?.pushViewController(vc5, animated: true)
    }
}

class vc5: UIViewController {
    var gotTheMessage: String?
    var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label = UILabel(frame: CGRect(x: 50, y: 350, width: 130, height: 50))
        label?.text = gotTheMessage
        if let label = label {
            view.addSubview(label)
        }
    }
}
