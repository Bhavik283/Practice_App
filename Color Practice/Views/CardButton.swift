//
//  CardButton.swift
//  Color Practice
//
//  Created by Bhavik Goyal on 11/12/23.
//

import UIKit

class CardButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in button initialization")
    }
    
    init(backgroundColor: UIColor, label: String){
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(label, for: .normal)
        configure()
    }
    
    func configure(){
        layer.cornerRadius = 8
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        setTitleColor(.white, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
