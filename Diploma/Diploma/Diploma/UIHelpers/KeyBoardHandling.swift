//
//  KeyBoardHandling.swift
//  Diploma
//
//  Created by Oleg Podrez on 16.12.2024.
//

import UIKit

extension UIViewController {
    func setupKeyboardHandling() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    func removeKeyboardHandling() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
        let keyboardHeight = keyboardFrame.height

        if let activeField = view.firstResponder {
            let fieldFrameInView = activeField.convert(activeField.bounds, to: view)
            let bottomSpace = view.frame.height - (fieldFrameInView.origin.y + fieldFrameInView.height)

            if bottomSpace < keyboardHeight {
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin.y = -(keyboardHeight - bottomSpace + 20)
                }
            }
        }
    }

    @objc private func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.3) {
            self.view.frame.origin.y = 0
        }
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension UIView {
    var firstResponder: UIView? {
        if self.isFirstResponder { return self }
        for subview in self.subviews {
            if let firstResponder = subview.firstResponder {
                return firstResponder
            }
        }
        return nil
    }
}
