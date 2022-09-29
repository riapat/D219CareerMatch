//
//  VolunteerBoardRow.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 3/14/22.
//

import SwiftUI

struct VolunteerBoardRow: View {
    @State var volunteer: Volunteer
    let images: [String] = ["calendar.badge.clock","person.circle.fill"]
    var body: some View {
        let dataVol: [String] = [String(volunteer.type), String(volunteer.min_age) + "+ yrs"]
        
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        
        HStack {
                
                ForEach(0..<2) { i in
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255))
                            .frame(width: width/2.2, height: 100)
                        VStack(alignment: .center, spacing: 0) {
                            Image(systemName: images[i])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 30)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 11)
                                
                            Text(dataVol[i])
                                .foregroundColor(Color.white)
                                .font(.title3)
                                .multilineTextAlignment(.center)
                                
                            
                                
                        
                        }

                    }.padding(.init(top: 0, leading: 5, bottom: 0, trailing: 3))
                }
                
            }
        .frame(height:100)
        
    }
}

struct VolunteerBoardRow_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerBoardRow(volunteer: Volunteer())
    }
}
