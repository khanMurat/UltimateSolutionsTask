//
//  SegmentedController.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import UIKit

class MainController : UIViewController{
    
    //MARK: - Properties
    
    let viewModel = MainViewModel()
    
    private let mainTopView = MainTopView()
    
    private lazy var segmentedControl : UISegmentedControl = {
       
        let segmented = UISegmentedControl(items: ["New","Others"])
        segmented.selectedSegmentIndex = 0
        segmented.backgroundColor = .white
        segmented.setDimensions(height: 40, width: 220)
        segmented.selectedSegmentTintColor = Constants.Colors.darkBlueColor
        segmented.tintColor = .white
        segmented.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        return segmented
        
    }()
    
    private var newDeliveryController = NewDeliveryController()
    
    private var otherDeliveryController = OtherDeliveryController()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
        saveDatabaseToApiDatas()
        
    }
    
    //MARK: - Actions
    
    @objc func handleSegmentChange(){
        
        switch segmentedControl.selectedSegmentIndex{
            
        case 0 :
            newDeliveryController.view.isHidden = false
            otherDeliveryController.view.isHidden = true
            
        case 1 :
            newDeliveryController.view.isHidden = true
            otherDeliveryController.view.isHidden = false
        default:
            break
        }
    }
    
    //MARK: - Helpers
    
    func configureUI(){
        
        view.backgroundColor = .white
        
        setupChildController()
        
        view.addSubview(newDeliveryController.view)
        newDeliveryController.view.frame = self.view.bounds
        newDeliveryController.didMove(toParent: self)

        view.addSubview(otherDeliveryController.view)
        otherDeliveryController.view.frame = self.view.bounds
        otherDeliveryController.didMove(toParent: self)
        otherDeliveryController.view.isHidden = true
        
        view.addSubview(mainTopView)
        mainTopView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 125)
        
        view.addSubview(segmentedControl)
        segmentedControl.centerX(inView: view,topAnchor: mainTopView.bottomAnchor,paddingTop: 64)
        segmentedControl.layer.cornerRadius = 20
        segmentedControl.layer.masksToBounds = true
        
    }
    
    func saveDatabaseToApiDatas(){
        viewModel.saveDataToDatabase { error in
            if error != nil{
                print("Error : \(error?.localizedDescription ?? "")")
            }else{
                NotificationCenter.default.post(name: .didSaveDataToDatabase, object: nil)
            }
        }
    }
    
    func setupChildController(){
        addChild(newDeliveryController)
        addChild(otherDeliveryController)
    }
}
