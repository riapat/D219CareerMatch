//
//  VolunteerViewCell.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 3/25/22.
//

import SwiftUI

struct VolunteerViewCell: View {
    @EnvironmentObject var volData: VolunteerData
    @State var num : Int
    var body: some View {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .size(width: width - 30, height: 70)
                .fill(Color.init(red: 231 / 255, green: 238 / 255, blue: 249 / 255))
//                .shadow(color: Color.init(red: 209 / 255, green: 209 / 255, blue: 209 / 255), radius: 5)
            
            HStack() {
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(volData.volunteer_opps[num].title)
                        .font(.body)
                        .bold()
                        .lineLimit(2)
                        
                        
                    Text(volData.volunteer_opps[num].name)
                        .fontWeight(.regular)
                        .italic()
                        .font(.caption)
                        
                        
                }
                .padding(.trailing)
                .padding(.leading)
                
                Spacer()
                
                
                    
                       
                Image(systemName: volData.volunteer_opps[num].isFavorite ? "bookmark.fill" : "bookmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .clipped()
                    .foregroundColor(Color.blue)
                    .padding(.trailing)
                        
                
                
                
            }
            
        }
        .frame(width: width - 30, height: 70)
    }
}

struct VolunteerViewCell_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerViewCell(num: 0)
            .environmentObject(VolunteerData())
        .previewLayout(.device)
    }
}
