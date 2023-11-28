//
//  SignUPViewController.swift
//  LSLPProject
//
//  Created by Jae Oh on 11/27/23.
//

import UIKit
import SnapKit

class SignUPViewController: BaseViewController {
    
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    let nicknameTextField = UITextField()
    
    let signUPButton = UIButton()
    
    override func configure() {
        super.configure()
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(nicknameTextField)
        view.addSubview(signUPButton)
    
        emailTextField.backgroundColor = .yellow
        passwordTextField.backgroundColor = .blue
        nicknameTextField.backgroundColor = .brown
        signUPButton.backgroundColor = .cyan
        
        signUPButton.addTarget(self, action: #selector(signUPButtonTapped), for: .touchUpInside)
        emailTextField.addTarget(self, action: #selector(validationTextFeild), for: .editingDidEnd)
    }
    
    @objc
    func validationTextFeild() {
        
        Network.shared.requestConvertible(type: ValdationEmail.self, api: .validationEmail(email: emailTextField.text ?? "")) { response in
            switch response {
            case .success(let data):
                print("@@@@@@", data)
                print("=========", response.publisher.result)
            case .failure(_):
                print("배드")
            }
        }
    }
    
    @objc
    func signUPButtonTapped() {
        Network.shared.requestConvertible(type: SignUP.self, api: .join(email: emailTextField.text!, password: passwordTextField.text!, nick: nicknameTextField.text!)) { response in
            
            print("=====", response)
    
            print("@@@@@@@@@@@2", Network.shared.self)
            switch response {
            case .success(let success):
                print(success, "작동완료")
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
    }
    
    override func setConstraints() {
        super.setConstraints()
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
            make.center.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }
        
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50)
        }

        signUPButton.snp.makeConstraints { make in
            make.size.equalTo(100)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset( 40)
            make.centerX.equalToSuperview()
        }
    }
    
}
