//
//  Bhagavad_GitaApp.swift
//  Bhagavad Gita
//
//  Created by Vanshita on 23/05/24.
//

import SwiftUI

@main
struct Bhagavad_GitaApp: App {
    @State private var isActive = false
    
    var body: some Scene {
        WindowGroup {
            MainView(isActive: $isActive)
        }
    }
}

struct MainView: View {

    @Binding var isActive: Bool
    
    var body: some View {
        Group {
            if isActive{
                LoginView()
            }else{
                LaunchView()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            withAnimation(Animation.easeInOut(duration: 1)) {
                                self.isActive = true
                            }
                        }
                    }

            }
        }
    }
}
