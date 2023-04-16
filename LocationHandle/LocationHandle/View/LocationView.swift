//
//  LocationView.swift
//  LocationHandle
//
//  Created by Arun Skyraan on 19/03/23.
//

import SwiftUI
import MapKit

struct LocationView: View {
    
//    @StateObject private var lvm = LocationsViewModel()
    @EnvironmentObject private var lvm: LocationsViewModel
//    @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.8606, longitude: 2.3376), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    var body: some View {
        ZStack {
            
//            Map(coordinateRegion: $lvm.mapRegion)
            mapLayer
                .ignoresSafeArea(.all)
            
            VStack(spacing: 0) {
                
                header
//                .padding()
                
                Spacer()
                
                previewCard
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationView {
    
    private var header: some View {
        VStack {
            Button(action: {
                withAnimation(.easeInOut) {
                    lvm.showLocationList.toggle()
                }
                
            }) {

            ZStack {
                    Text(lvm.mapLocation.name + ", " + lvm.mapLocation.cityName)
                        .font(Font.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .animation(.none, value: lvm.mapLocation)
                    //                    .background(Color.white)
                    HStack {
                        Image(systemName: "arrow.down")
                            .font(Font.headline)
                            .foregroundColor(.black)
                            .padding()
                            .rotationEffect(Angle(degrees: lvm.showLocationList ? 180 : 0))
                        Spacer()
                    }
                }
            }
            
            if lvm.showLocationList {
                LocationListView()
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
        .padding()
    }
    
    private var mapLayer: some View {
        Map(
            coordinateRegion: $lvm.mapRegion,
            annotationItems: lvm.locations,
            annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    
                    LocationMapAnnotionView()
                        .scaleEffect(lvm.mapLocation == location ? 1 : 0.7)
                        .shadow(radius: 10)
                        .onTapGesture {
                            lvm.showNextLocation(location: location)
                        }
                }
//                    MapMarker(coordinate: location.coordinates, tint: .purple)
            })
    }
    
    private var previewCard: some View {
        VStack {
            ForEach(lvm.locations) { location in
                if lvm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}
