//
//  Service.swift
//  UltimateSolutionsTask
//
//  Created by Murat on 16.09.2023.
//

import Foundation
import Alamofire

class Service{
    
    static func fetchDeliveryItems(parameters:[String:Any],completion: @escaping (Result<[DeliveryBill], Error>) -> Void) {
        
        AF.request(Constants.URLs.getDeliveryBillItems, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseDecodable(of: DeliveryItems.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data.Data.DeliveryBills))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    static func fetchStatusTypes(request:DeliveryStatusRequest,completion:@escaping (Result<DeliveryStatusResponse,Error>)->Void){
        
        AF.request(Constants.URLs.getDeliveryStatusType,method: .post,parameters: request,encoder: JSONParameterEncoder.default).responseDecodable(of: DeliveryStatusResponse.self) { response in
            
            switch response.result{
                
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        
    }

}
