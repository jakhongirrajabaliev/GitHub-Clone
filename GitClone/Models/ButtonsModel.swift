//
//  ButtonsModel.swift
//  GitClone
//
//  Created by user1 on 07/04/23.
//

import UIKit

struct ButtonModel {
    var btnImage : UIImage
    var name : String
    var btnBacground : UIColor
}

class ButtonDM {
    static let shared: ButtonDM = ButtonDM()
    
    var buttons : [ButtonModel] = [
        ButtonModel(btnImage: UIImage(systemName: "circle.circle.fill")!, name: "Issues", btnBacground: .systemGreen),
        ButtonModel(btnImage: UIImage(systemName: "line.3.crossed.swirl.circle.fill")!, name: "Pull Requiest", btnBacground: .systemBlue),
        ButtonModel(btnImage: UIImage(systemName: "message")!, name: "Disscusions", btnBacground: .systemIndigo),
        ButtonModel(btnImage: UIImage(systemName: "bus.doubledecker")!, name: "Repositories", btnBacground: .systemGray2),
        ButtonModel(btnImage: UIImage(systemName: "building")!, name: "Organizations", btnBacground: .systemOrange),
        ButtonModel(btnImage: UIImage(systemName: "star")!, name: "Started", btnBacground: .systemYellow)
    ]
}
