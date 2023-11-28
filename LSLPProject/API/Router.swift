//
//  Router.swift
//  LSLPProject
//
//  Created by Jae Oh on 11/27/23.
//

import Foundation
import Alamofire


enum Router: URLRequestConvertible {
    case validationEmail(email: String)
//    case password(password: String)
//    case nick(nick: String)
    case join(email: String, password: String, nick: String)
  
    
    
    private var baseURL: URL {
        return URL(string: Key.baseURL)!
    }
    
    
   private var path: String {
       switch self {
       case .validationEmail:
           return "/validation/email"
       case .join(_, _, _):
           return "/join"
       }
       
    
       
    }
    
    
    var header: HTTPHeaders {
        return ["Content-Type": "application/json", "SesacKey": "\(Key.seSACKey)"]
    }
    
    
   private var method: HTTPMethod {
       return .post
    }
    
    
    var query: [String: String]? {
        
        switch self {
   
        case .validationEmail(let email):
            return ["email" : "\(email)"]
            
        case .join(let email, let password, let nick):
            return [
                "email" : "\(email)",
                "password" : "\(password)",
                "nick" : "\(nick)"
            ]

        }
        
//        switch self {
//        case .email(let email):
//            return ["email":"\(email)"]
//        case .password(let password):
//            return ["password":"\(password)"]
//        case .nick(let nick):
//            return ["nick":"\(nick)"]
//        }
    }

    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.headers = header
        request.method = method
        print("request - \(request)")
//
//        request = try URLEncodedFormParameterEncoder(destination: .methodDependent).encode(body, into: request)
        request = try JSONParameterEncoder(encoder: JSONEncoder()).encode(query, into: request)
        return request
    }
}
