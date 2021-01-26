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
    var coordinates: (Int, Int) = (0, 0)
    var isАvailable = true
    var image: UIImageView? = nil
    var DOTS_TO_WIN = 3
    var DOT_EMPTY: Character = "•"
    var DOT_X: Character = "X"
    var DOT_O: Character = "O"
    var SIZE = 3
    var playerChar: Character = "•"
    
    func  isAvailability() -> Bool {
        if ((!isMapFull()) && (isАvailable)){
            return true
        }
        return false
    }
    
    func customInit(line: Int, column: Int) {
        coordinates = (line, column)
        image = UIImageView(frame: self.bounds)
        self.addSubview(image!)
        CellSize = selfSize / 3
        for i in 0..<countOfCells {
            for j in 0..<countOfCells{
                smallViews[j][i] = SmallGameView(frame: CGRect(x: CellSize * CGFloat(i), y: CellSize * CGFloat(j), width: CellSize, height: CellSize))
                smallViews[j][i].configurate(line: i, column: j, bigCellcoordinates: coordinates)
                self.addSubview(smallViews[j][i])
                
            }
        }
    }
    
    func isMapFull() -> Bool {
        if (playerChar != DOT_EMPTY) {
            return true
        }
        for i in 0..<countOfCells {
            for j in 0..<countOfCells{
                if smallViews[j][i].playerChar == DOT_EMPTY {
                    return false
                }
            }
        }
        
        return true
    }
    
    func checkLine( x0: Int, y0: Int, vx: Int, vy: Int, symb: Character) -> Bool {
        if (x0 + DOTS_TO_WIN * vx > SIZE || y0 + DOTS_TO_WIN * vy > SIZE || y0 + DOTS_TO_WIN * vy < -1) {
            return false }
        for i in 0..<DOTS_TO_WIN {
            if (smallViews[y0 + i * vy][x0 + i * vx].playerChar != symb) {
                return false
            }
        }
        
        return true
    }
    
    func checkCharToWin (symb: Character) -> Bool {
        for i in 0..<countOfCells {
            for j in 0..<countOfCells{
                if (checkLine(x0: i, y0: j, vx: 1, vy: 0, symb: symb)) {return true}
                if (checkLine(x0: i, y0: j, vx: 0, vy: 1, symb: symb)) {return true}
                if (checkLine(x0: i, y0: j, vx: 1, vy: 1, symb: symb)) {return true}
                if (checkLine(x0: i, y0: j, vx: 1, vy: -1, symb: symb)) {return true}
            }
        }
        return false
    }
    
    func checkWin() {
        if (checkCharToWin(symb: DOT_O)){
            playerChar = "O"
            image?.image = UIImage(named: "icon0")
            clearSmallIcons()
        }
        if (checkCharToWin(symb: DOT_X)){
            playerChar = "X"
            image?.image = UIImage(named: "iconX")
            clearSmallIcons()
        }
    }
    
    func clearSmallIcons() {
        for i in 0..<countOfCells {
            for j in 0..<countOfCells{
                smallViews[j][i].image?.alpha = 0
                smallViews[j][i].layer.borderWidth = 0
                
            }
        }
    }
    
}

