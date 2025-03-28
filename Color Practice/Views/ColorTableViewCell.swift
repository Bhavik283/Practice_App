//
//  ColorTableViewCell.swift
//  Color Practice
//
//  Created by Bhavik Goyal on 07/12/23.
//

import UIKit


class ColorTableViewCell: UITableViewCell {

    static let identifier = "ColorTableViewCell"
   
    private let colorTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let colorImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .systemGray5
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(colorTextLabel)
        contentView.addSubview(colorImageView)
        applyConstraints()
    }

    required init?(coder: NSCoder){
        fatalError()
    }
    
    public func configure(with label: String, colour: UIColor, image: String){
        colorTextLabel.text = "#" + label
        contentView.backgroundColor = colour
        colorImageView.image = UIImage(systemName: image)
    }
    
    private func applyConstraints() {
        let labelConstraints = [
            colorTextLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            colorTextLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ]
        let imageConstraints = [
            colorImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            colorImageView.leadingAnchor.constraint(equalTo: colorTextLabel.trailingAnchor, constant: 16),
            colorImageView.widthAnchor.constraint(equalToConstant: 50),
            colorImageView.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(labelConstraints)
        NSLayoutConstraint.activate(imageConstraints)
    }
}
