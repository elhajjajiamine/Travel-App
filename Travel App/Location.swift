//
//  Location.swift
//  Travel App
//
//  Created by elhajjaji on 7/4/2021.
//

import Foundation

struct Location: Decodable, Identifiable {
    let id: Int
    let name: String
    let country: String
    let description: String
    let more: String
    let latitude: Double
    let longitude: Double
    let heroPicture: String
    let advisory: String
    let Link : String

    static let example = Location(id: 1, name: "Great Smokey Mountains", country: "United States", description: "A great place to visit.", more: "More text here.", latitude: 35.6532, longitude: -83.5070, heroPicture: "smokies", advisory: "Beware of the bears!", Link: "https://www.youtube.com/watch?v=sb6WlQiaJeM")
}
