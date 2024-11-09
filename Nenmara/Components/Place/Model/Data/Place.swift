//
//  Place.swift
//  Nenmara
//
//  Created by abbas m h on 09/11/24.
//

import Foundation
import SwiftData

@Model
class Place {
    
    #Unique<Place>([\.name, \.latitude ,\.longitude])
    
    var name: String
    var address: String
    var phone: String?
    var latitude: Double?
    var longitude: Double?
    var image: String?

    init(name: String, address: String, phone: String?, latitude: Double?, longitude: Double?, image: String?) {
        self.name = name
        self.address = address
        self.phone = phone
        self.latitude = latitude
        self.longitude = longitude
        self.image = image
    }
    
    // Preview
    @MainActor
    static var previewContainer: ModelContainer? {
        do{
            let container = try ModelContainer(for: Place.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
            
            for place in previewPlaces{
                container.mainContext.insert(place)
            }
            
            return container
        }catch{
            return nil
        }
    }
    
    static var previewPlaces : [Place] = [
        .init(name: "Govt Boy's HSS Nemmara", address: "SH 58 - Pollachi Road Palakkad District, near New Light Hotel, Nenmara, Kerala 678508", phone: "04923243750", latitude: 10.593564257489499, longitude: 76.59523832883544, image: ""),
        .init(name: "Dhanalakshmi Cinemas Nemmara", address: "SH58, Nenmara, Kerala 678508", phone: "09567748213", latitude: 10.590926412858822, longitude: 76.59543101871957, image: nil)
    ]
}
