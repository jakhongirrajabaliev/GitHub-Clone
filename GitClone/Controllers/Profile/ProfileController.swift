//
//  ProfileVC.swift
//  GitClone
//
//  Created by user1 on 12/05/22.
//

import UIKit

class ProfileController: BaseController {

    // MARK: - Properties
    private let baseView: ProfileView = ProfileView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        callBaseView()
        getUser()
    }
    
    private func callBaseView() {
        baseView.frame = view.bounds
        view.addSubview(baseView)
    }
    
    // MARK: - Private functions
    private func getUser() {
        API.shared.getUser(username: UserDefaults.standard.string(forKey: "userFound") ?? "") { user in
            self.baseView.followingLbl.text = "Following: \(user.following)"
            self.baseView.followersLbl.text = "Followers: \(user.followers)"
            self.baseView.nameLbl.text = user.name
            self.baseView.usernameLbl.text = user.username
            self.baseView.locationLbl.text = "Location: \(user.location)"
            self.baseView.companyLbl.text = "Company: \(user.company)"
            self.baseView.imageView.sd_setImage(with: URL(string: user.image))
        }
    }
            
    private func setupNavBar() {
       navigationController?.navigationBar.prefersLargeTitles = true
       title = "Profile"
       navigationItem.hidesSearchBarWhenScrolling = true
   }
    
}
