//
//  LoginController.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 15.09.2023.
//

import UIKit


class LoginController : UIViewController {
    
    
    //MARK: - Properties
    
    let circleView = CircleView()
    
    let brandView : UIImageView = {
       let bv = UIImageView()
        bv.image = #imageLiteral(resourceName: "onyx")
        bv.contentMode = .scaleAspectFill
        bv.setDimensions(height: 100, width: 100)
        return bv
    }()
    
    let welcomeLabel : UILabel = {
       let lbl = UILabel()
        lbl.text = "Welcome Back!"
        lbl.textAlignment = .center
        lbl.font = .boldSystemFont(ofSize: 28)
        return lbl
    }()
    
    let descriptionLabel : UILabel = {
       let lbl = UILabel()
        lbl.text = "Log back into your account"
        lbl.textAlignment = .center

        lbl.font = .systemFont(ofSize: 12)
        return lbl
    }()
    
    private let userIDTextField : CustomTextField = {
       
       let tf = CustomTextField(inputText: "USER ID")
        tf.keyboardType = .numberPad
        return tf
        
    }()
    
    private let passwordTextField : CustomTextField = {
       
       let tf = CustomTextField(inputText: "Password")
        tf.isSecureTextEntry = true
        return tf
        
    }()
    
    private lazy var loginButton : AuthButton = {
       
        let button = AuthButton(title: "Log In",type: .system)
        button.isEnabled = false
        button.addTarget(self, action: #selector(handleLoginUser), for: .touchUpInside)
        return button
    }()
    
    let carView : UIImageView = {
       let bv = UIImageView()
        bv.image = #imageLiteral(resourceName: "car")
        bv.contentMode = .scaleAspectFill
        bv.setDimensions(height: 150, width: 150)
        return bv
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    //MARK: - Actions
    
    @objc func handleLoginUser(){
        
    }
    
    @objc func handleRecognizer(){
        view.endEditing(true)
    }
    
    //MARK: - Helpers
    
        func configureUI() {
                view.backgroundColor = .white
                
                view.addSubview(circleView)
                circleView.anchor(top: view.topAnchor,right: view.rightAnchor,paddingRight: 0,width: -125,height: 125)
            
                view.addSubview(brandView)
                brandView.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.leftAnchor,paddingLeft: 48)
            
            let labelStack = UIStackView(arrangedSubviews: [welcomeLabel,descriptionLabel])
            labelStack.axis = .vertical
            labelStack.spacing = 16
            labelStack.alignment = .center
            labelStack.setHeight(80)
            
            view.addSubview(labelStack)
            labelStack.anchor(top: brandView.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 24)
            
            let stack = UIStackView(arrangedSubviews: [userIDTextField,passwordTextField,loginButton])
            
            stack.axis = .vertical
            stack.distribution = .fillEqually
            stack.spacing = 15
            stack.setHeight(160)
            
            view.addSubview(stack)
            stack.anchor(top: labelStack.bottomAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 48,paddingLeft: 16,paddingRight: 16)
            
            view.addSubview(carView)
            carView.centerX(inView: view,topAnchor: stack.bottomAnchor,paddingTop: 50)
            
            addGestureRecognizer()
    }
    
    func addGestureRecognizer(){
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleRecognizer))
        
        view.addGestureRecognizer(gesture)
    }

}
