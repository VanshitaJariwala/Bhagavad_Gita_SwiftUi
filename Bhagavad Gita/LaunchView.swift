//
//  LaunchView.swift
//  Bhagavad Gita
//
//  Created by Vanshita on 23/05/24.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        
        let Brown = Color(red: 228, green: 197, blue: 158)
        
        ZStack {
            Color
                .brown
                .opacity(0.4)
                .ignoresSafeArea()
            
            VStack {
                Text("Bhagavad Gita")
                    .font(.custom("Rockwell", size: 36))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Image("icon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200, alignment: .center)
                
                
            }
        }
        
        
    }
}

#Preview {
    LaunchView()
}
