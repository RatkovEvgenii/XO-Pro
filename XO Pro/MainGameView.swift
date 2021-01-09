//
//  MainGameView.swift
//  XO Pro
//
//  Created by Admin on 09.01.2021.
//


import UIKit

class MainGameView: UIView {

    var selfSize: CGFloat = 0.0
    override func draw(_ rect: CGRect) {
        var cellSize:CGFloat = selfSize / 3
            super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
                context.setFillColor(UIColor.label.cgColor)
        context.stroke(CGRect(x: cellSize, y: 0, width: cellSize, height: selfSize))
        context.stroke(CGRect(x: 0, y: cellSize, width: selfSize, height: cellSize))
        
    }
    
    
    
}
