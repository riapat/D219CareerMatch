//
//  Filter.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 11/13/21.
//

import SwiftUI

struct Filter: View {
//    @Binding var showFilter: Bool
    @State private var minAgeCha: Bool = false
    @State private var dayCha: Bool = false
    @State private var hoursCha: Bool = false
    @State private var hourlyCha: Bool = false
    var showFavoritesOnly : Binding<Bool>
    var showPartTime: Binding<String>
    var jobYear: Binding<String>
    var carType: Binding<String>
    var minAge: Binding<Double>
    var daysPerWeek: Binding<Double>
    var hoursDay: Binding<Double>
    var hourPay: Binding<Double>
    @Environment(\.presentationMode) var presentationMode


    
    var body: some View {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
//        Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255)
        VStack {
            ScrollView {
                VStack {
                    Text("FILTER")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255))
                        .tracking(2)
                        .padding(.top, 20.0)
                        .padding(.bottom, height - (height - 10))
                    Button(action : {
                        showFavoritesOnly.wrappedValue.toggle()
                    }) {
                        Text("Show Favorited")
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(showFavoritesOnly.wrappedValue ? Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255) : Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255))
                            
                            .padding(10)
                            .padding([.leading,.trailing], width - (width - 90))
                            .background(showFavoritesOnly.wrappedValue ? Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255) : Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255))
//                        .foregroundColor(modelData.careers[idC].isFavorite ? Color.blue : Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    HStack(spacing: -15) {
                        Button(action : {
                            let isPartTime : Bool = showPartTime.wrappedValue.contains("Part-Time")
                            let isFullTime: Bool = showPartTime.wrappedValue.contains("Full-Time")
                            if isPartTime && isFullTime{
                                showPartTime.wrappedValue = "Full-Time"
                            } else if isPartTime{
                                
                            } else if isFullTime{
                                showPartTime.wrappedValue = "Part-TimeFull-Time"
                            }
                        }) {
                            Text("Part-Time")
                                .font(.headline)
                                .fontWeight(.medium)
                                .foregroundColor( (showPartTime.wrappedValue.contains("Part-Time")) ? Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255) : Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255))
                                
                                .padding(10)
                                .padding([.leading,.trailing], width - (width - 33))
                                .background((showPartTime.wrappedValue.contains("Part-Time")) ? Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255) : Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255))
                            .cornerRadius(10)
                            .padding([.top, .leading, .bottom])
                            
                        }
                        Button(action : {
                            let isPartTime : Bool = showPartTime.wrappedValue.contains("Part-Time")
                            let isFullTime: Bool = showPartTime.wrappedValue.contains("Full-Time")
                            if isPartTime && isFullTime{
                                showPartTime.wrappedValue = "Part-Time"
                            } else if isFullTime{
                                
                            } else if isPartTime{
                                showPartTime.wrappedValue = "Part-TimeFull-Time"
                            }
                        }) {
                            Text("Full-Time")
                                .font(.headline)
                                .fontWeight(.medium)
                                .foregroundColor( (showPartTime.wrappedValue.contains("Full-Time")) ? Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255) : Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255))
                                
                                .padding(10)
                                .padding([.leading,.trailing], width - (width - 33))
                                .background((showPartTime.wrappedValue.contains("Full-Time")) ? Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255) : Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255))
                            .cornerRadius(10)
                            .padding([.top, .trailing, .bottom])
                            
                            
                        }
                    }
                    HStack(spacing: -24) {
                        Button(action : {
                            let isSeasonal : Bool = jobYear.wrappedValue.contains("Seasonal")
                            let isYearRound: Bool = jobYear.wrappedValue.contains("Year-Round")
                            if isSeasonal && isYearRound{
                                jobYear.wrappedValue = "Year-Round"
                            } else if isSeasonal{
                                
                            } else if isYearRound{
                                jobYear.wrappedValue = "Year-RoundSeasonal"
                            }
                        }) {
                            Text("Seasonal")
                                .font(.headline)
                                .fontWeight(.medium)
                                .foregroundColor( (jobYear.wrappedValue.contains("Seasonal")) ? Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255) : Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255))
                                
                                .padding(10)
                                .padding([.leading,.trailing], width - (width - 30))
                                .background((jobYear.wrappedValue.contains("Seasonal")) ? Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255) : Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255))
                            .cornerRadius(10)
                            .padding([.leading, .bottom])
                            
                        }
                        Button(action : {
                            let isSeasonal : Bool = jobYear.wrappedValue.contains("Seasonal")
                            let isYearRound: Bool = jobYear.wrappedValue.contains("Year-Round")
                            if isSeasonal && isYearRound{
                                jobYear.wrappedValue = "Seasonal"
                            } else if isYearRound{
                                
                            } else if isSeasonal{
                                jobYear.wrappedValue = "Year-RoundSeasonal"
                            }
                        }) {
                            Text("Year-Round")
                                .font(.headline)
                                .fontWeight(.medium)
                                .foregroundColor( (jobYear.wrappedValue.contains("Year-Round")) ? Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255) : Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255))
                                
                                .padding(10)
                                .padding([.leading,.trailing], width - (width - 30))
                                .background((jobYear.wrappedValue.contains("Year-Round")) ? Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255) : Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255))
                            .cornerRadius(10)
                            .padding([.bottom, .trailing])
                            
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Job Type")
                            .fontWeight(.medium)
                            .padding([.leading,.bottom], 15)
                            
                            
                        let rows: [GridItem] =
                        Array(repeating: .init(.flexible(), spacing: 40), count: 3)
                        let job_options = ["Paid Hourly Employee", "Paid Internship", "Unpaid Internship", "Paid Apprenticeship", "Unpaid Apprenticeship"]
                       

                        LazyHGrid.init(rows: rows, alignment: .center) {
                            ForEach(job_options, id: \.self) { job_option in
                                Button(action: {
                                   carType.wrappedValue = job_option

                                }) {
    //                            how do you select more than one tag element
                                    Text(job_option)
                                        .font(.headline)
                                        .foregroundColor((carType.wrappedValue == job_option) ? Color(red: 215 / 255, green: 230 / 255, blue: 254 / 255) : Color(.blue))
                                        .fontWeight(.medium)
                                        .padding(11.0)

                                        .background((carType.wrappedValue == job_option) ? Color(.blue) : Color(red: 215 / 255, green: 230 / 255, blue: 254 / 255))

                                    .cornerRadius(40)

                                }
            //                    how do you set margins horizontal for grid.

                            }

                        }
                        .padding(9.0)
                        
                        
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Group {
                            Text("Your Age: \(minAge.wrappedValue, specifier: "%.0f")")
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                                .padding(.top, 15.0)
                                .padding(.leading, 15)
                            
                            Slider(value: minAge, in: 13.0...19.0,
                                onEditingChanged: { editing in
                                    minAgeCha = editing
                                    
                                }
                            )
                                .padding(.horizontal, 10.0)
                            
                        }
                        Group {
                            Text("Days A Week: \(daysPerWeek.wrappedValue, specifier: "%.0f")")
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                                .padding(.top, 15)
                                .padding(.leading, 15)
                            
                            Slider(value: daysPerWeek, in: 0.0...7.0,
                                onEditingChanged: { editing in
                                    dayCha = editing
                                }
                            )
                                .padding(.horizontal, 10.0)
                        }
                        Group {
                            Text("Hours A Day: \(hoursDay.wrappedValue, specifier: "%.0f")")
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                                .padding(.top, 15)
                                .padding(.leading, 15)
                            
                            Slider(value: hoursDay, in: 0.0...10.0,
                                onEditingChanged: { editing in
                                    hoursCha = editing
                                }
                            )
                                .padding(.horizontal, 10.0)
                        }
                        Group {
                            Text("Hourly Wage: \(hourPay.wrappedValue, specifier: "%.0f")")
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                                .padding(.top, 15)
                                .padding(.leading, 15)
                            
                            Slider(value: hourPay, in: 0.0...50.0,
                                onEditingChanged: { editing in
                                    hourlyCha = editing
                                }
                            )
                                .padding(.horizontal, 10.0)
                                .padding(.bottom, 10)
                        }
                        
                    }
                    

                }
                Button(action: {
                    presentationMode.wrappedValue.dismiss()

                }) {
                    Text("APPLY")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .padding(10)
                    .background(Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255))
                    
                    .cornerRadius(40)
                    .padding(.all, 6)
                    .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(red: 239 / 255, green: 131 / 255, blue: 84 / 255), lineWidth: 5))
                }
            }
            
            
        }
        
        
        
            
        
        
    }
}

struct Filter_Previews: PreviewProvider {
    
    static var previews: some View {
        Filter(showFavoritesOnly: .constant(false), showPartTime: .constant(""), jobYear: .constant(""), carType: .constant(""), minAge: .constant(16.0), daysPerWeek: .constant(3.0), hoursDay: .constant(15.0), hourPay: .constant(15.0))
    }
}
