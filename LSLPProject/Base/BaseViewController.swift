//
//  BaseViewController.swift
//  LSLPProject
//
//  Created by Jae Oh on 11/27/23.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
        setConstraints()
        
    }
    
    
    func configure() { }
    func setConstraints() { }
    
    
    
    
}
