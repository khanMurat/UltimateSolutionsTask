//
//  AuthService.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import Foundation
import Alamofire


struct AuthService {
    
    static func checkDeliveryLogin(request:CheckDeliveryLoginRequest,completion:@escaping (Result<CheckDeliveryLoginResponse,Error>)->Void){
        
        AF.request(Constants.URLs.checkDeliveryLogin,method: .post,parameters: request,encoder: JSONParameterEncoder.default).responseDecodable(of: CheckDeliveryLoginResponse.self) { response in
            
            switch response.result {
                 
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
