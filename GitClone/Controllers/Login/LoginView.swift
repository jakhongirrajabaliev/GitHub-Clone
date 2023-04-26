//
//  LoginView.swift
//  GitClone
//
//  Created by user1 on 12/04/23.
//

import UIKit

class LoginView: UIView {
    
    // MARK: - UI Elements
    var conteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.09225723892, green: 0.1022897735, blue: 0.1319077313, alpha: 1)
        return view
    }()
    
    var topLogoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    var topLogoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo2")
        view.backgroundColor = .white
        return view
    }()
    
    var bottomLogoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    var bottomLogoImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        
        return view
    }()
    
    var gitLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = " GitHub iOS clone"
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.numberOfLines = 2
        lbl.textAlignment = .center
        
        return lbl
    }()
    var usernameLbl: UILabel = {
        let lbl = UILabel()
        lbl.text = "Username or Email address"
        lbl.textColor = .white
        lbl.font = .systemFont(ofSize: 16)
        return lbl
    }()
    var userNameTf: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.autocorrectionType = UITextAutocorrectionType.no
        tf.keyboardType = UIKeyboardType.default
        tf.returnKeyType = UIReturnKeyType.done
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return tf
    }()
    
    var signButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemGreen
        btn.setTitle("Sign in", for: .normal)
        
        return btn
    }()
    
    let stackImage: UIStackView = {
        let stackImage = UIStackView()
        stackImage.axis = .vertical
        stackImage.spacing = 50
        stackImage.distribution = .fill
        stackImage.alignment = .center
        
        return stackImage
    }()
    
    let userTfNameStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 16
        view.distribution = .fill
        view.alignment = .fill
        
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addView()
        addConstraints()
        addCorners()
    }
    
    // MARK: - Private functions
    private func addView() {
        self.addSubview(conteinerView)
        topLogoView.addSubview(topLogoImage)
        bottomLogoView.addSubview(bottomLogoImage)
        stackImage.addArrangedSubview(topLogoView)
        stackImage.addArrangedSubview(bottomLogoView)
        conteinerView.addSubview(stackImage)
        conteinerView.addSubview(gitLbl)
        userTfNameStack.addArrangedSubview(usernameLbl)
        userTfNameStack.addArrangedSubview(userNameTf)
        conteinerView.addSubview(userTfNameStack)
        conteinerView.addSubview(signButton)
    }

    private func addConstraints() {
        conteinerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        topLogoView.snp.makeConstraints { make in
            make.height.width.equalTo(90)
        }
        
        topLogoImage.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.centerX.equalTo(topLogoView.snp.centerX)
            make.centerY.equalTo(topLogoView.snp.centerY)
        }
        
        bottomLogoView.snp.makeConstraints { make in
            make.width.height.equalTo(160)
        }
        
        bottomLogoImage.snp.makeConstraints { make in
            make.height.width.equalTo(conteinerView.frame.width / 2 - 70)
            make.centerX.equalTo(bottomLogoView.snp.centerX)
            make.centerY.equalTo(bottomLogoView.snp.centerY)
        }

        stackImage.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(16)
            make.topMargin.equalTo(safeAreaInsets.top).offset(20)
        }
        
        gitLbl.snp.makeConstraints { make in
            make.top.equalTo(stackImage.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(50)
        }
        
        userTfNameStack.snp.makeConstraints { make in
            make.top.equalTo(gitLbl.snp.bottom).offset(25)
            make.left.right.equalToSuperview().inset(16)
        }
        
        signButton.snp.makeConstraints { make in
            make.top.equalTo(userTfNameStack.snp.bottom).offset(20)
            make.height.equalTo(40)
            make.left.right.equalToSuperview().inset(50)
            
        }
    }
    
    private func addCorners() {
        topLogoView.layer.cornerRadius = topLogoView.frame.width / 2
        bottomLogoView.layer.cornerRadius = bottomLogoView.frame.width / 2
        signButton.layer.cornerRadius = 12
    }
    
    
}
