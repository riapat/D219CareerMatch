//
//  JobBoardRow.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 1/30/22.
//

import SwiftUI

struct JobBoardRow: View {
    @State var career: Career
    let images: [String] = ["dollarsign.circle.fill","case.fill","person.circle.fill","clock.arrow.2.circlepath","timelapse","calendar.circle.fill","clock.circle.fill"]
    
    
    var body: some View {
        let data : [String] = ["$" + String(format: "%.2f", Double(career.hourly_pay)),String(career.type),String(career.min_age) + "+ yrs",String(career.job_time),String(career.job_year), String(career.work_days) + " days",String(career.work_hours) + " hrs"]
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<6) { i in
                    ZStack(alignment: .center) {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color.init(red: 100 / 255, green: 114 / 255, blue: 138 / 255))
                            .frame(width: 120, height: 120)
                        VStack(alignment: .center, spacing: 0) {
                            Image(systemName: images[i])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 40)
                                .foregroundColor(Color.white)
                                .padding(.bottom, 9)
                                
                            Text(data[i])
                                .foregroundColor(Color.white)
                                .font(.headline)
                                .lineLimit(2)
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .lineLimit(3)
                            
                                
                        
                        }.frame(width: 120, height: 120, alignment: .center)

                    }.padding(.init(top: 0, leading: 3, bottom: 0, trailing: 3))
                }
            }
            
            
            
        }
        .frame(height:130)
//        reformat the words
    }
}

struct JobBoardRow_Previews: PreviewProvider {
    
    static var previews: some View {
        JobBoardRow(career: Career())
    }
}
