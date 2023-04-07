//
//  SearchTVC.swift
//  GitClone
//
//  Created by user1 on 13/05/22.
//

import UIKit
import SnapKit
import SDWebImage

class SearchTVC: UITableViewCell {

    static var reuseIdentifier: String = "SearchTVC"
    
    let conteinerView = UIView()
    let avatarImage = UIImageView()
    let userNameLbl = UILabel()
    let projectNameLbl = UILabel()
    
    let lblsStack = UIStackView()
    let stacVew = UIStackView()


    func cellSetup() {
        contentView.addSubview(conteinerView)
        contentView.backgroundColor = .clear
        conteinerView.backgroundColor = .systemGray6
        conteinerView.layer.cornerRadius = 12
        conteinerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(8)
        }

        conteinerView.addSubview(stacVew)
        stacVew.alignment = .fill
        stacVew.distribution = .fill
        stacVew.axis = .horizontal
        stacVew.spacing = CGFloat(12)
        stacVew.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
       }
        
        stacVew.addArrangedSubview(avatarImage)
        avatarImage.layer.cornerRadius = 25
        avatarImage.snp.makeConstraints { make in
            make.height.width.equalTo(50)
        }
        avatarImage.contentMode = .scaleAspectFit
        avatarImage.clipsToBounds = true
      
        stacVew.addArrangedSubview(lblsStack)
        lblsStack.axis = .vertical
        lblsStack.alignment = .fill
        lblsStack.distribution = .fillEqually
        lblsStack.spacing = CGFloat(3)

        lblsStack.addArrangedSubview(userNameLbl)
        lblsStack.addArrangedSubview(projectNameLbl)

        userNameLbl.font = .systemFont(ofSize: 14, weight: .medium)
        userNameLbl.textColor = .black
        projectNameLbl.font = .systemFont(ofSize: 16, weight: .semibold)
        
    }
    
    func updateCell(user: Repos, userName: String) {
        projectNameLbl.text = user.appname
        userNameLbl.text = userName
       
        self.avatarImage.sd_setImage(with: URL(string: user.avatarImage))
        
    }
    
    
}
