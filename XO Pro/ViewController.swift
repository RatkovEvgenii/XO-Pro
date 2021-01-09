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

    @IBOutlet weak var gameView: MainGameView!
    var displayWidth: CGFloat = 0.0
    var bigCellSiza: CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        displayWidth = self.view.frame.width
        bigCellSiza = displayWidth / 3
        gameView.frame = CGRect (x: 0, y: (self.view.frame.height - displayWidth) / 2, width: displayWidth, height: displayWidth)
        gameView.selfSize = displayWidth
        
    }


}
