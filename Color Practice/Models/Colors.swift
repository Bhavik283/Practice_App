//
//  colors.swift
//  Color Practice
//
//  Created by Bhavik Goyal on 07/12/23.
//

import UIKit



struct colorVal{
    var colors: [UIColor]
    
    init(count: Int){
        colors = []
        addRandomColors(count: count)
    }
    
    mutating func addRandomColors(count: Int){
        for _ in 0..<count{
            colors.append(createRandomColor())
        }
    }
    
    func createRandomColor() -> UIColor{
        let randomColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        return randomColor
    }
}



