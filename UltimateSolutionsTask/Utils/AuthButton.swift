//
//  AuthButton.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import UIKit

class AuthButton : UIButton {
    
    
    init(title:String,type:ButtonType) {
         super.init(frame: .zero)
         
         layer.cornerRadius = 20
         setTitle(title, for: .normal)
        backgroundColor = Constants.Colors.darkBlueColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
