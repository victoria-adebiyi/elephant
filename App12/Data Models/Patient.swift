//
//  Patient.swift
//  App12
//
//  Created by Jeff Wang on 6/20/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Patient: Codable{
    @DocumentID var id: String?
    var name: String
    var email: String
    var phone: Int
    var age: Int
    
    init(name: String, email: String, phone: Int, age: Int) {
        self.name = name
        self.email = email
        self.phone = phone
        self.age = age
    }
}
