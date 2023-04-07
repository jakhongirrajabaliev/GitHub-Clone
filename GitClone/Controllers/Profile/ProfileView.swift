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
    
    private let logOutBtn = UIButton()
    private let bigStack = UIStackView()
   
    override func layoutSubviews() {
        super.layoutSubviews()
        addViews()
        addConstraints()
    }
    
    private func addViews() {
        let nameLblStack = UIStackView()
        nameLblStack.addArrangedSubview(nameLbl)
        nameLblStack.addArrangedSubview(usernameLbl)
        nameLblStack.axis = .vertical
        nameLblStack.spacing = 0
        nameLblStack.alignment = .fill
        nameLblStack.distribution = .fill
        
        let stackImage = UIStackView()
        stackImage.addArrangedSubview(imageView)
        stackImage.addArrangedSubview(nameLblStack)
        stackImage.axis = .horizontal
        stackImage.spacing = 16
        stackImage.distribution = .fill
        stackImage.alignment = .center
        
        let followStack = UIStackView()
        followStack.addArrangedSubview(followersLbl)
        followStack.addArrangedSubview(followingLbl)
        followStack.axis = .horizontal
        followStack.spacing = 10
        followStack.distribution = .fillProportionally
        
        let lblsStack = UIStackView()
        lblsStack.addArrangedSubview(companyLbl)
        lblsStack.addArrangedSubview(locationLbl)
        lblsStack.addArrangedSubview(followStack)
        lblsStack.axis = .vertical
        lblsStack.spacing = 16
       
        bigStack.addArrangedSubview(stackImage)
        bigStack.addArrangedSubview(lblsStack)
        bigStack.axis = .vertical
        bigStack.spacing = 40
        addSubview(conteinerView)
        conteinerView.addSubview(bigStack)
        
    }
    
    private func addConstraints() {
        conteinerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        bigStack.snp.makeConstraints { make in
            make.right.left.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(0)
        }
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(150)
        }
    }
    
}
