//
//  Symptom.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/25/23.
//

import Foundation

struct Symptom:Decodable, Encodable{
    var name:String
    var intensity:String
    var timeStart:Date
    var timeFrame:String
    var duration: String

    init(name: String, intensity: String, timeStart: Date, timeFrame: String, duration: String) {
        self.name = name
        self.intensity = intensity
        self.timeStart = timeStart
        self.timeFrame = timeFrame
        self.duration = duration
    }
}
