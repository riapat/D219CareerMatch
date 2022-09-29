//
//  Volunteer.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 3/12/22.
//

import Foundation

struct Volunteer: Hashable, Codable, Identifiable {
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
    var when: String
    var apptype: String
    var additional: String
    var isFavorite: Bool = false
    var validated: Bool = false
    
    init() {
        id = Volunteer.nextId
        Volunteer.nextId+=1
        
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
        min_age = 13
        when = ""
        apptype = ""
        additional = ""
        timestamp = ""
        validated = false
    }
    
    init(array: [String]) {
        id = Volunteer.nextId
        Volunteer.nextId+=1
        
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
        when = array[12]
        apptype = array[13]
        additional = array[14]
        timestamp = array[15]
        validated = array[16] == "TRUE" ? true:false
        
    }
}
