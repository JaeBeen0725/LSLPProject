//
//  Codable.swift
//  LSLPProject
//
//  Created by Jae Oh on 11/27/23.
//

import Foundation

struct SignUP: Decodable {
    let email, nick: String
}

struct ValdationEmail: Decodable {
    let message: String
}

