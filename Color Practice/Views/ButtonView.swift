//
//  ButtonView.swift
//  Color Practice
//
//  Created by Bhavik Goyal on 08/12/23.
//

import UIKit

protocol ButtonViewDelegate: AnyObject {
    func didTapStoryButton()
    func didTapRandomButton()
}

class ButtonView: UIView {
    
    weak var delegate: ButtonViewDelegate?
    
    private let storyButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "house", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.setTitle("Story", for: .normal)
        button.backgroundColor = .systemPink
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.tintColor = .darkGray
        return button
    }()
    
    private let randomButton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.circle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))
        button.setImage(image, for: .normal)
        button.setTitle("Random", for: .normal)
        button.backgroundColor = .cyan
        button.setTitleColor(.black, for: .normal)
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 5
        button.tintColor = .darkGray
        return button
    }()
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addGradient()
        addSubview(storyButton)
        addSubview(randomButton)
        applyConstraints()
        storyButton.addTarget(self, action: #selector(storyButtonTapped), for: .touchUpInside)
        randomButton.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc private func storyButtonTapped() {
        delegate?.didTapStoryButton()
    }
    
    @objc private func randomButtonTapped() {
        delegate?.didTapRandomButton()
    }
}

extension ButtonView{
    private func applyConstraints(){
        let storyConstraints = [
            storyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            storyButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            storyButton.widthAnchor.constraint(equalToConstant: 130),
            storyButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        let randomConstraints = [
            randomButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            randomButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            randomButton.widthAnchor.constraint(equalToConstant: 130),
            randomButton.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(storyConstraints)
        NSLayoutConstraint.activate(randomConstraints)
        storyButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        randomButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
}
