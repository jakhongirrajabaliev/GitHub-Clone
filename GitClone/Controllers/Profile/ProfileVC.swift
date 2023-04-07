//
//  ProfileVC.swift
//  GitClone
//
//  Created by user1 on 12/05/22.
//

import UIKit

class ProfileVC: UIViewController {

    let color =  #colorLiteral(red: 0.9254901961, green: 0.2862745098, blue: 0.3019607843, alpha: 1)
    let imageView = UIImageView()
    let nameLbl = UILabel()
    let usernameLbl = UILabel()
    let companyLbl = UILabel()
    let locationLbl = UILabel()
    let followingLbl = UILabel()
    let followersLbl = UILabel()
    let logOutBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        makeCell()
        getUserFromAPI()
        view.backgroundColor = .white
        setupNavBar()
    }
    
    func makeCell() {
        let nameLblStack = UIStackView()
        nameLblStack.addArrangedSubview(nameLbl)
        nameLblStack.addArrangedSubview(usernameLbl)
        nameLblStack.axis = .vertical
        nameLblStack.spacing = 0
        nameLblStack.alignment = .fill
        nameLblStack.distribution = .fill
        nameLbl.font = .systemFont(ofSize: 18, weight: .semibold)
        nameLbl.textColor = .darkGray
        usernameLbl.textColor = .systemIndigo
        usernameLbl.font = .systemFont(ofSize: 20, weight: .semibold)
        companyLbl.font = .systemFont(ofSize: 16, weight: .semibold)
        followersLbl.font = .systemFont(ofSize: 14, weight: .bold)
        followingLbl.font = .systemFont(ofSize: 14, weight: .bold)
        locationLbl.font = .systemFont(ofSize: 17, weight: .semibold)
        
        let stackImage = UIStackView()
        stackImage.addArrangedSubview(imageView)
        stackImage.addArrangedSubview(nameLblStack)
        stackImage.axis = .horizontal
        stackImage.spacing = 16
        stackImage.distribution = .fill
        stackImage.alignment = .center
        
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(150)
        }
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds =  true
        let lblsStack = UIStackView()
                lblsStack.addArrangedSubview(companyLbl)
                lblsStack.addArrangedSubview(locationLbl)
                
                let followStack = UIStackView()
                followStack.addArrangedSubview(followersLbl)
                followStack.addArrangedSubview(followingLbl)
                followStack.axis = .horizontal
                followStack.spacing = 10
                followStack.distribution = .fillProportionally
                
                lblsStack.addArrangedSubview(followStack)
                lblsStack.axis = .vertical
                lblsStack.spacing = 16
                
                
                let bigStack = UIStackView()
                bigStack.addArrangedSubview(stackImage)
                bigStack.addArrangedSubview(lblsStack)
                bigStack.axis = .vertical
                
                self.view.addSubview(bigStack)
                bigStack.spacing = 40
                bigStack.snp.makeConstraints { make in
                    make.right.left.equalToSuperview().inset(16)
                    make.top.equalToSuperview().inset(170)
                    
                }
         
            }
            
            func getUserFromAPI() {
                API.shared.getUser(username: UserDefaults.standard.string(forKey: "userFound") ?? "") { user in
             
                        
                        self.followingLbl.text = "following \(user.following)"
                        self.followersLbl.text = "followers \(user.followers)"
                        self.nameLbl.text = user.name
                        self.usernameLbl.text = user.username
                        self.locationLbl.text = user.location
                        self.companyLbl.text = user.company
                        self.imageView.sd_setImage(with: URL(string: user.image))
                    
                }
            }
            
    
    
    func viewsSetup() {
        nameLbl.font = .systemFont(ofSize: 22, weight: .bold)
        nameLbl.textColor = .black
        
    }
    
    
    
    func setupNavBar() {
       navigationController?.navigationBar.prefersLargeTitles = true
       title = "Profile"
       navigationItem.hidesSearchBarWhenScrolling = true
       
   }
    

}
