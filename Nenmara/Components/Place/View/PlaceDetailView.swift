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
        VStack(spacing: 18){
            mapView
                .frame(height: 400)
            
            VStack(spacing: 18){
                Text(place.name)
                    .font(.headline)
                    .bold()
                Text(place.address)
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
            
            Button("Direction", systemImage: "location.app.fill") {
                navigateToAppleMaps(latitude: place.latitude ?? 0.0, longitude: place.longitude ?? 0.0)
            }
            .frame(maxWidth: .infinity,minHeight: 40)
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            
        }
        .frame(maxHeight: .infinity,alignment: .top)
        .toolbarBackground(.automatic, for: .navigationBar)
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
                        .font(.largeTitle)
                        .imageScale(.large)
                        .foregroundStyle(.red)
                        .symbolEffect(.bounce)
                        
                } label: {
                    Text("\(place.name)")
                }

            }
            
        }
        .ignoresSafeArea(edges: [.top])
    }
    
}
extension PlaceDetailView {
    func navigateToAppleMaps(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let destination = MKMapItem(placemark: MKPlacemark(coordinate: coordinate))
        destination.name = "\(place.name)"
        
        // Launch options to specify driving directions
        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
        destination.openInMaps(launchOptions: launchOptions)
    }
}
