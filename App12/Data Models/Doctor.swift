//
//  Doctor.swift
//  App12
//
//  Created by Jeff Wang on 6/20/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Doctor: Codable{
    @DocumentID var id: String?
    var name: String
    var email: String
    var phone: Int
    var specialty: Int
    
    init(name: String, email: String, phone: Int, specialty: Int) {
        self.name = name
        self.email = email
        self.phone = phone
        self.specialty = specialty
    }
}
