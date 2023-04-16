//
//  LocationDetailView.swift
//  LocationHandle
//
//  Created by Arun Skyraan on 19/03/23.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    let location: Location
    @EnvironmentObject private var lvm: LocationsViewModel

    var body: some View {
        ScrollView {
            VStack {
                imageSelection
//                Divider()
                titleSection
                Divider()
                descriptionSection
                Divider()
                mapLayer
            }
        }
        .ignoresSafeArea()
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationsDataService.locations.first!)
            .environmentObject(LocationsViewModel())

    }
}

extension LocationDetailView {
    
    private var imageSelection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.60)
        .tabViewStyle(.page)

    }

    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                
                Text(location.name)
                    .font(Font.title)
                
                Text(location.cityName)
                    .font(Font.title3)
                    .foregroundColor(.secondary)
                
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()

    }
    
    private var descriptionSection: some View {
//        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                
//                Text(location.name)
//                    .font(Font.title)
                
                Text(location.description)
                    .font(Font.subheadline)
                    .foregroundColor(.secondary)
                
                if let url = URL(string: location.link) {
                    
                    Link("more", destination: url)
//                        .tint(Color.green)
                }
            }
            .padding()

//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .padding()

    }
    
    
    private var mapLayer: some View {
        
//        Map(coordinateRegion: <#T##Binding<MKCoordinateRegion>#>, annotationItems: T##RandomAccessCollection, annotationContent: <#T##(Identifiable) -> MapAnnotationProtocol#>)
        
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: location.coordinates,
            span: lvm.mapSpan)),
            annotationItems: [location]) { location in
            
            MapAnnotation(coordinate: location.coordinates) {
                
                LocationMapAnnotionView()
                    .shadow(radius: 10)
            }
            
        }
        
        
        
        
//        Map(
//            coordinateRegion: $lvm.mapRegion,
//            annotationItems: lvm.locations,
//            annotationContent: { location in
//                MapAnnotation(coordinate: location.coordinates) {
//
//                    LocationMapAnnotionView()
//                        .scaleEffect(lvm.mapLocation == location ? 1 : 0.7)
//                        .shadow(radius: 10)
//                        .onTapGesture {
//                            lvm.showNextLocation(location: location)
//                        }
//                }
////                    MapMarker(coordinate: location.coordinates, tint: .purple)
//            })
        
    }
    
}
