//
//  VolunteerData.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 3/12/22.
//

import Foundation
import SwiftCSV
import SwiftUI

final class VolunteerData: ObservableObject {
    
    @Published var volunteer_opps: [Volunteer] = loadCSVForVolunteer()
   
//    published = it is a value that changes, so it needs to keep checking the variable's value when running program. data published that is updating
    
    
}

func loadCSVForVolunteer() -> [Volunteer] {
    let defaultFaVs = UserDefaults.standard
    var faVVorites : [String] = []
    if let faVVs = defaultFaVs.array(forKey: "faVVs") as? [String]
    {
        faVVorites = faVVs
    }
    
    
    
    
    let url = URL(string: "https://docs.google.com/spreadsheets/d/e/2PACX-1vQpwg6KANqdeuQ2yUYhmP-Q7vqOmEnogW__tTNkBjuunfsYeFEuv7-rPBmBPHzRqeIcixVnrHB2htut/pub?output=csv")!
    
    var array: [Volunteer] = []
    
    let arrayString: [String] = ["Name of the business/organization?","Address of the business/organization?","Website of the business/organization?","Briefly tell us about your business/organization (e.g., products, services, etc.)?","Business/Organization Contact's Name","Business/organization Contact's Email?","Business/organization Contact's Phone Number?","Volunteer Opportunity Title", "What is the volunteer opportunity type?","Volunteer's responsibilities/duties?","Qualities/skills volunteer should possess?","Minimum age requirement for the volunteer event?","When?","How can the student apply to volunteer?","Additional Comments?", "Timestamp","validated?"]
   
    
    let string = query(url: url)
    
    do {
        let csv: CSV = try CSV(string: string)
      
        try csv.enumerateAsDict { dict in
            var list : [String] = []
            for (row) in arrayString {
                
                if dict[row] == "" || dict[row] == " "{
                    list.append("N/A")
                } else {
                    list.append(dict[row]!)
                }
                
                
//                            goes in order from one to the next --> 0-18 index range for one submission --> use this for object creation
            }
            
            var volunteer = Volunteer(array: list)
            for item in faVVorites {
                if (item == volunteer.timestamp) { volunteer.isFavorite = true}
            }
//            career.timestamp
//            career.isFavorite = true
//            loop through favorites and see if timestamp is in it, if so then change isFav to true
            if (volunteer.validated) {
                array.append(volunteer)
            }
            
            
        }
        
    } catch {
        
        // Catch errors from trying to load files
    }

    
    //task.resume()
    
    return array
}

func query(urlV: URL) -> String {

    let semaphore = DispatchSemaphore(value: 0)
    
    var result: String = ""
    
    let task = URLSession.shared.dataTask(with: urlV) {(data, response, error) in
        result = String(data: data!, encoding: String.Encoding.utf8)!
        semaphore.signal()
    }
    
    task.resume()
    semaphore.wait()
    
    return result
}



