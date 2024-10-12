//
//  LayoutConstants.swift
//  HW30
//
//  Created by Oleg Podrez on 12.10.24.
//

import UIKit

struct LayoutConstants {
    // Размер Шрифтов
    static let titleFontSize: CGFloat = 30
    static let buttonFontSize: CGFloat = 20
    static let labelMainSize: CGFloat = 20
    
    // Размер и отступы для кнопки
    static let buttonHeight = 50
    static let buttonWidth = 150
    static let buttonWidthMultiplier: CGFloat = 0.7
    static let cornerRadiusButton: CGFloat = 10
    static let borderWidthButton: CGFloat = 1
    static let shadowOffsetButton: CGSize = .init(width: 2, height: 2)
    static let shadowOpacityButton: Float = 0.7
    static let shadowRadiusButton: CGFloat = 4
    
    // Отступы
    static let topOffset: CGFloat = 100
    static let buttonSpacing: CGFloat = 20
    static let titleBotomSpacing: CGFloat = 40
    static let stackViewSpacing: CGFloat = 20
}
