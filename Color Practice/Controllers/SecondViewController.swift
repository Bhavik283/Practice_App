//
//  SecondViewController.swift
//  Color Practice
//
//  Created by Bhavik Goyal on 07/12/23.
//

import UIKit

class SecondViewController: UIViewController {

    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? .systemBackground
        title = color?.hexString ?? "Color Nil"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.tintColor = .white
    }
}

