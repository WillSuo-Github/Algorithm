//
//  ViewController.swift
//  Algorithm
//
//  Created by great Lock on 2018/11/14.
//  Copyright © 2018 great Lock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        button.backgroundColor = .red
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(runTest), for: .touchUpInside)
    }
    
    
    @objc private func runTest() {
        QuickSortTest()
    }
}

