//
//  ProfileView.swift
//  GitClone
//
//  Created by user1 on 07/04/23.
//

import UIKit

class ProfileView: UIView {
    
    // MARK: - UI Elements
    private let conteinerView: UIView = {
        let conteinerView = UIView()
        conteinerView.backgroundColor = .white
        return conteinerView
    }()
    
    let imageView: UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = 75
        img.clipsToBounds =  true
        return img
    }()
    
    let nameLbl: UILabel = {
        let nameLbl = UILabel()
        nameLbl.font = .systemFont(ofSize: 18, weight: .semibold)
        nameLbl.textColor = .darkGray
        nameLbl.text = "name"
        return nameLbl
    }()
    
    let usernameLbl: UILabel = {
        let usernameLbl = UILabel()
        usernameLbl.textColor = .systemIndigo
        usernameLbl.font = .systemFont(ofSize: 20, weight: .semibold)
        usernameLbl.text = "username"
        return usernameLbl
    }()
    
    let companyLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 16, weight: .semibold)
        lbl.text = "company"
        return lbl
    }()
    
    let locationLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
        lbl.text = "location"
        return lbl
    }()
    
    let followingLbl:  UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
        lbl.text = "following"
        return lbl
    }()
    
    let followersLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 14, weight: .bold)
        lbl.text = "followers"
        return lbl
    }()
    
    private let nameLblStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()
    
    private let stackImage: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    private let followStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillProportionally
        return stack
    }()
    
    private let lblsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()
    
    private let bigStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 40
        return stack
    }()
    
//    private let logOutBtn = UIButton()
   
    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
        addConstraints()
    }
    
    // MARK: - Private functions
    private func addViews() {
        nameLblStack.addArrangedSubview(nameLbl)
        nameLblStack.addArrangedSubview(usernameLbl)
        stackImage.addArrangedSubview(imageView)
        stackImage.addArrangedSubview(nameLblStack)
        followStack.addArrangedSubview(followersLbl)
        followStack.addArrangedSubview(followingLbl)
        lblsStack.addArrangedSubview(companyLbl)
        lblsStack.addArrangedSubview(locationLbl)
        lblsStack.addArrangedSubview(followStack)
        bigStack.addArrangedSubview(stackImage)
        bigStack.addArrangedSubview(lblsStack)
        addSubview(conteinerView)
        conteinerView.addSubview(bigStack)
    }
    
    private func addConstraints() {
        conteinerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bigStack.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(16)
            make.topMargin.equalTo(safeAreaInsets.top).offset(5)
        }
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(150)
        }
    }
    
}
