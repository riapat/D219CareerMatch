//
//  NWCareerMatch_swiftuiApp.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 11/12/21.
//

import SwiftUI


@main
struct NWCareerMatch_swiftuiApp: App {
    
    @State private var showLaunchView: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                
               
                if showLaunchView {
                    LaunchView(showLaunchView: $showLaunchView)
                        .transition(.move(edge: .leading))
                } else {
                    ContentView()
                        .environmentObject(ModelData())
                        .environmentObject(VolunteerData())
//                        .environmentObject(observed())
                }
                
                
                
            }
            
        }
    }

}


