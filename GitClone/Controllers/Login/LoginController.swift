//
//  LoginVC.swift
//  GitClone
//
//  Created by user1 on 12/05/22.
//

import UIKit
import SnapKit

class LoginController: BaseController {

    //MARK: Properties
    let baseView = LoginView()
    
    //MARK: Lifeciycle
    override func viewDidLoad() {
        super.viewDidLoad()
        callBaseView()
        addTargetSetup()
    }
    
    // MARK: - Private functions
    private func callBaseView() {
        baseView.frame = view.bounds
        view.addSubview(baseView)
    }
    
    private func addTargetSetup() {
        baseView.signButton.addTarget(self, action: #selector(signTapped), for: .touchUpInside)
    }
    
    // MARK: - Private actions
    @objc func signTapped(sender: UIButton!) {
        
        if baseView.userNameTf.text!.isEmpty {
            Alert.showAlert(forState: .error, message: "Username couldnot been empty please try again! ")
        } else {
            if baseView.userNameTf.text!.contains(" ") {
                Alert.showAlert(forState: .error, message: "Username is uncorrect!")
            } else {
                API.shared.getRepos(username: baseView.userNameTf.text!, compleation: { user in
                    let vc = MainTBC()
                    UserDefaults.standard.set(self.baseView.userNameTf.text!, forKey: "userFound")
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: false, completion: nil)
                         
                })
            }
        }
    }
    
}
