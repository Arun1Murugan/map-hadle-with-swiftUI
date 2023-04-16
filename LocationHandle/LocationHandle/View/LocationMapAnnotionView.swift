//
//  LocationMapAnnotionView.swift
//  LocationHandle
//
//  Created by Arun Skyraan on 19/03/23.
//

import SwiftUI

struct LocationMapAnnotionView: View {
    
    let accentColor: Color = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0.0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFill()
                .frame(width: 30, height: 28)
                .font(Font.headline)
                .foregroundColor(Color.white)
                .padding()
                .background(accentColor)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
//                .frame(width: 30, height: 30)
//                .font(Font.headline)
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 35)
//                .padding()
//                .background(accentColor)
//                .clipShape(Circle())
        }
    }
}

struct LocationMapAnnotionView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotionView()
    }
}
