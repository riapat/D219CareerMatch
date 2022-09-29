//
//  TableViewCell.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 11/12/21.
//

import SwiftUI

struct TableViewCell: View {
    @EnvironmentObject var modelData: ModelData
    @State var idC : Int
    
    /*var careerIndex: Int {
        ModelData().careers.firstIndex(where: { $0.id == career.id})!
    }*/
    
    
    var body: some View {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        
        
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .size(width: width - 30, height: 85)
                .fill(Color.init(red: 255 / 255, green: 248 / 255, blue: 245 / 255))
//                .shadow(color: Color.init(red: 209 / 255, green: 209 / 255, blue: 209 / 255), radius: 5)
            
            HStack() {
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(modelData.careers[idC].title)
                        .font(.body)
                        .bold()
                        .lineLimit(2)
                        
                        
                    Text(modelData.careers[idC].name)
                        .fontWeight(.regular)
                        .italic()
                        .font(.caption)
                        
                        
                }
                .padding(.trailing)
                .padding(.leading)
                
                Spacer()
                
                VStack {
                    
                       
                    Image(systemName: modelData.careers[idC].isFavorite ? "bookmark.fill" : "bookmark")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .clipped()
                        .foregroundColor(Color.blue)
                            
                            
                            
                        
                    
                    
                    .padding(5)
                    
                    Text("$" + String(format: "%.2f",Double(modelData.careers[idC].hourly_pay)))
                        .font(.body)
                }
                .padding(.trailing)
                
                
            }
            
        }
        .frame(width: width - 30, height: 85)
        
        
        
        

    }
}

struct TableViewCell_Previews: PreviewProvider {
    
    
    static var previews: some View {
        TableViewCell(idC: 0)
            .environmentObject(ModelData())
        .previewLayout(.device)
    }
}
