//
//  UserStats.swift
//  RecSuitmedia
//
//  Created by PUTRI RAHMADEWI on 06/06/22.
//

import Foundation

struct User1: Codable{
    let page: Int
    let total: Int
    let data: [userdata1]
}

struct userdata1: Codable{
    
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
    
}








