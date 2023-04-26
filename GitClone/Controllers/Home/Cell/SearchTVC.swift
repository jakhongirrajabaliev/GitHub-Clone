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

    // MARK: - Properties
    static var reuseIdentifier: String = "SearchTVC"
    
    // MARK: - UI Elements
    private let conteinerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let avatarImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 25
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    private let userNameLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let projectNameLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let lblsStack: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = CGFloat(3)
        return view
    }()
    
    private let stackVeiw: UIStackView = {
        let view = UIStackView()
        view.alignment = .fill
        view.distribution = .fill
        view.axis = .horizontal
        view.spacing = CGFloat(12)
        return view
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    private func addViews() {
        contentView.addSubview(conteinerView)
        contentView.backgroundColor = .clear
        conteinerView.addSubview(stackVeiw)
        stackVeiw.addArrangedSubview(lblsStack)
        stackVeiw.addArrangedSubview(avatarImage)
        lblsStack.addArrangedSubview(userNameLbl)
        lblsStack.addArrangedSubview(projectNameLbl)
    }
    
    private func addConstraints() {
        conteinerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.bottom.equalToSuperview().inset(8)
        }

        stackVeiw.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
       }
        
        avatarImage.snp.makeConstraints { make in
            make.height.width.equalTo(50)
        }
    }
    
    // MARK: - Public functions
    func updateCell(user: Repos, userName: String) {
        projectNameLbl.text = user.appname
        userNameLbl.text = userName
        self.avatarImage.sd_setImage(with: URL(string: user.avatarImage))
    }

}
