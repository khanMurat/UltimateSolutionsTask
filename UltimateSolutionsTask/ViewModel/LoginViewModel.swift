//
//  LoginViewModel.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import Foundation

struct LoginViewModel{

    func loginUser(userID:String,password:String,languageCode:String,completion: @escaping (CheckDeliveryLoginResponse?) -> Void){
        
        AuthService.checkDeliveryLogin(request: CheckDeliveryLoginRequest(Value: CheckDeliveryLoginRequestValue(P_LANG_NO: languageCode, P_DLVRY_NO: userID, P_PSSWRD: password))) { result in
            
            switch result {
                
            case .success(let response):
                completion(response)
            case .failure(let error):
                completion(nil)
                print(error.localizedDescription)
            }
        }
        
    }
    
}
