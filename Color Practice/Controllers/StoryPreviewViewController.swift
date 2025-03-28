//
//  StoryPreviewViewController.swift
//  Color Practice
//
//  Created by Bhavik Goyal on 08/12/23.
//

import UIKit

protocol SettingsDelegate: AnyObject {
    func didApplySettings(image: String, isDisabled: Bool, title: String, cornerRadius: CGFloat)
    func didApplyColor(backgroundColor: UIColor)
}

class StoryPreviewViewController: UIViewController {

    private lazy var storyControlView: StoryView = {
        let vc = StoryView()
        vc.translatesAutoresizingMaskIntoConstraints = false
        vc.settingsDelegate = self
        return vc
    }()
    
    private let applyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Apply", for: .normal)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .black
        button.addTarget(self, action: #selector(popup), for: .touchUpInside)
        return button
    }()
    
    private let colorView: UIButton = {
        let button = UIButton()
        button.setTitle("Pick Color", for: .normal)
        button.backgroundColor = .systemCyan
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didSelectColor), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Story - Button"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .systemGray3
        view.addSubview(applyButton)
        view.addSubview(storyControlView)
        view.addSubview(colorView)
        applyConstraints()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
}

extension StoryPreviewViewController{
    @objc private func didSelectColor(){
        let colorPicker = UIColorPickerViewController()
        colorPicker.title = "Background Color"
        colorPicker.supportsAlpha = false
        colorPicker.delegate = self
        colorPicker.modalPresentationStyle = .popover
        colorPicker.popoverPresentationController?.sourceItem = self.navigationItem.rightBarButtonItem
        self.present(colorPicker, animated: true)
    }
    
    @objc private func popup(){
        let alertController = UIAlertController(title: "Button Pressed", message: "You pressed the button!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
}

extension StoryPreviewViewController{
    private func applyConstraints(){
        let buttonConstraints = [
            applyButton.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            applyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            applyButton.widthAnchor.constraint(equalToConstant: 150),
            applyButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        let viewConstraints = [
            storyControlView.topAnchor.constraint(equalTo: applyButton.bottomAnchor, constant: 80),
            storyControlView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            storyControlView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            storyControlView.heightAnchor.constraint(equalToConstant: 250)
        ]
        let colorConstraints = [
            colorView.topAnchor.constraint(equalTo: storyControlView.bottomAnchor, constant: 10),
            colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorView.widthAnchor.constraint(equalToConstant: 100),
            colorView.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(buttonConstraints)
        NSLayoutConstraint.activate(viewConstraints)
        NSLayoutConstraint.activate(colorConstraints)
    }
}

extension StoryPreviewViewController: SettingsDelegate {
    func didApplySettings(image: String, isDisabled: Bool, title: String, cornerRadius: CGFloat) {
        applyButton.setTitle(title, for: .normal)
        applyButton.isEnabled = !isDisabled
        applyButton.layer.cornerRadius = cornerRadius
        applyButton.setImage(UIImage(systemName: image), for: .normal)
    }
    func didApplyColor(backgroundColor: UIColor) {
        applyButton.backgroundColor = backgroundColor
    }
}

extension StoryPreviewViewController: UIColorPickerViewControllerDelegate{
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        didApplyColor(backgroundColor: color)
    }
}
