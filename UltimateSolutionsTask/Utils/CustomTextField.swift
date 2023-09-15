//
//  CustomTextField.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import UIKit


class CustomTextField : UITextField {
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    
    init(inputText:String) {
        super.init(frame: .zero)

        backgroundColor = .lightGray.withAlphaComponent(0.1)
        attributedPlaceholder = NSMutableAttributedString(string: inputText, attributes: [.foregroundColor : UIColor.black.withAlphaComponent(0.6)])
        layer.cornerRadius = 20
        textAlignment = .center
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
