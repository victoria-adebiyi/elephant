//
//  PatientsList.swift
//  App12
//
//  Created by Eden Gugsa on 6/25/23.
//

import Foundation

struct PatientsList:Decodable, Encodable{
    var email:String
    
    init(email: String) {
        self.email = email
    }
}
