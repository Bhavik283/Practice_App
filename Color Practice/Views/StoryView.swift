//
//  StoryView.swift
//  Color Practice
//
//  Created by Bhavik Goyal on 07/12/23.
//

import UIKit

class StoryView: UIView {

    weak var settingsDelegate: SettingsDelegate?
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let imageLabel: UILabel = {
        let label = UILabel()
        label.text = "Image: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        // Selector for button size
    private let imageSelector: UISegmentedControl = {
        let images = ["house", "person", "magnifyingglass"]
        let selector = UISegmentedControl(items: images)
        selector.selectedSegmentIndex = 1
        selector.translatesAutoresizingMaskIntoConstraints = false
        selector.addTarget(self, action: #selector(selectorValueChange), for: .valueChanged)
        return selector
    }()

    private let disableLabel: UILabel = {
        let label = UILabel()
        label.text = "Disable: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        // Toggle button for disable state
    private let disableToggle: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = false
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.addTarget(self, action: #selector(toggleValueChanged), for: .valueChanged)
        return toggle
    }()

    private let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Title: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        // Input text field for button title
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Button Title"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        return textField
    }()
    
    private let radiusLabel: UILabel = {
        let label = UILabel()
        label.text = "border-radius: "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let cornerRadiusSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 25
        slider.value = 0
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemMint
        setupStackView()
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }

}

extension StoryView{
    
    private func createHorizontalStack(label: UILabel, component: UIView) -> UIStackView {
        let horizontalStack = UIStackView(arrangedSubviews: [label, component])
        horizontalStack.axis = .horizontal
        horizontalStack.spacing = 10
        horizontalStack.alignment = .center
        return horizontalStack
    }
    
    private func setupStackView() {
        let imageStack = createHorizontalStack(label: imageLabel, component: imageSelector)
        let disableStack = createHorizontalStack(label: disableLabel, component: disableToggle)
        let textStack = createHorizontalStack(label: textLabel, component: titleTextField)
        let radiusStack = createHorizontalStack(label: radiusLabel, component: cornerRadiusSlider)
        
        stackView.addArrangedSubview(imageStack)
        stackView.addArrangedSubview(disableStack)
        stackView.addArrangedSubview(textStack)
        stackView.addArrangedSubview(radiusStack)
        
        addSubview(stackView)
    }
}

extension StoryView{
    private func applyConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}

extension StoryView{
    @objc private func selectorValueChange(){
        updateButton()
    }
    @objc private func sliderValueChanged(){
        updateButton()
    }
    @objc private func textFieldEditingChanged(){
        updateButton()
    }
    @objc private func toggleValueChanged(){
        updateButton()
    }
    private func updateButton() {
        let selectedImage = imageSelector.titleForSegment(at: imageSelector.selectedSegmentIndex) ?? "play.rectangle"
        let isDisabled = disableToggle.isOn
        let buttonTitle = titleTextField.text ?? ""
        let cornerRadius = CGFloat(cornerRadiusSlider.value)
        
        settingsDelegate?.didApplySettings(image: selectedImage, isDisabled: isDisabled, title: buttonTitle, cornerRadius: cornerRadius)
    }
}


//        addSubview(imageLabel)
//        addSubview(imageSelector)
//        addSubview(disableLabel)
//        addSubview(disableToggle)
//        addSubview(textLabel)
//        addSubview(titleTextField)
//        addSubview(radiusLabel)
//        addSubview(cornerRadiusSlider)



//        let imageLabelConstraints = [
//            imageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            imageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
//        ]
//        let disableLabelConstraints = [
//            disableLabel.topAnchor.constraint(equalTo: imageLabel.bottomAnchor, constant: 40),
//            disableLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
//        ]
//        let textLabelConstraints = [
//            textLabel.topAnchor.constraint(equalTo: disableLabel.bottomAnchor, constant: 40),
//            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
//        ]
//        let radiusLabelConstraints = [
//            radiusLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 40),
//            radiusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
//        ]
//        let imageSelectorConstraints = [
//            imageSelector.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            imageSelector.leadingAnchor.constraint(equalTo: imageLabel.trailingAnchor, constant: 5),
//            imageSelector.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5)
//        ]
//        let disabletoggleConstraints = [
//            disableToggle.topAnchor.constraint(equalTo: disableLabel.topAnchor),
//            disableToggle.leadingAnchor.constraint(equalTo: disableLabel.trailingAnchor, constant: 10),
//            disableToggle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -150)
//        ]
//        let textFieldConstraints = [
//            titleTextField.topAnchor.constraint(equalTo: textLabel.topAnchor),
//            titleTextField.leadingAnchor.constraint(equalTo: textLabel.trailingAnchor, constant: 10),
//            titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)
//        ]
//        let radiusSliderConstraints = [
//            cornerRadiusSlider.topAnchor.constraint(equalTo: radiusLabel.topAnchor),
//            cornerRadiusSlider.leadingAnchor.constraint(equalTo: radiusLabel.trailingAnchor, constant: 10),
//            cornerRadiusSlider.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
//        ]
//        NSLayoutConstraint.activate(imageLabelConstraints)
//        NSLayoutConstraint.activate(imageSelectorConstraints)
//        NSLayoutConstraint.activate(disableLabelConstraints)
//        NSLayoutConstraint.activate(disabletoggleConstraints)
//        NSLayoutConstraint.activate(textLabelConstraints)
//        NSLayoutConstraint.activate(textFieldConstraints)
//        NSLayoutConstraint.activate(radiusLabelConstraints)
//        NSLayoutConstraint.activate(radiusSliderConstraints)
