//
//  Medication.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/24/23.
//

import Foundation

struct Medication:Decodable {
    var name:String
    var schedule:String?
    var refill:Date?
    
    init(name: String, schedule sched: String?, refill ref: Date?) {
        self.name = name
        if let schedule = sched {
            self.schedule = schedule
        }
        if let refill = ref {
            self.refill = refill
        }
    }
}
