//
//  NewDeliveryController.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import UIKit

let cellIdentifier = "DeliveryCell"

class NewDeliveryController : UIViewController{

    //MARK: - Properties

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    private var viewModel : NewDeliveryViewModel!

    private var deliveryList = [DeliveryItem](){
        didSet{
            self.collectionView.reloadData()
        }
    }

    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureCollectionView()

        viewModel = NewDeliveryViewModel()

        NotificationCenter.default.addObserver(self, selector: #selector(handleGetItemsFromDatabase), name: .didSaveDataToDatabase, object: nil)

    }

    //MARK: - Actions

    @objc func handleGetItemsFromDatabase(){
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

        collectionView.register(DeliveryCell.self, forCellWithReuseIdentifier: cellIdentifier)

        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor,left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor,paddingTop: 250,paddingLeft: 16,paddingRight: 16)

    }
}

extension NewDeliveryController : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return deliveryList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! DeliveryCell

        let delivery = deliveryList[indexPath.row]

        cell.viewModel = NewDeliveryViewModel(model: delivery)

        return cell
    }

}

extension NewDeliveryController : UICollectionViewDelegateFlowLayout{

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

