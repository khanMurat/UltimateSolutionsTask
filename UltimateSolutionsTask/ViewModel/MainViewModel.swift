//
//  MainViewModel.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import Foundation

class MainViewModel{
    
    func getDeliveryBillItems(completion:@escaping([DeliveryBill]?)->Void){
        
        guard let dlvryNo = UserDefaultsService.getUserIdFromMemory() else{return}
        guard let langNo = UserDefaultsService.getLanguageCodeFromMemory() else{return}
        
        let parameters: [String: Any] = [
            "Value": [
                "P_DLVRY_NO": dlvryNo,
                "P_LANG_NO": langNo,
                "P_BILL_SRL": "",
                "P_PRCSSD_FLG": ""
            ]
        ]
        Service.fetchDeliveryItems(parameters: parameters){ result in
            switch result{
            case .success(let bills):
                completion(bills)
            case .failure(let error):
                print("error :\(error)")
            }
        }
    }
        
        func getDeliveryStatusType(languageCode:String,completion:@escaping (DeliveryStatusResponse?)->Void){
            
            Service.fetchStatusTypes(request: DeliveryStatusRequest(Value: StatusRequesValue(P_LANG_NO: languageCode))) { result in
                
                switch result {
                    
                case .success(let statuses):
                    completion(statuses)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        func saveDataToDatabase(){
            let dbFileName = "myAppDB.sqlite3"
            guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                print("error when access document file")
                return
            }
            let dbPath = documentsDirectory.appendingPathComponent(dbFileName).path
            
            let databaseService = DatabaseService(databasePath: dbPath)
            
            fetchAndPrepareDataForDatabase(databaseService: databaseService)
        }
        
    func fetchAndPrepareDataForDatabase(databaseService: DatabaseService) {
        getDeliveryBillItems { [weak self] deliveryBills in
            guard let self = self else { return }
            guard let bills = deliveryBills else { return }
            
            guard let languageCode = UserDefaultsService.getLanguageCodeFromMemory() else { return }
            
            getDeliveryStatusType(languageCode: languageCode) { statusesResponse in
                guard let statuses = statusesResponse?.Data.DeliveryStatusTypes else { return }
                
                let preparedData = self.prepareDataForDatabase(deliveryBills: bills, statusTypes: statuses)
                
                for item in preparedData {
                    do {
                        try databaseService.saveOrUpdateDeliveryItem(item: item)
                    } catch {
                        print("Error happened when try saving to database: \(error)")
                    }
                }
            }
        }
    }

    
    
    func prepareDataForDatabase(deliveryBills: [DeliveryBill], statusTypes: [DeliveryStatus]) -> [DeliveryItem] {
        var preparedData: [DeliveryItem] = []
        
        let statusDict = Dictionary(uniqueKeysWithValues: statusTypes.map { ($0.TYP_NO, $0.TYP_NM) })
        
        for bill in deliveryBills {
            let status = statusDict[bill.DLVRY_STATUS_FLG] ?? "New"
            let item = DeliveryItem(billSrl: bill.BILL_SRL, billAmt: bill.BILL_AMT, billDate: bill.BILL_DATE, dlvryStatus: status)
            preparedData.append(item)
        }
        
        return preparedData
    }

    }
