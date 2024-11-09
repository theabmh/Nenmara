//
//  PlaceDetailView.swift
//  Nenmara
//
//  Created by abbas m h on 09/11/24.
//

import SwiftUI
import MapKit

struct PlaceDetailView: View {
    
    let place: Place
    
    var body: some View {
        VStack{
            mapView
                .frame(height: 400)
            
            VStack{
                Text(place.name)
            }
            
        }
        .frame(maxHeight: .infinity,alignment: .top)
    }
}

#Preview {
    PlaceDetailView(place: Place.previewPlaces.first!)
}

extension PlaceDetailView{
    
    var mapView: some View{
        VStack {
            
            
            Map(
                initialPosition: .camera(
                    .init(
                        centerCoordinate: CLLocationCoordinate2D(
                            latitude: place.latitude ?? 0.0,
                            longitude: place.longitude ?? 0.0
                        ),
                        distance: 1000
                    )
                )
            ){
                Annotation(coordinate: CLLocationCoordinate2D(
                    latitude: place.latitude ?? 0.0,
                    longitude: place.longitude ?? 0.0
                )) {
                    Image(systemName: "mappin.circle.fill")
                        .renderingMode(.template)
                        .tint(.red)
                        .font(.headline)
                } label: {
                    Text("\(place.name)")
                }

            }
            
        }
        .ignoresSafeArea(edges: [.top])
    }
    
}
