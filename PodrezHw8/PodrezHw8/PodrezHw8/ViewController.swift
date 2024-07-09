//
//  ViewController.swift
//  PodrezHw8
//
//  Created by Oleg Podrez on 30.06.24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. \nLorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. \nIt has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.\n It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.backgroundColor = .gray
        label.textColor = .white
        
        actionButton.backgroundColor = .red
    }
    
    @IBAction func actionButtonTouched(_ sender: Any) {
        let colors: [UIColor] = [.red, .green, .blue, .orange, .clear]
        actionButton.backgroundColor = colors.randomElement()
    }
}

