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
    static let countOfCells = 3
    var gameView: BigGameView = BigGameView()
    static var isFirstPlayer = true
    static var  bigGameViews:[[BigGameView]] = [[BigGameView(), BigGameView(), BigGameView()], [BigGameView(), BigGameView(), BigGameView()], [BigGameView(), BigGameView(), BigGameView()]]
    var displayWidth: CGFloat = 0.0
    var bigCellSize: CGFloat = 0.0
    let countOfCells = 3
    static var DOTS_TO_WIN = 3
    static var DOT_EMPTY: Character = "•"
    static var DOT_X: Character = "X"
    static var DOT_O: Character = "O"
    static var SIZE = 3
    
    
    
    @IBAction func restartButtom(_ sender: Any) {
        self.viewDidLoad()
    
    }
    
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        initMainView()
        initBigViews()
        ViewController.isFirstPlayer = true
       

    }
    
    func initMainView(){
        displayWidth = self.view.frame.width
        bigCellSize = displayWidth / 3
        gameView = BigGameView(frame: CGRect (x: 0, y: (self.view.frame.height - displayWidth) / 2, width: displayWidth, height: displayWidth))
        self.view.addSubview(gameView)
        gameView.selfSize = displayWidth
    }

    func initBigViews(){
        
        for i in 0..<countOfCells {
            for j in 0..<countOfCells{
                print(i, " ", j)
                ViewController.bigGameViews[j][i] = BigGameView(frame: CGRect(x: bigCellSize * CGFloat(i), y: bigCellSize * CGFloat(j), width: bigCellSize, height: bigCellSize))
                ViewController.bigGameViews[j][i].backgroundColor = UIColor.systemBackground
                ViewController.bigGameViews[j][i].selfSize = displayWidth / 3
                ViewController.bigGameViews[j][i].layer.borderWidth = 2
                ViewController.bigGameViews[j][i].layer.borderColor = UIColor.label.cgColor
                ViewController.bigGameViews[j][i].customInit(line: i, column: j)
                gameView.addSubview(ViewController.bigGameViews[j][i])
            }
        }
    }
    
    static func playerTurn(line: Int, column: Int, bigCellcoordinates: (Int, Int)){
        if (ViewController.bigGameViews[bigCellcoordinates.1][bigCellcoordinates.0].isAvailability()) {
            if (ViewController.bigGameViews[bigCellcoordinates.1][bigCellcoordinates.0].smallViews[column][line].isCellEpty) {
                ViewController.bigGameViews[bigCellcoordinates.1][bigCellcoordinates.0].smallViews[column][line].playerTurn(isFirstPlayer: isFirstPlayer)
                isFirstPlayer = !isFirstPlayer
                ViewController.bigGameViews[bigCellcoordinates.1][bigCellcoordinates.0].checkWin()
                if (ViewController.bigGameViews[column][line].isMapFull()){
                    for i in 0..<3 {
                        for j in 0..<3 {
                            ViewController.bigGameViews[j][i].isАvailable = true
                        }
                    }
                } else {
                    for i in 0..<3 {
                        for j in 0..<3 {
                            ViewController.bigGameViews[j][i].isАvailable = false
                            if i == line && j == column {
                                ViewController.bigGameViews[j][i].isАvailable = true
                                
                            }
                        }
                    }
                }
                setBackground()
            }
        }
    }
    
    static func setBackground() {
        for i in 0..<3 {
            for j in 0..<3 {
                if (ViewController.bigGameViews[j][i].isAvailability()) {
                    ViewController.bigGameViews[j][i].backgroundColor = UIColor.systemBackground
                }
                else {
                    ViewController.bigGameViews[j][i].backgroundColor = UIColor.gray
                }
            }
        }
    }
    
    static func checkLine( x0: Int, y0: Int, vx: Int, vy: Int, symb: Character) -> Bool {
        if (x0 + DOTS_TO_WIN * vx > SIZE || y0 + DOTS_TO_WIN * vy > SIZE || y0 + DOTS_TO_WIN * vy < -1) {
            return false }
        for i in 0..<DOTS_TO_WIN {
            if (bigGameViews[y0 + i * vy][x0 + i * vx].playerChar != symb) {
                return false
            }
        }
        
        return true
    }
    
    static func checkCharToWin (symb: Character) -> Bool {
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
    
     
    
    static func checkWin() {
        if (checkCharToWin(symb: DOT_O)){
            
        }
        if (checkCharToWin(symb: DOT_X)){
            
        }
    }
    
}

