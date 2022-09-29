//
//  SupportMail.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 7/22/22.
//

import Foundation
import SwiftUI

struct SupportMail{
    var fN: String
    var lN: String
    var msg: String
    let fromAddress: String
    let toAddress: String
    let subject: String
    var body: String { """
        First Name: \(fN)
        Last Name: \(lN)
        Preferred Email: \(fromAddress)
        --------------------------------
        Message:
        \(msg)
    """
    }
    
    func send(openURL: OpenURLAction) {
        let urlString = "mailto:\(toAddress)?subject=\(subject.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")&body=\(body.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")"
        guard let url = URL(string: urlString) else { return }
        openURL(url) { accepted in
            if !accepted {
                print(
                    """
                    This device does not support email.
                    \(body)
                    """
                )
            }
        }
    }
}
