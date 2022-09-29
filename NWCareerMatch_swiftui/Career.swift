//
//  NWCareerMatch.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 11/13/21.
//

import Foundation
import SwiftUI


struct Career: Hashable, Codable, Identifiable {
    static var nextId: Int = 0
    var timestamp: String
    var id: Int
    var name: String
    var address: String
    var website: String
    var description: String
    var contact_name: String
    var contact_email: String
    var contact_phone: String
    var title: String
    var type: String
    var responsibilities: String
    var candidate_qualities: String
    var min_age: Int
    var job_time: String
    var work_days: Int
    var work_hours: Int
    var hourly_pay: Int
    var application_type: String
    var additional: String
    var isFavorite: Bool = false
    var job_year: String
    var validated: Bool = false
    
    init() {
        id = Career.nextId
        Career.nextId+=1
        
        name = ""
        address = ""
        website = ""
        description = ""
        contact_name = ""
        contact_email = ""
        contact_phone = ""
        title = ""
        type = ""
        responsibilities = ""
        candidate_qualities = ""
        min_age = 0
        job_time = ""
        work_days = 0
        work_hours = 0
        hourly_pay = 0
        application_type = ""
        additional = ""
        timestamp = ""
        job_year = ""
        validated = false
      
    }
    
    init(array: [String]) {
       
        
        id = Career.nextId
        Career.nextId+=1
        
        name = array[0]
        address = array[1]
        website = array[2]
        description = array[3]
        contact_name = array[4]
        contact_email = array[5]
        contact_phone = array[6]
        title = array[7]
        type = array[8]
        responsibilities = array[9]
        candidate_qualities = array[10]
        min_age = Int(array[11])!
        job_time = array[12]
        work_days = Int(array[13])!
        work_hours = Int(array[14])!
        hourly_pay = Int(array[15])!
        application_type = array[16]
        additional = array[17]
        timestamp = array[18]
        job_year = array[19]
        validated = array[20] == "TRUE" ? true:false
        
        print(id)
    }
    
}




