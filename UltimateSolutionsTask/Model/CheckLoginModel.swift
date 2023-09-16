//
//  CheckLoginModel.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import Foundation

struct CheckDeliveryLoginRequestValue: Codable {
    let P_LANG_NO: String
    let P_DLVRY_NO: String
    let P_PSSWRD: String
}

struct CheckDeliveryLoginRequest: Codable {
    let Value: CheckDeliveryLoginRequestValue
}

struct CheckDeliveryLoginResult: Codable {
    let ErrMsg: String
    let ErrNo: Int
}

struct CheckDeliveryLoginResponse: Codable {
    let Result: CheckDeliveryLoginResult
}
