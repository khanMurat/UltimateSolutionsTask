//
//  DeliveryBillItems.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import Foundation

struct DeliveryItems : Codable{
    
    let Data : DeliveryData
    let Result : APIResult
    
}

struct DeliveryData : Codable {
    
    let DeliveryBills : [DeliveryBill]
}

struct DeliveryBill : Codable{
    
    let BILL_AMT : String
    
    let BILL_DATE : String
    
    let DLVRY_STATUS_FLG : String
    
    let BILL_SRL : String
}

struct DeliveryRequestBody : Codable{
    
    let Value : RequestValue
    
}

struct APIResult: Codable {
    let ErrMsg: String
    let ErrNo: Int
}

struct RequestValue : Codable {
    
    let P_DLVRY_NO: String
    
    let P_LANG_NO: String
    
    let P_BILL_SRL:String
    
    let P_PRCSSD_FLG:String
    
}
