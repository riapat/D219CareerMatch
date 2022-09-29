//
//  JobDetail.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 1/30/22.
//

import SwiftUI

struct JobDetail: View {
    @State var idC: Int
    @EnvironmentObject var modelData: ModelData

    @State private var isSelected: Bool = false
    

    var body: some View {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        
        let responsibilities : [String] = modelData.careers[idC].responsibilities.components(separatedBy: ", ")
        
        let qualites : [String] = modelData.careers[idC].candidate_qualities.components(separatedBy: ", ")
        
        
        
        ScrollView(.vertical, showsIndicators: false) {
            
//
            
            
            VStack {
                
                Text(modelData.careers[idC].name)
                    .font(.title3)
                    .italic()
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                    
                
                Text(modelData.careers[idC].title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,5)
                
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text(modelData.careers[idC].address)
                    
                    Button(action: {
                        
                        modelData.careers[idC].isFavorite = !modelData.careers[idC].isFavorite
                        
                        var favorites :[String] = []
                        if let favs = UserDefaults.standard.stringArray(forKey: "favs") {
                            favorites = favs
                        }
                        
                        if (modelData.careers[idC].isFavorite) {
                                                       
                            if let _ = favorites.firstIndex(of: modelData.careers[idC].timestamp) {
                                
                            } else {
                                favorites.append(modelData.careers[idC].timestamp)
                            }
                        } else {
                            if let index = favorites.firstIndex(of: modelData.careers[idC].timestamp) {
                                favorites.remove(at: index)
                            }
                        }
                        
                        UserDefaults.standard.set(favorites, forKey: "favs")
                        UserDefaults.standard.synchronize()
                        
                    }) {
                            
                        Image(systemName: modelData.careers[idC].isFavorite ? "bookmark.fill" : "bookmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .clipped()
                            .foregroundColor(modelData.careers[idC].isFavorite ? Color.blue : Color.blue)
                            
                            
                            
                        
                    }
                    
                    .padding(5)
                }
                
                
                
                
                JobBoardRow(career: modelData.careers[idC])
                    .padding(.leading,10)
                
                
                            
                    
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(Color.init(red: 45 / 255, green: 49 / 255, blue: 66 / 255))
                    VStack {
                        Text("DESCRIPTION")
                            .foregroundColor(Color.white)
                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .padding(.top, 10)
                            .padding(.bottom, 1)
                        
                        Text(modelData.careers[idC].description)
                            .foregroundColor(Color.white)
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .padding(.bottom, 10)
                    }
                    
                }
                .frame(width: width - 25, alignment: .leading)
                .padding(.top, 30)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(Color.init(red: 45 / 255, green: 49 / 255, blue: 66 / 255))
                    VStack {
                        Text("HOW TO APPLY")
                            .foregroundColor(Color.white)
                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .padding(.top, 10)
                            .padding(.bottom, 1)
                        Text("Contact Name: \(modelData.careers[idC].contact_name)\nContact Phone: \(modelData.careers[idC].contact_phone)\nContact Email: \(modelData.careers[idC].contact_email)")
                            .foregroundColor(Color.white)
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            
                            .frame(width: width - 50, alignment: .leading)
                        Text("Website: \(modelData.careers[idC].website)")
                            .foregroundColor(Color.white)
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .onTapGesture {
                                UIApplication.shared.open(URL(string:modelData.careers[idC].website)!, options: [:])
                            }
                        Text("Application Type: \(modelData.careers[idC].application_type)")
                            .foregroundColor(Color.white)
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 10)
                            .frame(width: width - 50, alignment: .leading)
                            
                            
                    }
                }
                .frame(width: width - 25, alignment: .leading)
                .padding(.top, 10)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(Color.init(red: 45 / 255, green: 49 / 255, blue: 66 / 255))
                    VStack {
                        Text("RESPONSIBILITIES")
                            .foregroundColor(Color.white)
                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .padding(.top, 10)
                            .padding(.bottom, 1)
                        
//                        ForEach(item) in responsibilities {
//                            Text(item)
//                                .foregroundColor(Color.white)
//                        }
                        ForEach(responsibilities, id: \.self) {
                                Text("\u{2022}\($0)")
                                .foregroundColor(Color.white)
                                .font(.body)
                                .fontWeight(.light)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 10)
                                .frame(width: width - 50, alignment: .leading)
                            }
                            
                    }
                    
                }
                .frame(width: width - 25, alignment: .leading)
                .padding(.top, 10)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(Color.init(red: 45 / 255, green: 49 / 255, blue: 66 / 255))
                    VStack {
                        Text("CANDIDATE QUALITIES")
                            .foregroundColor(Color.white)
                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .padding(.top, 10)
                            .padding(.bottom, 1)
                        
//                        ForEach(item) in responsibilities {
//                            Text(item)
//                                .foregroundColor(Color.white)
//                        }
                        ForEach(qualites, id: \.self) {
                                Text("\u{2022}\($0)")
                                .foregroundColor(Color.white)
                                .font(.body)
                                .fontWeight(.light)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 10)
                                .frame(width: width - 50, alignment: .leading)
                            }
                            
                    }
                    
                }
                .frame(width: width - 25, alignment: .leading)
                .padding(.top, 10)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(Color.init(red: 45 / 255, green: 49 / 255, blue: 66 / 255))
                    VStack {
                        Text("ADDITIONAL COMMENTS")
                            .foregroundColor(Color.white)
                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .padding(.top, 10)
                            .padding(.bottom, 1)
                        

                        
                        Text(modelData.careers[idC].additional)
                            .foregroundColor(Color.white)
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 10)
                            .frame(width: width - 50, alignment: .leading)
                            
                            
                    }
                    
                }
                .frame(width: width - 25, alignment: .leading)
                .padding(.top, 10)
            }
            
            
        }
        


    }
}

struct JobDetail_Previews: PreviewProvider {
    static let modelData = ModelData()

    static var previews: some View {
        JobDetail(idC: 0)
            .environmentObject(ModelData())
    }
}
