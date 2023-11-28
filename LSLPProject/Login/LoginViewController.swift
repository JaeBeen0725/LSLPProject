//
//  LoginViewController.swift
//  LSLPProject
//
//  Created by Jae Oh on 11/27/23.
//

import UIKit

class LoginViewController: BaseViewController {
    
    let signUpButton = {
        let button = UIButton()
        
        return button
    }()
    
    
    override func configure() {
        super.configure()
        view.addSubview(signUpButton)
        signUpButton.backgroundColor = .green
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    @objc
    func signUpButtonTapped() {
        
        let sb = SignUPViewController()
        
        navigationController?.pushViewController(sb, animated: true)
    }
    
    override func setConstraints() {
        super.setConstraints()
        signUpButton.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.center.equalToSuperview()
        }
    }
    
}
