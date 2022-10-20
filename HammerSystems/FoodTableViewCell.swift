//
//  FoodTableViewCell.swift
//  HammerSystems
//
//  Created by Al Stark on 20.10.2022.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "FoodTableViewCell"

    var titleLabel = UILabel()
    var descriptLabel = UILabel()
    var photo = UIImageView()
    var priceLabel = UILabel()
    
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.selectionStyle = .none
            setupView()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        photo.setWidth(to: 132)
        photo.setHeight(to: 132)
        photo.contentMode = .scaleAspectFit
        photo.clipsToBounds = true
        contentView.addSubview(photo)
        photo.pin(to: contentView, [.left: 16, .top: 24, .right: 227, .bottom: 24])
        
        titleLabel.text = "title"
        titleLabel.font = .systemFont(ofSize: 15.0,
                                      weight: .bold)
        titleLabel.textColor = .black
        
        descriptLabel.text = "description"
        descriptLabel.font = .systemFont(ofSize: 12, weight: .medium)
        descriptLabel.numberOfLines = 3
        descriptLabel.textColor = .lightGray
        
        
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptLabel])
        
        stackView.axis = .vertical
        stackView.spacing = 8
        contentView.addSubview(stackView)
        
        stackView.pin(to: contentView, [.left: 180, .top: 32, .right: 24, .bottom: 72])
        
        priceLabel.text = "от 345 р"
        priceLabel.font = .systemFont(ofSize: 12, weight: .medium)
        priceLabel.textColor = .red
        priceLabel.layer.borderColor = .init(red: 255, green: 0, blue: 0, alpha: 1)
        priceLabel.layer.borderWidth = 1.0
        priceLabel.layer.cornerRadius = 5
        priceLabel.backgroundColor = .white
        priceLabel.setHeight(to: 32)
        priceLabel.setWidth(to: 87)
        priceLabel.textAlignment = .center
        contentView.addSubview(priceLabel)
        priceLabel.pinTop(to: stackView.bottomAnchor, 8)
        priceLabel.pinRight(to: contentView, 24)
        priceLabel.pinLeft(to: stackView.leadingAnchor, 120)
        
    }
    
    func configure(food: MenuElement?) {
        titleLabel.text = food?.name ?? "title"
        descriptLabel.text = food?.menuDescription
        loadPhoto(urlString: food?.imageURL ?? "")
        
    }
    
    func loadPhoto(urlString: String) {
        guard let url = URL(string: urlString) else {return}
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.photo.image = image
                    }
                }
            }
        }
    }

}
