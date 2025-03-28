//
//  CardViewController.swift
//  Color Practice
//
//  Created by Bhavik Goyal on 11/12/23.
//

import UIKit

class CardViewController: UIViewController {

    private let CardImageView   = UIImageView()
    private let stopButton      = CardButton(backgroundColor: .systemRed, label: "Stop!")
    private let resetButton     = CardButton(backgroundColor: .systemBlue, label: "Restart")
    private let rulesButton     = CardButton(backgroundColor: .systemGreen, label: "Rules")
    
    private var cards: [UIImage] = CardDeck.cards
    private var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Random Card Picker"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .systemCyan
        configureCardImageView()
        configureButtons()
        startTimer()
    }
    
    private func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
}

extension CardViewController{
    @objc private func showRandomCard(){
        CardImageView.image = cards.randomElement()
    }
    
    @objc private func presentRules(){
        present(CardRulesViewController(), animated: true)
    }
    
    @objc private func stopTimer(){
        timer.invalidate()
    }
    
    @objc private func resetTimer(){
        stopTimer()
        startTimer()
    }
}

extension CardViewController {
    private func configureCardImageView(){
        view.addSubview(CardImageView)
        CardImageView.translatesAutoresizingMaskIntoConstraints = false
        CardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            CardImageView.widthAnchor.constraint(equalToConstant: 250),
            CardImageView.heightAnchor.constraint(equalToConstant: 350),
            CardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            CardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75)
        ])
        
    }
    
    private func configureButtons(){
        view.addSubview(stopButton)
        view.addSubview(resetButton)
        view.addSubview(rulesButton)
        
        rulesButton.addTarget(self, action: #selector(presentRules), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        let stopConstraints = [
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: CardImageView.bottomAnchor, constant: 30)
        ]
        let ruleConstraints = [
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor)
        ]
        let resetConstraints = [
            resetButton.widthAnchor.constraint(equalToConstant: 115),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
            resetButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor)
        ]
        
        NSLayoutConstraint.activate(stopConstraints)
        NSLayoutConstraint.activate(resetConstraints)
        NSLayoutConstraint.activate(ruleConstraints)
    }
}
