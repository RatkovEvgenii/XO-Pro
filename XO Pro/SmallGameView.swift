//
//  SmallGameView.swift
//  XO Pro
//
//  Created by Admin on 14.01.2021.
//

import UIKit

class SmallGameView: UIView {
    var image: UIImageView? = nil
    func configurate() {
        image = UIImageView(frame: self.bounds)
        self.addSubview(image!)
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.onTap))
        self.addGestureRecognizer(gesture)
        self.backgroundColor = UIColor(named: "Default")
    }
    @objc func onTap(){
        image?.image = UIImage(named: "iconX")
    }
}
