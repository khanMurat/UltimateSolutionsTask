//
//  OtherDeliveryController.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import UIKit


let reuseIdentifier = "DeliveryCell"

class OtherDeliveryController : UIViewController{
    
    //MARK: - Properties
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var viewModel : OtherDeliveryViewModel!
    
    var deliveryList = [DeliveryItem](){
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        
        viewModel = OtherDeliveryViewModel()
        
        
        viewModel.fetchDeliveries {
            DispatchQueue.main.async {
                self.deliveryList = self.viewModel.deliveries
                self.collectionView.reloadData()
            }
        }
    }
    
    
    //MARK: - Helpers
    
    func configureCollectionView(){
        view.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(DeliveryCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor,left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor,paddingTop: 250,paddingLeft: 16,paddingRight: 16)
        
    }
}

extension OtherDeliveryController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deliveryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! DeliveryCell
        
        let delivery = deliveryList[indexPath.row]
        
        cell.viewModel = NewDeliveryViewModel(model: delivery)
        
        return cell
    }

}

extension OtherDeliveryController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (view.frame.width - 2)
        
        return CGSize(width: width, height: 100)
    }
    
}

