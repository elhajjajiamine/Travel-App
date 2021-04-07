//
//  ContentView.swift
//  Travel App
//
//  Created by elhajjaji on 6/4/2021.
//

import SwiftUI

struct ContentView: View {
     @StateObject var locations = Locations()
     @State private var isExpanded: Bool = false
     let location : Location

    var body: some View {
        NavigationView{
            ZStack{
                Image(location.heroPicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                
                Rectangle()
                    .foregroundColor(.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [.clear,.clear, .black]), startPoint: .top, endPoint: .bottom))
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight:0, maxHeight: .infinity, alignment: Alignment.topLeading)
                    Spacer()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight:0, maxHeight: .infinity, alignment: Alignment.topLeading)
                    
                    
                    ScrollView {
                          VStack (alignment: .leading){
                            
                            Text(location.name)
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                                .multilineTextAlignment(.center)
                                
                            Text(location.country)
                                .foregroundColor(.white)
                                .font(.title3)
                                .padding(.trailing)
                            
                                
                            Text(location.description)
                                .foregroundColor(.white)
                                       .lineLimit(isExpanded ? nil : 5)
                                .padding(.top)

                            
                            if isExpanded == true {
                                Text("Did you know?")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .padding(.top)
                                Text(location.more)
                                    .foregroundColor(.white)
                                    .padding(.top)
                                Button(action: {
                                    print("airplane Button Click")
                           }, label: {
                            NavigationLink(destination: WorldView()) {
                                HStack{
                                Image(systemName: "airplane.circle.fill")
                                    .font(.largeTitle)
                                Text("Discover")
                                    .font(.title)

                                }.padding()
                                 }
                                   
                                })
                                
                            } else {
                                
                            }
                            
                           
                          }.padding()
                          .frame(width: UIScreen.main.bounds.width)
                          .overlay(
                              GeometryReader { proxy in
                                  Button(action: {
                                      isExpanded.toggle()
                                  }) {
                                      Text(isExpanded ? "Less" : "More")
                                          .font(.caption).bold()
                                        .padding(.trailing, 8.0)
                                          .padding(.top, 4.0)
    //                                      .background(Color.white)
                                  }
                                  .frame(width: proxy.size.width, height: proxy.size.height, alignment: .bottomTrailing)
                              }
                          )
                           }
                }

            }
            .navigationBarHidden(true)
                .navigationTitle("Discover")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(location: Location.example)
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

