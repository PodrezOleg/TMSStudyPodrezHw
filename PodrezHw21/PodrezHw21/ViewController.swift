//
//  ViewController.swift
//  PodrezHw21
//
//  Created by Oleg Podrez on 31.08.24.
//
import UIKit

class ViewController: UIViewController {
    
    let textView = UITextView()
    let applyFormatButton = UIButton(type: .system)
    let resetTextButton = UIButton(type: .system)
    let colorSegmentedControl = UISegmentedControl(items: ["Red", "Green", "Blue"])
    let fontSegmentedControl = UISegmentedControl(items: ["N", "B", "I"])
    let sizeSegmentedControl = UISegmentedControl(items: ["S", "M", "L"])
    let underlineSegmentedControl = UISegmentedControl(items: ["Без подчеркивания", "Подчеркнуть"])
    let fontSizes: [CGFloat] = [10, 14, 18, 22]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        
        setupTextView()
        setupSegmentedControls()
        setupButtons()
        setupKeyboardNotifications()
        setupTapGesture()
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupTextView() {
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1.0
        textView.layer.cornerRadius = 5.0
        textView.layer.backgroundColor = UIColor.white.withAlphaComponent(0.5).cgColor
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        
        NSLayoutConstraint.activate([
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.heightAnchor.constraint(equalToConstant: 100)
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
    
    private func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = -keyboardHeight / 1.5
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
    
    @objc private func applyFormatTapped() {
        applyFormatting()
    }
    
    @objc private func resetTextTapped() {
        textView.text = ""
        textView.attributedText = NSAttributedString(string: textView.text)
    }
    
    private func applyFormatting() {
        guard let selectedRange = textView.selectedTextRange else { return }
        
        let start = textView.offset(from: textView.beginningOfDocument, to: selectedRange.start)
        let length = textView.offset(from: selectedRange.start, to: selectedRange.end)
        let range = NSRange(location: start, length: length)
        
        let fullText = textView.text ?? ""
        let attributedText = NSMutableAttributedString(string: fullText)
        
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
        
        attributedText.addAttribute(.foregroundColor, value: selectedColor, range: range)
        attributedText.addAttribute(.font, value: selectedFont, range: range)
        
        if underlineSegmentedControl.selectedSegmentIndex == 1 {
            attributedText.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        } else {
            attributedText.removeAttribute(.underlineStyle, range: range)
        }
        
        textView.attributedText = attributedText
        
        if let startPos = textView.position(from: textView.beginningOfDocument, offset: range.location),
           let endPos = textView.position(from: startPos, offset: range.length),
           let newRange = textView.textRange(from: startPos, to: endPos) {
            textView.selectedTextRange = newRange
        }
    }
    
    private func getSelectedFontSize() -> CGFloat {
        let index = sizeSegmentedControl.selectedSegmentIndex
        if index >= 0 && index < fontSizes.count {
            return fontSizes[index]
        } else {
            return fontSizes[1]
        }
    }
}
