//
//  LoginVC.swift
//  GitClone
//
//  Created by user1 on 12/05/22.
//

import UIKit
import SnapKit

class LoginVC: UIViewController {

    var conteinerView = UIView()
    var toplogoView = UIView()

    var logoTopImage = UIImageView()
    var whiteView = UIView()
    var logoImage2 = UIImageView()
    
    var gitLbl = UILabel()
    var usernameLbl = UILabel()
    var userNameTf = UITextField()
    
    var passwordLbl = UILabel()
    var passwordTf = UITextField()
    
    var signButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewSetup()
        
       
    }
    

    func viewSetup() {
        
        
        conteinerView = UIView(frame: self.view.frame)
        conteinerView.backgroundColor = #colorLiteral(red: 0.09225723892, green: 0.1022897735, blue: 0.1319077313, alpha: 1)
        self.view.addSubview(conteinerView)
        
        toplogoView = UIView(frame: CGRect(x: conteinerView.frame.width / 2 - 30, y: 60, width: 60, height: 60))
        
        toplogoView.backgroundColor = .white
        toplogoView.layer.cornerRadius = toplogoView.frame.width / 2
        conteinerView.addSubview(toplogoView)
        
        logoTopImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        logoTopImage.image = UIImage(named: "logo2")
        toplogoView.addSubview(logoTopImage)
        
        
        
        whiteView = UIView(frame: CGRect(x: conteinerView.frame.width / 2 - 70, y: logoTopImage.frame.height + 120 , width: 140, height: 140))
        
        whiteView.backgroundColor = .white
        whiteView.layer.cornerRadius = whiteView.frame.width / 2
        conteinerView.addSubview(whiteView)
        
        logoImage2 = UIImageView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        logoImage2.image = UIImage(named: "logo")
        logoImage2.center = whiteView.center
        
        conteinerView.addSubview(logoImage2)
        
        
        gitLbl = UILabel(frame: CGRect(x: 50, y: 330, width: self.view.frame.width - 100, height: 60))
        
        gitLbl.text = "Sign into GitHub to continue to GitHub iOS"
        gitLbl.textColor = .white
        gitLbl.font = UIFont.boldSystemFont(ofSize: 18)
        gitLbl.numberOfLines = 2
        gitLbl.textAlignment = .center
        
        conteinerView.addSubview(gitLbl)
   
        usernameLbl = UILabel(frame: CGRect(x: 20, y: 420, width: self.view.frame.width - 100, height: 30))
        
        usernameLbl.text = "Username or Email address"
        usernameLbl.textColor = .white
        usernameLbl.font = .systemFont(ofSize: 16)
        conteinerView.addSubview(usernameLbl)
        
        
         userNameTf =  UITextField(frame: CGRect(x: 20, y: 455, width: self.view.frame.width - 40, height: 40))
        
        userNameTf.font = UIFont.systemFont(ofSize: 15)
        userNameTf.borderStyle = UITextField.BorderStyle.roundedRect
        userNameTf.autocorrectionType = UITextAutocorrectionType.no
        userNameTf.keyboardType = UIKeyboardType.default
        userNameTf.returnKeyType = UIReturnKeyType.done
        userNameTf.clearButtonMode = UITextField.ViewMode.whileEditing
        userNameTf.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
          conteinerView.addSubview(userNameTf)
        
      
        signButton.frame = CGRect(x: 20, y: 530, width: self.view.frame.width - 40, height: 40)
        signButton.backgroundColor = .systemGreen
        signButton.setTitle("Sign in", for: .normal)
        signButton.layer.cornerRadius = 12
        conteinerView.addSubview(signButton)
        
        signButton.addTarget(self, action: #selector(signTapped), for: .touchUpInside)
        
        
    }
    
    
    @objc func signTapped(sender: UIButton!) {
        
        if userNameTf.text!.isEmpty {
            
            Alert.showAlert(forState: .error, message: "Username couldnot been empty please try again! ")
            
        } else {
            if userNameTf.text!.contains(" ") {
                Alert.showAlert(forState: .error, message: "Username is uncorrect!")
            } else {
                API.shared.getRepos(username: userNameTf.text!, compleation: { user in
                    
                    
        
                         let vc = MainTBC()
                        
                         UserDefaults.standard.set(self.userNameTf.text!, forKey: "userFound")
                        
                         vc.modalPresentationStyle = .fullScreen
                         self.present(vc, animated: false, completion: nil)
                         
                
                })
            }
        }
    }
    
    
 
}
