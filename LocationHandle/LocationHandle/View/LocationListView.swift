//
//  LocationListView.swift
//  LocationHandle
//
//  Created by Arun Skyraan on 19/03/23.
//

import SwiftUI

struct LocationListView: View {
    
    @EnvironmentObject private var lvm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(lvm.locations) { location in
                Button(action: {
                    lvm.showNextLocation(location: location)
                }, label: {
                    listRowView(location: location)
                        .padding(.vertical, 4)

                })
                
            }
        }
        .listStyle(.plain)
    }
}

struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationListView {
    
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                    .cornerRadius(10)
            }
            VStack(alignment: .leading) {
                Text("\(location.name)")
                    .font(Font.headline)
                Text("\(location.cityName)")
                    .font(Font.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
//                    .background(Color.red)
        }
    }
}
