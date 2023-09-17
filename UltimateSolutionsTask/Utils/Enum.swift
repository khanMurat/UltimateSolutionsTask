//
//  Enum.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 17.09.2023.
//

import UIKit


enum StatusEnum : Int {
    
    case new
    case delivered
    case partialReturn
    case fullReturn
    
    
    var description : String {
        
        switch self {
            
        case .new:
            return "New"
        case .delivered:
            return "Delivered"
        case .partialReturn:
            return "Partial Return"
        case .fullReturn:
            return "Full Return"
        }
    }
    
    var color : UIColor {
        
        switch self {
            
        case .new:
            return .green
        case .delivered:
            return .gray
        case .partialReturn:
            return Constants.Colors.darkBlueColor
        case .fullReturn:
            return .red
        }
    }
    
}
