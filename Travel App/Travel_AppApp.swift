//
//  Travel_AppApp.swift
//  Travel App
//
//  Created by elhajjaji on 6/4/2021.
//

import SwiftUI

@main
struct Travel_AppApp: App {
    var locations = Locations()
    var body: some Scene {
        WindowGroup {
                       
                                ContentView(location: locations.primary)
                           
                        .environmentObject(locations)

        }
    }
}
