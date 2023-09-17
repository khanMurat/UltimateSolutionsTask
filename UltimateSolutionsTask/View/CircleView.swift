//
//  TopLoginView.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 15.09.2023.
//

import UIKit


class CircleView : UIView {
    
    //MARK: - Properties
    
    var color : UIColor
    
    lazy var circleView : UIView = {
       
        let view = UIView()
        
        let shapeLayer = CAShapeLayer()
        let center = CGPoint(x: self.bounds.width, y: 0)
        let radius = CGFloat(125)
        let startAngle = CGFloat(90 * Double.pi / 180)
        let endAngle = CGFloat(180 * Double.pi / 180)
        
        let path = UIBezierPath(arcCenter: center,
                                radius: radius,
                                startAngle: startAngle,
                                endAngle: endAngle,
                                clockwise: true)
        path.addLine(to: center)
        path.close()
        
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = color.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 2
        
        view.layer.addSublayer(shapeLayer)
        
        return view
    }()
    
    
    //MARK: - Lifecycle
    
     init(color:UIColor) {
        self.color = color
         super.init(frame: .zero)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        
        self.backgroundColor = .white
        
        addSubview(circleView)
        
    }
}
