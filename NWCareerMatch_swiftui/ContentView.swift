//
//  ContentView.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 11/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .jobs
    
    enum Tab {
        case jobs
        case volunteers
        case info
    }
    

    var body: some View {
        TabView(selection: $selection) {
//            Binding: reference to that value.
            TableView()
                .tabItem {
                    Label("Jobs", systemImage: "j.circle")
                }
                .tag(Tab.jobs)
// The tag(_:) modifier on each of the views matches one of the possible values that the selection property can take so the TabView can coordinate which view to display when the user makes a selection in the user interface.
            
            VolTableView()
                .tabItem {
                    Label("Volunteering", systemImage:"v.circle")
                }
                .tag(Tab.volunteers)
                
            InfoView()
                .tabItem {
                    Label("Info", systemImage: "info.circle.fill")
                }
                .tag(Tab.info)
            
        }
        
        
        
        
    }

        
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
            .environmentObject(VolunteerData())
//            .environmentObject(observed())
    }
}
