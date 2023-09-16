//
//  UserDefaults.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import Foundation


struct UserDefaultsService{
    
    static func saveUserId(P_DLVRY_NO : String){
        
        UserDefaults.standard.set(P_DLVRY_NO, forKey: "P_DLVRY_NO")
        
    }
    
    static func getUserIdFromMemory()->String?{
        
        return UserDefaults.standard.string(forKey: "P_DLVRY_NO")
    }
    
    static func saveLanguageCode(P_LANG_NO:String){
        
        UserDefaults.standard.set(P_LANG_NO, forKey: "P_LANG_NO")
    }
    
    static func getLanguageCodeFromMemory()->String?{
        
        return UserDefaults.standard.string(forKey: "P_LANG_NO")
    }
    
}
