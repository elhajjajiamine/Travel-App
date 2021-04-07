//
//  WorldView.swift
//  Travel App
//
//  Created by elhajjaji on 7/4/2021.
//

import SwiftUI
import MapKit

struct WorldView: View {
   @EnvironmentObject var locations: Locations
   @State var region = MKCoordinateRegion(
        center:CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems:locations.places) { location  in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                NavigationLink(
                    destination: ContentView(location: location)){
                    Image(location.country)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width:80, height:80)
                        .shadow(radius:3)

                }
            }
            
        }
            .navigationTitle("Locations")
            .ignoresSafeArea()
   }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}
