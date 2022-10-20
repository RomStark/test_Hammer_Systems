//
//  ActionCollectionViewCell.swift
//  HammerSystems
//
//  Created by Al Stark on 20.10.2022.
//

import UIKit

class ActionCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "ActionCollectionViewCell"
    var photo = UIImageView()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        photo.frame = contentView.bounds
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        photo.image = nil
    }
    func setupView() {
        photo.setWidth(to: 300)
        photo.setHeight(to: 222)
        photo.contentMode = .scaleAspectFit
        photo.clipsToBounds = true
        contentView.addSubview(photo)
        photo.layer.cornerRadius = 100
        photo.pin(to: contentView, [.left: 0, .top: 0, .right: 0, .bottom: 0])
    }
    
    func configure(photo: UIImage) {
        self.photo.image = photo
    }
}
