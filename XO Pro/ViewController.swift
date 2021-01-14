//
//  ViewController.swift
//  XO Pro
//
//  Created by Admin on 08.01.2021.
//
//  ViewController.swift
//  XO Pro
//
//  Created by Admin on 08.01.2021.
//

import UIKit

class ViewController: UIViewController {

    var gameView: BigGameView = BigGameView()
    
    var bigGameViews:[[BigGameView]] = [[BigGameView(), BigGameView(), BigGameView()], [BigGameView(), BigGameView(), BigGameView()], [BigGameView(), BigGameView(), BigGameView()]]
    var displayWidth: CGFloat = 0.0
    var bigCellSize: CGFloat = 0.0
    let countOfCells = 3
    override func viewDidLoad() {
        super.viewDidLoad()
    
        initMainView()
        
        initBigViews()
        
    }
    let view2 = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    func initMainView(){
        displayWidth = self.view.frame.width
        bigCellSize = displayWidth / 3
        gameView = BigGameView(frame: CGRect (x: 0, y: (self.view.frame.height - displayWidth) / 2, width: displayWidth, height: displayWidth))
        self.view.addSubview(gameView)
        gameView.selfSize = displayWidth
        gameView.backgroundColor = .random()
    }

    func initBigViews(){
        for i in 0..<countOfCells {
            for j in 0..<countOfCells{
                print(i, " ", j)
                bigGameViews[j][i] = BigGameView(frame: CGRect(x: bigCellSize * CGFloat(i), y: bigCellSize * CGFloat(j), width: bigCellSize, height: bigCellSize))
                bigGameViews[j][i].backgroundColor = UIColor.systemBackground
                bigGameViews[j][i].selfSize = displayWidth / 3
                bigGameViews[j][i].layer.borderWidth = 2
                bigGameViews[j][i].layer.borderColor = UIColor.label.cgColor
                bigGameViews[j][i].customInit()
                //bigGameViews[j][i].setNeedsDisplay()
                gameView.addSubview(bigGameViews[j][i])
                
            }
        }
    }
    
   
}
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
