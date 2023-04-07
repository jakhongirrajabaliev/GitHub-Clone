//
//  MainTVC.swift
//  GitClone
//
//  Created by user1 on 13/05/22.
//

import UIKit

class MainTVC: UITableViewCell {

    static var reuseIdentifier: String = "MainTVC"
    
    // MARK: - UI Elements
    let conteinerView: UIView = {
        let conteinerView = UIView()
        conteinerView.backgroundColor = .systemGray6
        conteinerView.layer.cornerRadius = 12
        
        return conteinerView
    }()
    
    let nameLbl: UILabel = {
        let nameLbl = UILabel()
        nameLbl.font = .systemFont(ofSize: 16, weight: .medium)
        nameLbl.textColor = .black
        
        return nameLbl
    }()

    let btnImage: UIImageView = {
        let btnImage = UIImageView()
        btnImage.layer.cornerRadius = 8
        btnImage.contentMode = .scaleAspectFit
        btnImage.clipsToBounds = true
        btnImage.tintColor = .white
        
        return btnImage
    }()
    
    let arrowImage: UIImageView = {
        let arrowImage = UIImageView()
        arrowImage.contentMode = .scaleAspectFit
        arrowImage.clipsToBounds = true
        arrowImage.image = UIImage(systemName: "chevron.right")
        
        return arrowImage
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = CGFloat(12)
        
        return stackView
    }()
    
    // MARK: - Lifecycle
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        addViews()
//        addConstraints()
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    
    // MARK: - Setup views
    func addViews() {
        contentView.addSubview(conteinerView)
        contentView.backgroundColor = .clear
        stackView.addArrangedSubview(btnImage)
        conteinerView.addSubview(stackView)
        stackView.addArrangedSubview(nameLbl)
        stackView.addArrangedSubview(arrowImage)
    }
    
    func addConstraints() {
    
        conteinerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(4)
        }
        
        btnImage.snp.makeConstraints { make in
            make.height.width.equalTo(25)
        }
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
       }
        
    }
    
    func updateCell(info: ButtonModel) {
        btnImage.image = info.btnImage
        nameLbl.text = info.name
        btnImage.backgroundColor = info.btnBacground
    }
}

