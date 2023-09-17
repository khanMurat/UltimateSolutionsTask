//
//  MainTopView.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 17.09.2023.
//

import UIKit

class MainTopView : UIView {
    
    //MARK: - Properties
    
    lazy var name : UILabel = {
       var lbl = UILabel()
        lbl.text = UserDefaultsService.getUserName()
        lbl.textColor = .white
        lbl.textAlignment = .center
        return lbl
    }()
    
    let circleView = CircleView(color: Constants.Colors.darkBlueColor)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Constants.Colors.darkBrownyColor
        
        addSubview(circleView)
        circleView.anchor(top: self.topAnchor,right: self.rightAnchor,paddingRight: 0,width: -125,height: 125)
        
        addSubview(name)
        name.anchor(top: self.topAnchor,paddingTop: 50)
        name.centerY(inView: self,leftAnchor: self.leftAnchor,paddingLeft: 12)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
