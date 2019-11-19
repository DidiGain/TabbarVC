//
//  Labels.swift
//
//  Created by Di Gain on 11/11/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit


  extension UILabel {
    static func makeLabel(text: String, size: CGFloat = 26, textColor: UIColor = .black) -> UILabel {
        let myLabel = UILabel()
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        myLabel.textColor = textColor
        myLabel.font = UIFont(name: "Helvetica", size: size)
        myLabel.sizeToFit()
        myLabel.numberOfLines = 0
        myLabel.text = text
        return myLabel
    }
}
