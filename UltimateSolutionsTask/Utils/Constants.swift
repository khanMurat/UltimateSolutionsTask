//
//  Constants.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import Foundation

// HTTP is unsecure for ios and we added some key in info.plist

struct Constants {
    struct URLs {
        static let host = "http://mapp.yemensoft.net"
        static let baseURL = host + "/OnyxDeliveryService/Service.svc"
        static let checkDeliveryLogin = baseURL + "/CheckDeliveryLogin"
    }

}
