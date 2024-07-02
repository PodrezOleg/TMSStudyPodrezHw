//
//  HomePageViewController.swift
//  PodrezHw8
//
//  Created by Oleg Podrez on 1.07.24.
//

import UIKit
import SnapKit

class HomePageViewController: UIViewController {
    
    lazy var imageBackround = UIImageView()
    lazy var labelName = UILabel()
    lazy var labelControl = UILabel()
    lazy var labelEmoji = UILabel()
    lazy var labelLights = UILabel()
    lazy var labelDoor = UILabel()
    lazy var labelAC = UILabel()
    lazy var labelTemp = UILabel()
    lazy var wrapperUser = UIView()
    lazy var wrapperControls = UIView()
    lazy var controlLight = UISegmentedControl()
    lazy var controlDoor = UISegmentedControl()
    lazy var controlAC = UISegmentedControl()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Background Image
        
        imageBackround.image = UIImage(named: "Background4")
        imageBackround.translatesAutoresizingMaskIntoConstraints = false
        imageBackround.contentMode = .scaleAspectFit
        view.addSubview(imageBackround)
        imageBackround.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        //MARK: - wrapper properties
        
        wrapperUser.backgroundColor = .clear
        wrapperUser.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wrapperUser)
        wrapperUser.snp.makeConstraints { make in
            make.centerXWithinMargins.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.15)
        }
        
        wrapperControls.backgroundColor = .clear
        wrapperControls.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wrapperControls)
        wrapperControls.snp.makeConstraints { make in
            make.centerXWithinMargins.equalToSuperview()
            make.top.equalTo(wrapperUser.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.height.equalToSuperview().multipliedBy(0.6)
        }
        
        //MARK: - Label User
        
        labelName.text = "Welcome, user1232"
        labelName.textColor = .white
        labelName.font = .systemFont(ofSize: 30)
        labelName.lineBreakMode = .byWordWrapping
        labelName.numberOfLines = 0
        labelName.translatesAutoresizingMaskIntoConstraints = false
        wrapperUser.addSubview(labelName)
        labelName.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(wrapperUser.safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        labelControl.text = "Appartment control page"
        labelControl.textColor = .white
        labelControl.font = .systemFont(ofSize: 25)
        labelControl.lineBreakMode = .byWordWrapping
        labelControl.numberOfLines = 0
        labelControl.translatesAutoresizingMaskIntoConstraints = false
        wrapperUser.addSubview(labelControl)
        labelControl.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(labelName.snp.bottom).offset(15)
        }
        
        labelEmoji.text = "🏠"
        labelEmoji.font = .systemFont(ofSize: 30)
        labelEmoji.translatesAutoresizingMaskIntoConstraints = false
        wrapperUser.addSubview(labelEmoji)
        labelEmoji.snp.makeConstraints { make in
            make.top.equalTo(labelControl.snp.bottom)
        }
        
    
        //MARK: - Label Controls Light
        
        labelLights.text = "Lights"
        labelLights.textColor = .white
        labelLights.font = .systemFont(ofSize: 25)
        labelLights.translatesAutoresizingMaskIntoConstraints = false
        wrapperControls.addSubview(labelLights)
        labelLights.snp.makeConstraints { make in
            make.leftMargin.equalToSuperview()
            make.top.equalToSuperview().offset(30)
        }
        
       
        
        
        //MARK: Control initiation and properties for light
        
        controlLight = UISegmentedControl(items: [ "On", "Off"])
        controlLight.selectedSegmentIndex = 0
        wrapperControls.addSubview(controlLight)
        controlLight.translatesAutoresizingMaskIntoConstraints = false
        controlLight.snp.makeConstraints{ make in
            make.top.equalTo(labelLights.snp.bottom).offset(15)
            make.leading.equalTo(labelLights.snp.leading)
            make.height.equalTo(30)
            make.width.equalTo(150)
        }
        
        //MARK: - Label Controls Door
        
        labelDoor.text = "Door"
        labelDoor.textColor = .white
        labelDoor.font = .systemFont(ofSize: 25)
        labelDoor.translatesAutoresizingMaskIntoConstraints = false
        wrapperControls.addSubview(labelDoor)
        labelDoor.snp.makeConstraints { make in
            make.top.equalTo(controlLight.snp.bottom).offset(15)
           
        }
        
        //MARK: Control initiation and properties for Door
        
        controlDoor = UISegmentedControl(items: [ "Lock", "Unlock"])
        controlDoor.selectedSegmentIndex = 0
        wrapperControls.addSubview(controlDoor)
        controlDoor.translatesAutoresizingMaskIntoConstraints = false
        controlDoor.snp.makeConstraints{ make in
            make.top.equalTo(labelDoor.snp.bottom).offset(15)
            make.leading.equalTo(labelDoor.snp.leading)
            make.height.equalTo(30)
            make.width.equalTo(150)
        }
        
        //MARK: - Label Controls A/C
        
        labelAC.text = "A/C"
        labelAC.textColor = .white
        labelAC.font = .systemFont(ofSize: 25)
        labelAC.translatesAutoresizingMaskIntoConstraints = false
        wrapperControls.addSubview(labelAC)
        labelAC.snp.makeConstraints { make in
            make.top.equalTo(controlDoor.snp.bottom).offset(15)

        }
        
        //MARK: Control initiation and properties for A/C
        
        controlAC = UISegmentedControl(items: [ "Auto", "On", "Off"])
        controlAC.selectedSegmentIndex = 0
        wrapperControls.addSubview(controlAC)
        controlAC.translatesAutoresizingMaskIntoConstraints = false
        controlAC.snp.makeConstraints{ make in
            make.top.equalTo(labelAC.snp.bottom).offset(15)
            make.leading.equalTo(labelDoor.snp.leading)
            make.height.equalTo(30)
            make.width.equalTo(150)
        }
        
        
        
    }
}
            
