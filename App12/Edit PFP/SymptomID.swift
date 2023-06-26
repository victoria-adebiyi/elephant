//
//  SymptomID.swift
//  App12
//
//  Created by Victoria Adebiyi on 6/25/23.
//

import Foundation

class SymptomID {
    static func generateUniqueID (from symptom: Symptom) -> String{
        var str = ""
        str += symptom.name
        str += symptom.duration
        str += symptom.intensity
        str += symptom.timeFrame
        str += symptom.timeStart.description
        print(str)
        return "\(str.hash)"
    }
}
