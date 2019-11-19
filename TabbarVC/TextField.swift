//
//  TextField.swift
//
//  Created by Di Gain on 12/11/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

extension UITextField {
    
    enum PaddingSide {
          case left(CGFloat)
          case right(CGFloat)
          case both(CGFloat)
    }
    
    static func makeTextField(placeholder: String, padding: PaddingSide) -> UITextField {
           
        let myTextFiled = UITextField()
        myTextFiled.translatesAutoresizingMaskIntoConstraints = false
        myTextFiled.layer.borderWidth = 2
        myTextFiled.layer.borderColor = UIColor.gray.cgColor
        myTextFiled.layer.cornerRadius = 5
        myTextFiled.backgroundColor = .white
        myTextFiled.textColor = .black
        myTextFiled.font = UIFont(name: "Helvetica", size: 26)
        myTextFiled.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
            .font: UIFont.boldSystemFont(ofSize: 10),
            .foregroundColor: UIColor.red
            
        ])
        
        
        //Text positioning
        switch padding {

        case .left(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: myTextFiled.frame.height))
            myTextFiled.leftView = paddingView
            myTextFiled.rightViewMode = .always

        case .right(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: myTextFiled.frame.height))
            myTextFiled.rightView = paddingView
            myTextFiled.rightViewMode = .always

        case .both(let spacing):
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: spacing, height: myTextFiled.frame.height))
            // left
            myTextFiled.leftView = paddingView
            myTextFiled.leftViewMode = .always
            // right
            myTextFiled.rightView = paddingView
            myTextFiled.rightViewMode = .always
        }
        return myTextFiled
        }
 
}



