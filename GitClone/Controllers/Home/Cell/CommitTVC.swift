//
//  CommitTVC.swift
//  GitClone
//
//  Created by user1 on 13/05/22.
//

import UIKit

class CommitTVC : UITableViewCell {
    
    // MARK: - Properties
    static var reuseIdentifier: String = "CommitTVC"
    
    // MARK: - UI Elements
    private let usernameLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .systemIndigo
        return label
    }()
    
    private let commitTitle: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let userImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 25
        view.clipsToBounds = true
        return view
    }()
    
    private let langLbl: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .lightGray
        return label
    }()
    
    private let dateLbl: UILabel = {
        let label = UILabel()
        label.textColor = .systemIndigo
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 2
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let labelStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 2
        return stack
    }()
    
    private let imageStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.alignment = .fill
        stack.axis = .horizontal
        stack.spacing = 0
        return stack
    }()
    
    private let bigStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .equalSpacing
        stack.axis = .horizontal
        stack.alignment = .fill
        return stack
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
        self.contentView.addSubview(containerView)
        labelStack.addArrangedSubview(usernameLbl)
        labelStack.addArrangedSubview(commitTitle)
        labelStack.addArrangedSubview(langLbl)
        imageStack.addArrangedSubview(userImage)
        imageStack.addArrangedSubview(labelStack)
        bigStack.addArrangedSubview(imageStack)
        bigStack.addArrangedSubview(dateLbl)
        containerView.addSubview(bigStack)
    }
    
    private func addConstraints() {
        userImage.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(1)
        }
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.left.right.equalToSuperview().inset(16)
        }
        
        bigStack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.right.left.equalToSuperview().inset(16)
        }
    }
    
    // MARK: - Public functions
    func updateCell(commit: Commit) {
        self.usernameLbl.text = commit.owner
//        self.commitTitle.text = commit.commitMassage
        let date = commit.date.split(separator: "T").first!
        self.dateLbl.text = "\(date)"
    }
}
