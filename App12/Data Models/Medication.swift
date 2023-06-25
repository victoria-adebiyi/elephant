//
//  Medication.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/24/23.
//

import Foundation

struct Medication:Decodable, Encodable{
    var name:String
    var schedule:String?
    var refill:String?
    
    init(name: String, schedule: String, refill: String) {
        self.name = name
        self.schedule = schedule
        self.refill = refill
    }
}
