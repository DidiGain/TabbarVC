//
//  HomeViewController.swift
//
//  Created by Di Gain on 02/11/2019.
//  Copyright © 2019 Didi Gain. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController, TextFieldDataDelegate {
    
    let settingVC = SettingsViewController()
    
    private let nameLabel = UILabel.makeLabel(text: "", size: 25, textColor: .lightGray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupLayout()
        settingVC.delegate = self
        nameLabel.backgroundColor = .white
    }
    
    func saveTextFieldToName(_ text: String) {
        self.nameLabel.text = text
    }
    
    private func setupLayout() {
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
        ])
    }
}
