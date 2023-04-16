//
//  LocationPreviewView.swift
//  LocationHandle
//
//  Created by Arun Skyraan on 19/03/23.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var lvm: LocationsViewModel
    let location: Location
    
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {

                learnMorebutton
                nextButton
                
//                .buttonStyle(.borderedProminent)
            }
            
//            .background(Color.orange)
            
        }
        .padding(20)
        .background(
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.white.opacity(0.7))
            .offset(y: 60)
        )
//        .clipped()
        .cornerRadius(10)
        .padding()
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)

//                .padding()
        }
        .environmentObject(LocationsViewModel())

    }
}

extension LocationPreviewView {
    
    private var imageSection: some View {
        ZStack {
            
            if let imageName = location.imageNames.first! {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(10)

    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(Font.title2)
                .fontWeight(.black)
            
            Text(location.cityName)
                .font(Font.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
//        .background()
    }
    
    private var learnMorebutton: some View {
        
        Button(action: {
            
        }, label: {
            Text("Learn more")
                .font(Font.subheadline)
                .foregroundColor(Color.white)
                .frame(width: 125, height: 35)
                .background(Color.purple)
                .cornerRadius(10)
        })
    }
    
    private var nextButton: some View {
        
        Button(action: {
            lvm.nextButtonPressed()
        }, label: {
            Text("Next")
                .bold()
                .font(Font.subheadline)
                .foregroundColor(Color.purple)
                .frame(width: 125, height: 35)
                .cornerRadius(10)

        })
    }
    
}
