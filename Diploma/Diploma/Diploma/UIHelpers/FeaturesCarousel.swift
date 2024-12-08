//
//  FeaturesCarusel.swift
//  Diploma
//
//  Created by Oleg Podrez on 8.12.24.
//

import UIKit
protocol FeaturesCarouselDelegate: AnyObject {
    func featuresCarousel(_ carousel: FeaturesCarousel, didSelectFeatureAt index: Int)
}

class FeaturesCarousel: UIView {
    
    private let scrollView = UIScrollView()
    private let stackView = UIStackView()
    
    weak var delegate: FeaturesCarouselDelegate?
    
    override required init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
        setupStackView()
        addFeatures()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupScrollView() {
        scrollView.contentOffset = .zero
        scrollView.isPagingEnabled = true
        scrollView.clipsToBounds = false
     
        
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setupStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.spacing = 1
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
       
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            stackView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
        
    }
    private func addFeatures() {
        let features = [
            (text: "Список Продуктов", imageName: "ScrollViewBackground1"),
            (text: "Подсчет ЖБУ", imageName: "ScrollViewBackground2"),
            (text: "Прогресс", imageName: "ScrollViewBackground3"),
            (text: "Ежедневные отчеты", imageName: "ScrollViewBackground4")
        ]
        
        for (index, feature) in features.enumerated() {
            let featureView = createFeatureLabel(
                text: feature.text,
                imageName: feature.imageName)
            featureView.tag = index
            
            let tapGesture = UITapGestureRecognizer(target: self,
                                                     action: #selector(featuresTapped(_:)))
            featureView.addGestureRecognizer(tapGesture)
            
            featureView.isUserInteractionEnabled = true
            
            
            stackView.addArrangedSubview(featureView)
            featureView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
            
        }
    }
    private func createFeatureLabel(text: String, imageName: String) -> UIView {
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .clear
        
        let imageView = UIImageView(image: UIImage(named: imageName))
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = LayoutConstants.imageCornerRadius
        imageView.layer.masksToBounds = true
      
        imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 0.3
        imageView.layer.shadowOffset = CGSize(width: 0, height: 5) 
        imageView.layer.shadowRadius = 10
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(imageView)
        containerView.addSubview(label)
        
        NSLayoutConstraint.activate(
            [
                // Изображение
                imageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                imageView.widthAnchor.constraint(equalToConstant: LayoutConstants.widthScrolView),
                imageView.heightAnchor.constraint(equalToConstant: LayoutConstants.heightScrolView),
                
                // Текст
                label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
                label.leadingAnchor
                    .constraint(
                        equalTo: containerView.leadingAnchor,
                        constant: LayoutConstants.leadingLayoutConstant
                    ),
                label.trailingAnchor
                    .constraint(
                        equalTo: containerView.trailingAnchor,
                        constant: LayoutConstants.trailingLayoutConstant
                    )
            ]
        )
        
        return containerView
        
    }
    
    @objc private func featuresTapped(_ sender: UITapGestureRecognizer) {
        guard let tappedView = sender.view else { return }
        print("Tapped feature with tag: \(tappedView.tag)") // Проверка
        delegate?.featuresCarousel(self, didSelectFeatureAt: tappedView.tag)
    }
}
