//
//  CommitTVC.swift
//  GitClone
//
//  Created by user1 on 13/05/22.
//

import UIKit

class CommitTVC : UITableViewCell {
    
    //OUTLETS
    let usernameLbl = UILabel()
    let commitTitle = UILabel()
    let UserImage = UIImageView()
    let langLbl = UILabel()
    let dateLbl = UILabel()
    let containerView = UIView()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setupCell() {

        //SETUP STACK
        let lblStack = UIStackView()
        let imgStack = UIStackView()
        let allStack = UIStackView()
        
        lblStack.addArrangedSubview(usernameLbl)
        lblStack.addArrangedSubview(commitTitle)
        lblStack.addArrangedSubview(langLbl)
        lblStack.distribution = .fillEqually
        lblStack.axis = .vertical
        lblStack.spacing = 2
        
        imgStack.addArrangedSubview(UserImage)
        imgStack.addArrangedSubview(lblStack)
        imgStack.distribution = .fill
        imgStack.alignment = .fill
        imgStack.axis = .horizontal
        imgStack.spacing = 0
        
        allStack.addArrangedSubview(imgStack)
        allStack.addArrangedSubview(dateLbl)
        allStack.distribution = .equalSpacing
        allStack.axis = .horizontal
        allStack.alignment = .fill
        
        //SETUP LAYERS
        UserImage.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(1)
        }
        UserImage.layer.cornerRadius = 25
        UserImage.clipsToBounds = true
        
        usernameLbl.font = .systemFont(ofSize: 16, weight: .semibold)
        usernameLbl.textColor = .systemIndigo
        
        commitTitle.textColor = .darkGray
        commitTitle.font = .systemFont(ofSize: 14, weight: .medium)
        
        langLbl.font = .systemFont(ofSize: 12, weight: .medium)
        langLbl.textColor = .lightGray
        
        dateLbl.textColor = .systemIndigo
        
        dateLbl.font = .systemFont(ofSize: 13, weight: .medium)
        dateLbl.numberOfLines = 2
        
        self.contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.left.right.equalToSuperview().inset(16)
        }
        
        containerView.backgroundColor = .systemGray6
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = 12
        containerView.addSubview(allStack)
        allStack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.right.left.equalToSuperview().inset(16)
        }
    }
    
    func updateCell(commit : Commit) {
        self.usernameLbl.text = commit.owner
//        self.commitTitle.text = commit.commitMassage
        let date = commit.date.split(separator: "T").first!
        self.dateLbl.text = "\(date)"
    }
}
