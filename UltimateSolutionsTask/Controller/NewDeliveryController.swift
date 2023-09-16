//
//  NewDeliveryController.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import UIKit


class NewDeliveryController : UIViewController{
    
    //MARK: - Properties
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
    }
    
    //MARK: - Helpers
    
    func configureCollectionView(){
        view.backgroundColor = .brown
    }
}
