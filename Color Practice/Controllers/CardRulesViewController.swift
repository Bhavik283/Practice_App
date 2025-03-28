//
//  CardRulesViewController.swift
//  Color Practice
//
//  Created by Bhavik Goyal on 11/12/23.
//

import UIKit

class CardRulesViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Rules"
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let rulesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The value of each card represents the exercise you do.\n\n J = 11, Q = 12, K = 14, A = 14"
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
    }()
    
    private let exerciseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = """
        ♠️ = Push-ups
        
        ♥️ = Sit-ups
        
        ♣️ = Burpees
        
        ♦️ = Jumping Jacks
        """
        label.font = .systemFont(ofSize: 19, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(titleLabel)
        view.addSubview(rulesLabel)
        view.addSubview(exerciseLabel)
        applyConstraints()
    }
}

extension CardRulesViewController{
    private func applyConstraints(){
        let titleConstraints = [
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ]
        let rulesConstraints = [
            rulesLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            rulesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            rulesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ]
        let exerciseConstraints = [
            exerciseLabel.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 60),
            exerciseLabel.widthAnchor.constraint(equalToConstant: 200),
            exerciseLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint.activate(titleConstraints)
        NSLayoutConstraint.activate(rulesConstraints)
        NSLayoutConstraint.activate(exerciseConstraints)
    }
}
