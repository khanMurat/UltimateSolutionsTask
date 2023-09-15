//
//  CheckLoginModel.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import Foundation

struct CheckDeliveryLoginRequestValue: Encodable {
    let P_LANG_NO: String
    let P_DLVRY_NO: String
    let P_PSSWRD: String
}

struct CheckDeliveryLoginRequest: Encodable {
    let Value: CheckDeliveryLoginRequestValue
}

struct CheckDeliveryLoginResult: Decodable {
    let ErrMsg: String
    let ErrNo: Int
}

struct CheckDeliveryLoginResponse: Decodable {
    let Result: CheckDeliveryLoginResult
}
