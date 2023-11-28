//
//  Network.swift
//  LSLPProject
//
//  Created by Jae Oh on 11/27/23.
//

import Foundation
import Alamofire

enum SuccessCode: Int {
    case goooood = 200
    case baaaad = 409
}

enum NoticeError: Int, Error {
    case parameterError = 400
    case alreadyJoindUser = 409
    var errorDescription: String {
        switch self {
        case .parameterError:
            return "필수값을 채워주세요"
        case .alreadyJoindUser:
            return "이미 가입된 유저입니다."
        }
    }
    
}

class Network {
    
    static let shared = Network()
    
    private init() {}
    
    func requestConvertible<T: Decodable>(type: T.Type, api: Router, completion: @escaping (Result<T, NoticeError>) -> Void ) {
        
        AF.request(api).responseDecodable(of: T.self) { response in
//            print(response.result)
//            print(response.response?.statusCode)
            switch response.result {
            case .success(let data):
                completion(.success(data))
//                let SuccessStatusCode = response.response?.statusCode ?? 500
//                guard let successCode = SuccessCode(rawValue: SuccessStatusCode) else {return}
//                completion(.success(successCode))
                
            case .failure:
//                print(error2.localizedDescription)
                let statusCode = response.response?.statusCode ?? 500
                guard let error = NoticeError(rawValue: statusCode) else {return}
                completion(.failure(error))
                
            }
        }
    }
}
