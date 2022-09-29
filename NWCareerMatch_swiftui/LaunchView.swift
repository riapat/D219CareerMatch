//
//  LaunchView.swift
//  NWCareerMatch_swiftui
//
//  Created by Ria Patel on 4/16/22.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadingText: [String] = "D219 Career Match".map { String($0) }
//    makes each letter or character an element in an array --> shorthand
    @State private var showText: Bool = false
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    @State private var counter: Int = 0
    @State private var loops: Int = 0
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack{
            Color.white
                .ignoresSafeArea()
            Image("1024x1024")
                .resizable()
                .frame(width: 130, height: 130, alignment: .center)
            
            ZStack {
                
                if showText {

                    HStack(spacing:0) {
                        ForEach(loadingText.indices) { index in
                            Text(loadingText[index])
                                .font(.title3)
                                .fontWeight(.heavy)
                                .foregroundColor(Color(red: 88 / 255, green: 204 / 255, blue: 178 / 255))
                                .offset(y : counter == index ? -7: 0)
                        }
                    }
                    .transition(AnyTransition.scale.animation(.easeIn))
                }
                
            }
            .offset(y: 100)
        }
        .onAppear {
            showText.toggle()
        }
        .onReceive(timer, perform: { _ in
            withAnimation(.spring()) {
                let lastIndex = loadingText.count - 1
                if counter == lastIndex {
                    counter = 0
                    loops += 1
                    
                    if loops >= 2 {
                        showLaunchView = false
                    }
                } else {
                    counter += 1

                }
                
            }
        })
        
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
