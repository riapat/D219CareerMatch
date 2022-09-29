//
//  ModelData.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 11/15/21.
//

import Foundation
import SwiftCSV
import SwiftUI

final class ModelData: ObservableObject {
    
    @Published var careers: [Career] = loadCSV()

//    published = it is a value that changes, so it needs to keep checking the variable's value when running program. data published that is updating
    
    
    

    
    
}

func loadCSV() -> [Career] {
    let defaultFav = UserDefaults.standard
    var favorites : [String] = []
    if let favs = defaultFav.array(forKey: "favs") as? [String]
    {
        favorites = favs
    }
    
    
    
    
    let url = URL(string: "https://docs.google.com/spreadsheets/d/e/2PACX-1vQMCo-G2TIxhFD_BEwckLNM4oVQ1pxd_JBLrH-a34gLm0Q6uGg6-HX3RuXaSFGLHts7MTEC6CpfPy5P/pub?output=csv")!
    
    var array: [Career] = []
    
    let arrayString: [String] = ["Name of the business/organization?","Address of the business/organization?","Website of the business/organization?","Briefly tell us about your business/organization (e.g., products, services, etc.)?","Business/Organization Contact's Name","Business/organization Contact's Email?","Business/organization Contact's Phone Number?","Job title?", "What is the job type?","Job responsibilities/duties?","Qualities/skills candidate should possess for the job?","Minimum age requirement for the job?","Is the job part-time or full-time?","Typical number of work days per week?","Typical number of work hours each day?","Hourly pay?","How to apply for the job and to whom if applicable (e.g., send resume or letter of interest, link to online application, apply in-person, phone)?","Additional Comments?", "Timestamp", "Is the job year-round or seasonal?","validated?"]
   
    
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
            
            var career = Career(array: list)
            for item in favorites {
                if (item == career.timestamp) { career.isFavorite = true}
            }
//            career.timestamp
//            career.isFavorite = true
//            loop through favorites and see if timestamp is in it, if so then change isFav to true
            if (career.validated) {
                array.append(career)
            }
            
            
        }
        
    } catch {
        
        // Catch errors from trying to load files
    }

    
    //task.resume()
    
    return array
}

func query(url: URL) -> String {

    let semaphore = DispatchSemaphore(value: 0)
    
    var result: String = ""
    
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        result = String(data: data!, encoding: String.Encoding.utf8)!
        semaphore.signal()
    }
    
    task.resume()
    semaphore.wait()
    
    return result
}
