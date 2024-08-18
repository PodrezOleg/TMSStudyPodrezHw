//
//  VideoCell.swift
//  PodrezHw13.1_new
//
//  Created by Oleg Podrez on 14.08.24.
//

import UIKit

class VideoCell: UITableViewCell {
    
    var videoImageView = UIImageView()
    var videoTitleLabel =  UILabel()
    
    var onImageTap: (() -> Void)?
    var onTextTap: (() -> Void)?
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(videoImageView)
        contentView.addSubview(videoTitleLabel)
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
        TapToOpen()
       
    }
    
    
    func TapToOpen() {
        let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        videoImageView.isUserInteractionEnabled = true
        videoImageView.addGestureRecognizer(imageTapGesture)
        
        
        let textTapGesture = UITapGestureRecognizer(target: self, action: #selector(textTapped))
        videoTitleLabel.isUserInteractionEnabled = true
        videoTitleLabel.addGestureRecognizer(textTapGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(video: Video) {
        videoImageView.image = video.image
        videoTitleLabel.text = video.title
    }
    
    @objc func imageTapped(){
        print("Image tapped")
        onImageTap?()
    }
    
    @objc func textTapped() {
        print("Text tapped")
        onTextTap?()
    }
    
    
    func configureImageView() {
        videoImageView.layer.cornerRadius = 10
        videoImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        videoTitleLabel.numberOfLines = 0
        videoTitleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        videoTitleLabel.adjustsFontSizeToFitWidth = false
       }
   
    
    
    func setImageConstraints() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        videoImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        videoImageView.heightAnchor.constraint(equalTo: videoImageView.widthAnchor, multiplier: 3/5).isActive = true
    }

    func setTitleLabelConstraints() {
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        videoTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        videoTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        videoTitleLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20).isActive = true
        videoTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
       
    }
    
}
