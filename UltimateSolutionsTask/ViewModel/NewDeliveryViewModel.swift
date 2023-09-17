//
//  NewDeliveryViewModel.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 17.09.2023.
//

import UIKit

struct NewDeliveryViewModel {
    
    var model : DeliveryItem?
    
    var deliveries: [DeliveryItem] = []

    mutating func fetchDeliveries(completion: @escaping () -> Void) {
        let dbFileName = "myAppDB.sqlite3"
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("error when access document file")
            return
        }
        let dbPath = documentsDirectory.appendingPathComponent(dbFileName).path

        let databaseService = DatabaseService(databasePath: dbPath)

        self.deliveries = databaseService.fetchFilteredDeliveryItemsNew(status: "New")
        completion()
    }
    
    var statusLabel : String? {
        return model?.dlvryStatus
    }
    
    var priceLabel : String? {
        
        let price = Double(model?.billAmt ?? "0")
        guard let safePrice = price else{return ""}
            
        return String(format: "%.2f", safePrice)
    }

    
    var dateLabel : String? {
        return model?.billDate
    }
    
    func statusColor(for status: String) -> UIColor {
        switch status {
        case "New":
            return .green
        case "Delivered":
            return .gray
        case "Partial Return":
            return Constants.Colors.darkBlueColor
        case "Full Return":
            return .red
        default:
            return .black
        }
    }
    
}
