//
//  DeliveryCell.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 17.09.2023.
//

import UIKit

class DeliveryCell: UICollectionViewCell {

    // MARK: - Properties
     var viewModel: NewDeliveryViewModel? {
        didSet {
            configure()
        }
    }

    private lazy var statusStack: UIStackView = createStackView(with: [statusLabel, statusDescription])
    
    private lazy var priceStack: UIStackView = createStackView(with: [priceLabel, priceDescription])
    
    private lazy var dateStack: UIStackView = createStackView(with: [dateLabel, dateDescription])

    private lazy var statusLabel: UILabel = createLabel(text: "Status", fontSize: 10, isBold: false)
    
    lazy var statusDescription: UILabel = createLabel(text: "NEW", fontSize: 14, isBold: true, textColor: .green)
    
    private lazy var priceLabel: UILabel = createLabel(text: "Total Price", fontSize: 10, isBold: false)
    
    lazy var priceDescription: UILabel = createLabel(text: "400 LE", fontSize: 14, isBold: true, textColor: Constants.Colors.darkBlueColor)
    
    private lazy var dateLabel: UILabel = createLabel(text: "Date", fontSize: 10, isBold: false)
    
    lazy var dateDescription: UILabel = createLabel(text: "1/1/2020", fontSize: 12, isBold: true, textColor: Constants.Colors.darkBlueColor)

    private lazy var seperator1: UIView = createSeparator()
    
    private lazy var seperator2: UIView = createSeparator()

    private let detailView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        let image = UIImageView(image: UIImage(systemName: "chevron.right"))
        view.addSubview(image)
        image.centerX(inView: view)
        image.centerY(inView: view)
        return view
    }()

    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGroupedBackground
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers
    private func createLabel(text: String, fontSize: CGFloat, isBold: Bool, textColor: UIColor = .black) -> UILabel {
        let lbl = UILabel()
        lbl.text = text
        lbl.numberOfLines = 0
        lbl.font = isBold ? .boldSystemFont(ofSize: fontSize) : .systemFont(ofSize: fontSize)
        lbl.textColor = textColor
        return lbl
    }

    private func createStackView(with views: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: views)
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.setWidth(80)
        return stack
    }

    private func createSeparator() -> UIView {
        let sp = UIView()
        sp.backgroundColor = .systemBlue
        sp.setWidth(1)
        sp.setHeight(50)
        return sp
    }

    private func configureLayout() {
        addSubview(statusStack)
        statusStack.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 24)

        addSubview(seperator1)
        seperator1.centerY(inView: self, leftAnchor: statusStack.rightAnchor, paddingLeft: 10)

        addSubview(priceStack)
        priceStack.centerY(inView: self, leftAnchor: seperator1.rightAnchor, paddingLeft: 10)

        addSubview(seperator2)
        seperator2.centerY(inView: self, leftAnchor: priceStack.rightAnchor, paddingLeft: 10)

        addSubview(dateStack)
        dateStack.centerY(inView: self, leftAnchor: seperator2.rightAnchor, paddingLeft: 10)

        addSubview(detailView)
        detailView.anchor(top: topAnchor, bottom: bottomAnchor, right: rightAnchor)
        detailView.setWidth(55)
    }

    private func configure() {
        guard let viewModel = viewModel else { return }

        statusDescription.text = viewModel.statusLabel
        statusDescription.textColor = viewModel.statusColor(for: viewModel.statusLabel ?? "")
        priceDescription.text = viewModel.priceLabel ?? ""
        dateDescription.text = viewModel.dateLabel ?? ""
        detailView.backgroundColor = viewModel.statusColor(for: viewModel.statusLabel ?? "")
    }
}

