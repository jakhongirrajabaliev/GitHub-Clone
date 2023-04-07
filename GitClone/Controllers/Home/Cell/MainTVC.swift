//
//  MainTVC.swift
//  GitClone
//
//  Created by user1 on 13/05/22.
//

import UIKit

struct BtnsModel {
    var btnImage : UIImage
    var name : String
    var btnBacground : UIColor

}

class MainTVC: UITableViewCell {

    let conteinerView = UIView()
    let btnImage = UIImageView()
    let arrowImage = UIImageView()
    let nameLbl = UILabel()
    let stacView = UIStackView()
    
    
    
    func setupView() {
        contentView.addSubview(conteinerView)
        contentView.backgroundColor = .clear
        conteinerView.backgroundColor = .systemGray6
        conteinerView.layer.cornerRadius = 12
        conteinerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(4)
        }
        
        stacView.addArrangedSubview(btnImage)
        btnImage.layer.cornerRadius = 8
        btnImage.snp.makeConstraints { make in
            make.height.width.equalTo(25)
        }
        btnImage.contentMode = .scaleAspectFit
        btnImage.clipsToBounds = true
        btnImage.tintColor = .white
        
        
        conteinerView.addSubview(stacView)
        stacView.alignment = .fill
        stacView.distribution = .fill
        stacView.axis = .horizontal
        stacView.spacing = CGFloat(12)
        stacView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
       }
        
        stacView.addArrangedSubview(nameLbl)
        nameLbl.font = .systemFont(ofSize: 16, weight: .medium)
        nameLbl.textColor = .black
        
        stacView.addArrangedSubview(arrowImage)
//        arrowImage.snp.makeConstraints { make in
//            make.height.width.equalTo(25)
//
//        }
        arrowImage.contentMode = .scaleAspectFit
        arrowImage.clipsToBounds = true
        
        arrowImage.image = UIImage(systemName: "chevron.right")
    }
    
    func updateCell(info: BtnsModel) {
        
        btnImage.image = info.btnImage
        nameLbl.text = info.name
        btnImage.backgroundColor = info.btnBacground
        
    }
}

