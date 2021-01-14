//
//  MainGameView.swift
//  XO Pro
//
//  Created by Admin on 09.01.2021.
//


import UIKit

class BigGameView: UIView {
    let countOfCells = 3
    var smallViews: [[SmallGameView]] = [[SmallGameView(), SmallGameView(), SmallGameView()], [SmallGameView(), SmallGameView(), SmallGameView()], [SmallGameView(), SmallGameView(), SmallGameView()]]
    var selfSize: CGFloat = 0.0
    var CellSize: CGFloat = 0.0
    var isAvailability: Bool = false
    
    
    
    override func draw(_ rect: CGRect) {
//        if isAvailability {
//            self.layer.backgroundColor = UIColor.gray.cgColor
//        }
        var cellSize:CGFloat = selfSize / 3
            super.draw(rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
                context.setFillColor(UIColor.label.cgColor)
//        context.stroke(CGRect(x: cellSize, y: 0, width: cellSize, height: selfSize))
//        context.stroke(CGRect(x: 0, y: cellSize, width: selfSize, height: cellSize))
        //self.backgroundColor = .green
    }
    func customInit() {
        CellSize = selfSize / 3
        for i in 0..<countOfCells {
            for j in 0..<countOfCells{
                print(i, " ", j)
                smallViews[j][i] = SmallGameView(frame: CGRect(x: CellSize * CGFloat(i), y: CellSize * CGFloat(j), width: CellSize, height: CellSize))
                //smallViews[j][i].backgroundColor = .random2()
                //smallViews[j][i].selfSize = displayWidth / 3
                smallViews[j][i].layer.borderWidth = 1
                smallViews[j][i].configurate()
                smallViews[j][i].layer.borderColor = UIColor.label.cgColor
                self.addSubview(smallViews[j][i])
                //initSmallViews(bigView: BigGameViews[j][i])
            }
        }
    }
    
    
    
}
extension CGFloat {
    static func random2() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random2() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
