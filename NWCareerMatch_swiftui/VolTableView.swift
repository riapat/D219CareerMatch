//
//  VolTableView.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 3/25/22.
//

import SwiftUI

struct VolTableView: View {
    @State private var showingVolFilter = false
    @EnvironmentObject var volData: VolunteerData
    @State private var showFavoritesOnly = false
    @State private var showShortTerm = "Short-TermLong-Term"
    @State private var vol_minage = 19.0
    
    var filteredVolunteers: [Volunteer] {
        volData.volunteer_opps.filter { volunteer in
            (!showFavoritesOnly || volunteer.isFavorite) &&
            showShortTerm.contains(volunteer.type) &&
            Int(vol_minage) >= volunteer.min_age
            
        }
    }
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredVolunteers) { volunteer in
                    
                    NavigationLink(
                        destination:
                            VolunteerDetail(num: volunteer.id)) {
                                VolunteerViewCell(num: volunteer.id)
                            }
                            .padding(.trailing, -32) //hides the arrow
                        
                            

                    
                }
            }.listStyle(.plain)
                .listRowInsets(.init())
            
            .navigationTitle("Volunteer Opportunities")
            
            .toolbar {
                Button(action: {showingVolFilter.toggle()
                    
                }) {
                    Text("Filter")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(Color.init(red: 100 / 255, green: 151 / 255, blue: 240 / 255))
                }
            }
            .sheet(isPresented: $showingVolFilter) {
                FilterVol(showFavoritesOnly: $showFavoritesOnly, showShortTerm: $showShortTerm, minAgeV: $vol_minage)
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct VolTableView_Previews: PreviewProvider {
    static var previews: some View {
        VolTableView()
            .environmentObject(VolunteerData())
    }
}
