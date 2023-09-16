//
//  Constants.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import UIKit

// HTTP is unsecure for ios and we added some key in info.plist

struct Constants {
    struct URLs {
        static let host = "http://mapp.yemensoft.net"
        static let baseURL = host + "/OnyxDeliveryService/Service.svc"
        static let checkDeliveryLogin = baseURL + "/CheckDeliveryLogin"
        static let getDeliveryBillItems = baseURL + "/GetDeliveryBillsItems"
        static let getDeliveryStatusType = baseURL + "/GetDeliveryStatusTypes"
    }
    
    struct Colors {
        static let darkBlueColor = UIColor(red: 32/255.0, green: 78/255.0, blue: 96/255.0, alpha: 1)
    }

}
