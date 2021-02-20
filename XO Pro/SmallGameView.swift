//
//  SmallGameView.swift
//  XO Pro
//
//  Created by Admin on 14.01.2021.
//

import UIKit


class SmallGameView: UIView {
    var image: UIImageView? = nil
    var column = 0
    var line = 0
    var isCellEpty = true
    var playerChar: Character = "•"
    var bigCellcoordinates: (Int, Int) = (0, 0)
    var selfSize: CGFloat = 0
    
    func configurate(line: Int, column: Int, bigCellcoordinates: (Int, Int)) {
        self.selfSize = self.frame.height
        self.bigCellcoordinates = bigCellcoordinates
        self.line = line
        self.column = column
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.label.cgColor
        image = UIImageView(frame: CGRect(x: 2, y: 2, width: selfSize - 4, height: selfSize - 4))
        self.addSubview(image!)
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.onTap))
        self.addGestureRecognizer(gesture)
        self.backgroundColor = UIColor(named: "Default")
        
    }
    @objc func onTap(){
        //image?.image = UIImage(named: "iconX")
        ViewController.playerTurn(line: line, column: column, bigCellcoordinates: bigCellcoordinates)
    
    }
    
    func playerTurn(isFirstPlayer: Bool){
        if isFirstPlayer {
            playerChar = "X"
            image?.image = UIImage(named: "iconX")
            } else {
                playerChar = "O"
                image?.image = UIImage(named: "icon0")
            }
        isCellEpty = false
        //backgroundColor = UIColor.gray
    }
}
