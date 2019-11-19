//
//  SettingsViewController.swift
//
//  Created by Di Gain on 02/11/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITextFieldDelegate {
    
    weak var delegate: TextFieldDataDelegate?
  
    private let spacing: CGFloat = 25.0
    
    private let label1 = UILabel.makeLabel(text: "Name:")
    private let label2 = UILabel.makeLabel(text: "Goal:")
    
    private let textField1 = UITextField.makeTextField(placeholder: "Enter your name", padding: .both(15))
    private let textField2 = UITextField.makeTextField(placeholder: "Number", padding: .both(15))
    
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label1, label2])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = spacing
        return stackView
      }()
    
    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textField1, textField2])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = spacing
        return stackView
    }()
    
    private lazy var settingsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelStackView, textFieldStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = spacing
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .yellow
        textField1.delegate = self
        textField2.delegate = self
        setupLayout()
        
        //Keyboard
        closeKeyboardOnTap()
        textFieldShouldReturn(textField1)
        textFieldShouldReturn(textField2)
        textField2.keyboardType = .numberPad
        addDoneButton()
    }
    
    private func setupLayout() {
        
        view.addSubview(settingsStackView)
        
        NSLayoutConstraint.activate([
            settingsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: spacing),
            settingsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -spacing),
          settingsStackView.topAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
        ])
    }
    
    //Keyboard settings
    
     @discardableResult
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
                 self.view.endEditing(true)
                       }
     
     private func closeKeyboardOnTap() {
                 let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
                 view.addGestureRecognizer(tap)
     }
    
    func addDoneButton() {
        let toolbar = UIToolbar()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonAction))
        toolbar.setItems([flexSpace, doneButton], animated: false)
        toolbar.sizeToFit()
        
        textField2.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonAction() {
        self.view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
         
        guard textField.text != "", textField == textField1 else { return }
        self.delegate?.saveTextFieldToName(textField1.text!)
    }
}
    

