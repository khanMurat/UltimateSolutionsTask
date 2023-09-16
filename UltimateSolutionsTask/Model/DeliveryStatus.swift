//
//  DeliveryStatus.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import Foundation


struct DeliveryStatusResponse : Codable{
    
    let Data : StatusData
    let Result : StatusResult
}

struct StatusData : Codable{
    
    let DeliveryStatusTypes : [DeliveryStatus]
    
}

struct DeliveryStatus : Codable{
    
    let TYP_NM : String
    let TYP_NO : String
}

struct StatusResult : Codable {
    
   let  ErrMsg: String
   let  ErrNo: Int
}

struct DeliveryStatusRequest:Codable{
    
    let Value : StatusRequesValue
}

struct StatusRequesValue:Codable{
    
    let P_LANG_NO : String
}
