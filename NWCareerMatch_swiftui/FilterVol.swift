//
//  FilterVol.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 3/21/22.
//

import SwiftUI

struct FilterVol: View {
    @State private var minAgeChaV: Bool = false
    var showFavoritesOnly : Binding<Bool>
    var showShortTerm: Binding<String>
    var minAgeV: Binding<Double>
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
        VStack {
            ScrollView {
                VStack {
                    Text("FILTER")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.init(red: 100 / 255, green: 151 / 255, blue: 240 / 255))
                        .tracking(2)
                        .padding(.top, 20.0)
                        .padding(.bottom, height - (height - 10))
                    Button(action : {
                        showFavoritesOnly.wrappedValue.toggle()
                    }) {
                        Text("Show Favorited")
                            .font(.headline)
                            .fontWeight(.medium)
                            .foregroundColor(showFavoritesOnly.wrappedValue ? Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255) : Color(red: 96 / 255, green: 145 / 255, blue: 231 / 255))
                            
                            .padding(10)
                            .padding([.leading,.trailing], width - (width - 90))
                            .background(showFavoritesOnly.wrappedValue ? Color(red: 96 / 255, green: 145 / 255, blue: 231 / 255) : Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255))
//                        .foregroundColor(modelData.careers[idC].isFavorite ? Color.blue : Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    }
                    HStack(spacing: -15) {
                        Button(action : {
                            let isShortTerm : Bool = showShortTerm.wrappedValue.contains("Short-Term")
                            let isLongTerm: Bool = showShortTerm.wrappedValue.contains("Long-Term")
                            if isShortTerm && isLongTerm{
                                showShortTerm.wrappedValue = "Long-Term"
                            } else if isShortTerm{
                                
                            } else if isLongTerm{
                                showShortTerm.wrappedValue = "Short-TermLong-Term"
                            }
                        }) {
                            Text("Short-Term")
                                .font(.headline)
                                .fontWeight(.medium)
                                .foregroundColor( (showShortTerm.wrappedValue.contains("Short-Term")) ? Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255) : Color(red: 96 / 255, green: 145 / 255, blue: 231 / 255))
                                
                                .padding(10)
                                .padding([.leading,.trailing], width - (width - 33))
                                .background((showShortTerm.wrappedValue.contains("Short-Term")) ? Color(red: 96 / 255, green: 145 / 255, blue: 231 / 255) : Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255))
                            .cornerRadius(10)
                            .padding([.top, .leading, .bottom])
                            
                        }
                        Button(action : {
                            let isShortTerm : Bool = showShortTerm.wrappedValue.contains("Short-Term")
                            let isLongTerm: Bool = showShortTerm.wrappedValue.contains("Long-Term")
                            if isShortTerm && isLongTerm{
                                showShortTerm.wrappedValue = "Short-Term"
                            } else if isLongTerm{
                                
                            } else if isShortTerm{
                                showShortTerm.wrappedValue = "Short-TermLong-Term"
                            }
                        }) {
                            Text("Long-Term")
                                .font(.headline)
                                .fontWeight(.medium)
                                .foregroundColor( (showShortTerm.wrappedValue.contains("Long-Term")) ? Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255) : Color(red: 96 / 255, green: 145 / 255, blue: 231 / 255))
                                
                                .padding(10)
                                .padding([.leading,.trailing], width - (width - 33))
                                .background((showShortTerm.wrappedValue.contains("Long-Term")) ? Color(red: 96 / 255, green: 145 / 255, blue: 231 / 255) : Color(red: 242 / 255, green: 242 / 255, blue: 247 / 255))
                            .cornerRadius(10)
                            .padding([.top, .trailing, .bottom])
                            
                            
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Group {
                            Text("Your Age: \(minAgeV.wrappedValue, specifier: "%.0f")")
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                                .padding(.top, 15.0)
                                .padding(.leading, 15)
                            
                            Slider(value: minAgeV, in: 13.0...19.0,
                                onEditingChanged: { editing in
                                    minAgeChaV = editing
                                    
                                }
                            )
                                .padding(.horizontal, 10.0)
                            
                        }
                        
                    }
                    .padding(.bottom,20)
                    

                }
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()

                }) {
                    Text("APPLY")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .padding(10)
                    .background(Color.init(red: 100 / 255, green: 114 / 255, blue: 138 / 255))
                    
                    .cornerRadius(40)
                    .padding(.all, 6)
                    .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.init(red: 100 / 255, green: 114 / 255, blue: 138 / 255), lineWidth: 5))
                }
            }
            
            
        }
        
    }
}

struct FilterVol_Previews: PreviewProvider {
    static var previews: some View {
        FilterVol(showFavoritesOnly: .constant(false), showShortTerm: .constant(""), minAgeV: .constant(16.0))
    }
}
