//
//  ViewController.swift
//  PodrezHw21
//
//  Created by Oleg Podrez on 31.08.24.
//
import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    let textView = UITextView()
    let applyFormatButton = UIButton(type: .system)
    let resetTextButton = UIButton(type: .system)
    let colorSegmentedControl = UISegmentedControl(items: ["Red", "Green", "Blue"])
    let fontSegmentedControl = UISegmentedControl(items: ["N", "B", "I"])
    let sizeSegmentedControl = UISegmentedControl(items: ["S", "M", "L"])
    let underlineSegmentedControl = UISegmentedControl(items: ["Без подчеркивания", "Подчеркивание"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        
        setupTextView()
        setupSegmentedControls()
        setupButtons()
        setupKeyboardNotifications()
        setupTapGesture()
        
        textView.delegate = self
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupTextView() {
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 10.0
        textView.layer.backgroundColor = .init(genericGrayGamma2_2Gray: 1, alpha: 0.5)
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func setupSegmentedControls() {
        
        let stackView = UIStackView(arrangedSubviews: [colorSegmentedControl, fontSegmentedControl, sizeSegmentedControl, underlineSegmentedControl])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    private func setupButtons() {
        applyFormatButton.setTitle("Применить формат", for: .normal)
        applyFormatButton.setTitleColor(.white, for: .normal)
        resetTextButton.setTitle("Сбросить текст", for: .normal)
        resetTextButton.setTitleColor(.white, for: .normal)
        
        applyFormatButton.addTarget(self, action: #selector(applyFormatTapped), for: .touchUpInside)
        resetTextButton.addTarget(self, action: #selector(resetTextTapped), for: .touchUpInside)
        
        let buttonStackView = UIStackView(arrangedSubviews: [applyFormatButton, resetTextButton])
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 20
        buttonStackView.distribution = .fillEqually
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: underlineSegmentedControl.bottomAnchor, constant: 20),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        textView.becomeFirstResponder()
    }
   
    private func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = -keyboardHeight / 2
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0
        }
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textViewDidChange(_ textView: UITextView) {
        applyFormatting()
    }
    
   
    @objc private func applyFormatTapped() {
        applyFormatting()
    }
    
    @objc private func resetTextTapped() {
        textView.attributedText = nil
        textView.text = ""
    }
    
    private func applyFormatting() {
        guard textView.selectedTextRange != nil else { return }
        let attributedText = NSMutableAttributedString(attributedString: textView.attributedText)
        
      
        let selectedColor: UIColor
        switch colorSegmentedControl.selectedSegmentIndex {
        case 0: selectedColor = .red
        case 1: selectedColor = .green
        case 2: selectedColor = .blue
        default: selectedColor = .black
        }
        
      
        let selectedFont: UIFont
        switch fontSegmentedControl.selectedSegmentIndex {
        case 0: selectedFont = UIFont.systemFont(ofSize: getSelectedFontSize())
        case 1: selectedFont = UIFont.boldSystemFont(ofSize: getSelectedFontSize())
        case 2: selectedFont = UIFont.italicSystemFont(ofSize: getSelectedFontSize())
        default: selectedFont = UIFont.systemFont(ofSize: getSelectedFontSize())
        }
        
      
        let range = textView.selectedRange
        attributedText.addAttribute(.foregroundColor, value: selectedColor, range: range)
        attributedText.addAttribute(.font, value: selectedFont, range: range)
        
        if underlineSegmentedControl.selectedSegmentIndex == 1 {
            attributedText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        } else {
            attributedText.removeAttribute(.underlineStyle, range: range)
        }
        
        textView.attributedText = attributedText
        textView.selectedRange = range
    }
    
    private func getSelectedFontSize() -> CGFloat {
        switch sizeSegmentedControl.selectedSegmentIndex {
        case 0: return 10
        case 1: return 14
        case 2: return 20
        default: return 15
        }
    }
}
