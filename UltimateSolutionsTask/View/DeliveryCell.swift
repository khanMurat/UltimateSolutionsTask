//
//  DeliveryCell.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 17.09.2023.
//

import UIKit

class DeliveryCell : UICollectionViewCell{
    
    //MARK: - Properties
    
    var viewModel : NewDeliveryViewModel? {
        didSet{
            configure()
        }
    }
    
     var statusLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Status"
        lbl.font = .italicSystemFont(ofSize: 10)
        return lbl
    }()
    
     var statusDescription : UILabel = {
        let lbl = UILabel()
        lbl.text = "NEW"
        lbl.textColor = .green
        lbl.font = .boldSystemFont(ofSize: 14)
        return lbl
    }()
    
     var priceLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Total Price"
        lbl.font = .italicSystemFont(ofSize: 10)
        return lbl
    }()
    
     var priceDescription : UILabel = {
        let lbl = UILabel()
        lbl.text = "400 LE"
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.textColor = Constants.Colors.darkBlueColor
        return lbl
    }()
    
     var dateLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Date"
        lbl.font = .italicSystemFont(ofSize: 10)
        return lbl
    }()
    
     var dateDescription : UILabel = {
        let lbl = UILabel()
        lbl.text = "1/1/2020"
        lbl.font = .boldSystemFont(ofSize: 14)
        lbl.textColor = Constants.Colors.darkBlueColor
        return lbl
    }()
    
     var seperator1 : UIView = {
        let sp = UIView()
        sp.backgroundColor = .systemBlue
        sp.setWidth(1)
        sp.setHeight(50)
        return sp
    }()
    
     var seperator2 : UIView = {
        let sp = UIView()
        sp.backgroundColor = .systemBlue
        sp.setWidth(1)
        sp.setHeight(50)
        return sp
    }()
    
     var detailView : UIView = {
       let view = UIView()
        view.backgroundColor = .green
        let image = UIImageView(image: UIImage(systemName: "chevron.right"))
        view.addSubview(image)
        image.centerX(inView: view)
        image.centerY(inView: view)
        return view
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemGroupedBackground
        
        configureStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Helpers
    
    func configureStack(){
        
        let stackLabel = UIStackView(arrangedSubviews: [statusLabel, statusDescription])
        stackLabel.axis = .vertical
        stackLabel.spacing = 8
        stackLabel.distribution = .fillEqually
        
        addSubview(stackLabel)
        stackLabel.centerY(inView: self,leftAnchor: self.leftAnchor,paddingLeft: 36)
        
        addSubview(seperator1)
        seperator1.centerY(inView: self,leftAnchor: stackLabel.rightAnchor,paddingLeft: 12)
        
        let stackPrice = UIStackView(arrangedSubviews: [priceLabel, priceDescription])
        stackPrice.axis = .vertical
        stackPrice.spacing = 8
        stackPrice.distribution = .fillEqually
        
        addSubview(stackPrice)
        stackPrice.centerY(inView: self,leftAnchor: seperator1.rightAnchor,paddingLeft: 12)
        
        addSubview(seperator2)
        seperator2.centerY(inView: self,leftAnchor: stackPrice.rightAnchor,paddingLeft: 12)
        
        let stackDate = UIStackView(arrangedSubviews: [dateLabel, dateDescription])
        stackDate.axis = .vertical
        stackDate.spacing = 8
        stackDate.distribution = .fillEqually
        
        addSubview(stackDate)
        stackDate.centerY(inView: self,leftAnchor: seperator2.rightAnchor,paddingLeft: 12)
        
        addSubview(detailView)
        detailView.anchor(top: self.topAnchor,bottom: self.bottomAnchor,right: self.rightAnchor)
        detailView.setWidth(50)
        
    }
    
    func configure(){
        
        guard let viewModel = viewModel else {return}
        
        statusDescription.text = viewModel.statusLabel
        statusDescription.textColor = viewModel.statusColor(for: viewModel.statusLabel ?? "")
        
        priceDescription.text = viewModel.priceLabel ?? ""
        dateDescription.text = viewModel.dateLabel ?? ""
        
        detailView.backgroundColor = viewModel.statusColor(for: viewModel.statusLabel ?? "")
        
    }
}
