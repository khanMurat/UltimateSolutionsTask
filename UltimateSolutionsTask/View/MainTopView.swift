//
//  MainTopView.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 17.09.2023.
//

import UIKit

class MainTopView : UIView {
    
    //MARK: - Properties
    
    let circleView = CircleView(color: Constants.Colors.darkBlueColor)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Constants.Colors.darkBrownyColor
        
        addSubview(circleView)
        circleView.anchor(top: self.topAnchor,right: self.rightAnchor,paddingRight: 0,width: -125,height: 125)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
