//
//  VolunteerDetail.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 3/18/22.
//

import SwiftUI

struct VolunteerDetail: View {
    @State var num: Int
    @EnvironmentObject var voldata: VolunteerData
    @State private var isSelect: Bool = false
    
    var body: some View {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        
        let responsibilities : [String] = voldata.volunteer_opps[num].responsibilities.components(separatedBy: ". ")
        
        let qualites : [String] = voldata.volunteer_opps[num].candidate_qualities.components(separatedBy: ". ")
        
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center) {
                Text(voldata.volunteer_opps[num].name)
                    .font(.title3)
                    .italic()
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                
                Text(voldata.volunteer_opps[num].title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.bottom,5)
                
                
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                    Text(voldata.volunteer_opps[num].address)
                    Button(action: {

                        voldata.volunteer_opps[num].isFavorite = !voldata.volunteer_opps[num].isFavorite
                        var faVVorites : [String] = []
                        if let faVVs = UserDefaults.standard.stringArray(forKey: "faVVs") {
                            faVVorites = faVVs
                        }
                        
                        if (voldata.volunteer_opps[num].isFavorite) {
                            
                            if let _ = faVVorites.firstIndex(of: voldata.volunteer_opps[num].timestamp) {
                                
                            } else {
                                faVVorites.append(voldata.volunteer_opps[num].timestamp)
                            }
                        } else {
                            if let indexV = faVVorites.firstIndex(of: voldata.volunteer_opps[num].timestamp) {
                                faVVorites.remove(at: indexV)
                            }
                        }
//
                        UserDefaults.standard.set(faVVorites, forKey: "faVVs")
                        UserDefaults.standard.synchronize()
                        
                    }) {
                        Image(systemName: voldata.volunteer_opps[num].isFavorite ?  "bookmark.fill" : "bookmark")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .clipped()
                            .foregroundColor(voldata.volunteer_opps[num].isFavorite ? Color.blue : Color.blue)

                    }
                }
                
                .padding(5)
                
                VolunteerBoardRow(volunteer: voldata.volunteer_opps[num])
                    .padding(.top, 10)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(Color.init(red: 255 / 255, green: 185 / 255, blue: 154 / 255))
                    VStack {
                        Text("WHEN")
                            .foregroundColor(Color.init(red: 52 / 255, green: 29 / 255, blue: 19 / 255))                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .padding(.top, 10)
                            .padding(.bottom, 1)
                        

                        
                        Text(voldata.volunteer_opps[num].when)
                            .foregroundColor(Color.init(red: 52 / 255, green: 29 / 255, blue: 19 / 255))                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .padding(.bottom, 10)
                            .frame(width: width - 50, alignment: .leading)
                            
                            
                    }
                    
                }
                .frame(width: width - 25, alignment: .leading)
                .padding(.top, 20)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(Color.init(red: 255 / 255, green: 185 / 255, blue: 154 / 255))
                    VStack {
                        Text("DESCRIPTION")
                            .foregroundColor(Color.init(red: 52 / 255, green: 29 / 255, blue: 19 / 255))
                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .padding(.top, 10)
                            .padding(.bottom, 1)
                        
                        Text(voldata.volunteer_opps[num].description)
                            .foregroundColor(Color.init(red: 52 / 255, green: 29 / 255, blue: 19 / 255))
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .padding(.bottom, 10)
                    }
                    
                }
                .frame(width: width - 25, alignment: .leading)
                .padding(.top, 10)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .foregroundColor(Color.init(red: 255 / 255, green: 185 / 255, blue: 154 / 255))
                    VStack {
                        Text("HOW TO APPLY")
                            .foregroundColor(Color.init(red: 52 / 255, green: 29 / 255, blue: 19 / 255))
                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .padding(.top, 10)
                            .padding(.bottom, 1)
                        Text("Contact Name: \(voldata.volunteer_opps[num].contact_name)\nContact Phone: \(voldata.volunteer_opps[num].contact_phone) \nContact Email: \(voldata.volunteer_opps[num].contact_email)")
                            .foregroundColor(Color.init(red: 52 / 255, green: 29 / 255, blue: 19 / 255))
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            
                            .frame(width: width - 50, alignment: .leading)
                        Text("Website: \(voldata.volunteer_opps[num].website)")
                            .foregroundColor(Color.init(red: 52 / 255, green: 29 / 255, blue: 19 / 255))
                            .font(.body)
                            .fontWeight(.light)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .onTapGesture {
                                UIApplication.shared.open(URL(string:voldata.volunteer_opps[num].website)!, options: [:])
                            }
                        Text("Application Type: \(voldata.volunteer_opps[num].apptype)")
                            .foregroundColor(Color.init(red: 52 / 255, green: 29 / 255, blue: 19 / 255))
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
                        .foregroundColor(Color.init(red: 255 / 255, green: 185 / 255, blue: 154 / 255))
                    VStack {
                        Text("RESPONSIBILITIES")
                            .foregroundColor(Color.init(red: 52 / 255, green: 29 / 255, blue: 19 / 255))
                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .padding(.top, 10)
                            .padding(.bottom, 1)
                       
                        ForEach(responsibilities, id: \.self) {
                                Text("\u{2022}\($0)")
                                .foregroundColor(Color.init(red: 52 / 255, green: 29 / 255, blue: 19 / 255))
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
                        .foregroundColor(Color.init(red: 255 / 255, green: 185 / 255, blue: 154 / 255))
                    VStack {
                        Text("CANDIDATE QUALITIES")
                            .foregroundColor(Color.init(red: 52 / 255, green: 29 / 255, blue: 19 / 255))
                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .padding(.top, 10)
                            .padding(.bottom, 1)
                        
                        ForEach(qualites, id: \.self) {
                                Text("\u{2022}\($0)")
                                .foregroundColor(Color.init(red: 52 / 255, green: 29 / 255, blue: 19 / 255))
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
                        .foregroundColor(Color.init(red: 255 / 255, green: 185 / 255, blue: 154 / 255))
                    VStack {
                        Text("ADDITIONAL COMMENTS")
                            .foregroundColor(Color.init(red: 52 / 255, green: 29 / 255, blue: 19 / 255))                            .font(.title3)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                            .frame(width: width - 50, alignment: .leading)
                            .padding(.top, 10)
                            .padding(.bottom, 1)
                        

                        
                        Text(voldata.volunteer_opps[num].additional)
                            .foregroundColor(Color.init(red: 52 / 255, green: 29 / 255, blue: 19 / 255))                            .font(.body)
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

struct VolunteerDetail_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerDetail(num: 0)
            .environmentObject(VolunteerData())
            
    }
}
