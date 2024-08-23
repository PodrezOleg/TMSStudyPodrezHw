//
//  SelectGenderViewController.swift
//  PodrezHw12
//
//  Created by Oleg Podrez on 11.08.24.
//

import UIKit

class SelectGenderViewController: UIViewController {

    weak var delegate: SelectGenderViewControllerDelegate?

    private let genderSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["Мужской", "Женский"])
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сохранить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let initialGender: String

    init(currentGender: String) {
        self.initialGender = currentGender
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Укажите ваш пол"

        setupUI()
        configureSegmentedControl()
        setupActions()
    }

    
    private func setupUI() {
        view.addSubview(genderSegmentedControl)
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate([
            genderSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            genderSegmentedControl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            saveButton.topAnchor.constraint(equalTo: genderSegmentedControl.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func configureSegmentedControl() {
        // Set the initial selected index based on the current gender
        switch initialGender {
        case "Мужской":
            genderSegmentedControl.selectedSegmentIndex = 0
        case "Женский":
            genderSegmentedControl.selectedSegmentIndex = 1
        default:
            genderSegmentedControl.selectedSegmentIndex = UISegmentedControl.noSegment
        }
    }

    private func setupActions() {
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }

    @objc private func saveButtonTapped() {
        let selectedGender = genderSegmentedControl.selectedSegmentIndex == 0 ? "Мужской" : "Женский"
        delegate?.didSelectGender(selectedGender)
        dismiss(animated: true, completion: nil)
    }
}
