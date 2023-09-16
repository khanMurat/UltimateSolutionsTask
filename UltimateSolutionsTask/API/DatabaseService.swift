//
//  DatabaseService.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import SQLite

class DatabaseService {
    let db: Connection

    init(databasePath: String) {
        db = try! Connection(databasePath)
        setupDatabase()
    }

    func setupDatabase() {
        let deliveryItems = Table("DeliveryItems")
        let billSrl = Expression<String>("BILL_SRL")
        let billAmt = Expression<String>("BILL_AMT")
        let billDate = Expression<String>("BILL_DATE")
        let dlvryStatus = Expression<String>("DLVRY_STATUS")
        
        if (try? db.scalar(deliveryItems.exists)) ?? false {
             print("Table already exists.")
             return
         }

        try! db.run(deliveryItems.create { t in
            t.column(billSrl, unique: true)
            t.column(billAmt)
            t.column(billDate)
            t.column(dlvryStatus)
        })
    }
    
    func prepareDataForDatabase(deliveryBills: [DeliveryBill], statusTypes: [DeliveryStatus]) -> [(String, String, String)] {
        var preparedData: [(String, String, String)] = []
        
        let statusDict = Dictionary(uniqueKeysWithValues: statusTypes.map { ($0.TYP_NO, $0.TYP_NM) })

        for bill in deliveryBills {
            let status = statusDict[bill.DLVRY_STATUS_FLG] ?? "New"
            preparedData.append((bill.BILL_AMT, bill.BILL_DATE, status))
        }

        return preparedData
    }
    
    func saveOrUpdateDeliveryItem(item: DeliveryItem) {
        let deliveryItems = Table("DeliveryItems")
        let billSrlColumn = Expression<String>("BILL_SRL")
        let billAmt = Expression<String>("BILL_AMT")
        let billDate = Expression<String>("BILL_DATE")
        let dlvryStatus = Expression<String>("DLVRY_STATUS")
        
        let currentRow = deliveryItems.filter(billSrlColumn == item.billSrl)

        if let _ = try? db.pluck(currentRow) {
            let update = currentRow.update([
                billAmt <- item.billAmt,
                billDate <- item.billDate,
                dlvryStatus <- item.dlvryStatus
            ])
            try! db.run(update)
        } else {
            let insert = deliveryItems.insert(billSrlColumn <- item.billSrl, billAmt <- item.billAmt, billDate <- item.billDate, dlvryStatus <- item.dlvryStatus)
            try! db.run(insert)
        }
    }


    func fetchFilteredDeliveryItems(status: String) -> [(String, String, String)] {
        let deliveryItems = Table("DeliveryItems")
        let billAmt = Expression<String>("BILL_AMT")
        let billDate = Expression<String>("BILL_DATE")
        let dlvryStatus = Expression<String>("DLVRY_STATUS")
        
        let query = deliveryItems.filter(dlvryStatus == status)
        
        var results: [(String, String, String)] = []
        for item in try! db.prepare(query) {
            results.append((item[billAmt], item[billDate], item[dlvryStatus]))
        }

        return results
    }

    
}
