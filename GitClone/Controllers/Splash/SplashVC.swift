//
//  SplashVC.swift
//  GitClone
//
//  Created by user1 on 12/05/22.
//

import UIKit

class SplashVC: UIViewController {

    var conteinerView = UIView()
    var conteinerImageView = UIImageView()
    var logoImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       viewSetup()
    }
    
    func viewSetup() {
        conteinerView = UIView(frame: self.view.frame)
        conteinerView.backgroundColor = .white
        self.view.addSubview(conteinerView)
    
        conteinerImageView = UIImageView(frame: self.view.frame)

        conteinerView.addSubview(conteinerImageView)
        
        logoImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        logoImage.image = UIImage(named: "logo")
        logoImage.center = conteinerImageView.center
        conteinerImageView.addSubview(logoImage)
        
        logoImage.transform = .init(scaleX: 1.3, y: 1.3)
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0, options: [.curveEaseIn]) {
            self.logoImage.transform = .identity
        } completion: { _ in
            
            if UserDefaults.standard.string(forKey: "userFound") == nil {
                let vc = LoginController()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
            } else {
                let vc = MainTBC()
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: false, completion: nil)
            }
           
        }

    }
}
