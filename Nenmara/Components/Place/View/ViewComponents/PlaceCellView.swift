//
//  PlaceCellView.swift
//  Nenmara
//
//  Created by abbas m h on 09/11/24.
//

import SwiftUI

struct PlaceCellView: View {
    
    var place: Place
    
    var body: some View {
        
        VStack(spacing: 8) {
            Image(.imagePlaceHolder)
                .resizable()
                .scaledToFit()
                .clipShape(.rect(cornerRadius: 16))
            VStack(alignment: .leading, spacing: 8) {
                Text(place.name)
                    .font(.headline)
                    .bold()
                    .multilineTextAlignment(.leading)
                
                Text(place.address)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            .padding(.bottom,8)
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        .padding(16)
        .background {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(radius: 2)
        }
        
    }
}

#Preview {
    PlaceCellView(place: Place.previewPlaces.first!)
}
