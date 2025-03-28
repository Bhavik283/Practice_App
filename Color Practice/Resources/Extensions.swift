//
//  Extensions.swift
//  Color Practice
//
//  Created by Bhavik Goyal on 07/12/23.
//

import UIKit

extension UIColor {

    var hexString: String {
        guard let components = cgColor.components, components.count >= 3 else {
            return "FFFFFF"
        }

        let red = Int(components[0] * 255.0)
        let green = Int(components[1] * 255.0)
        let blue = Int(components[2] * 255.0)

        return String(format: "%02X%02X%02X", red, green, blue)
    }
}

extension String{
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
