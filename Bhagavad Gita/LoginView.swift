//
//  ContentView.swift
//  Bhagavad Gita
//
//  Created by Vanshita on 23/05/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername = 0
    @State private var wrongPassword = 0
    @State private var showingLoginScreen = false
    @State private var showingSignUpScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("wallpaper")
                    .resizable()
                    .blur(radius: 7.0)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Welcome!")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.primary)
                        .padding(.top)
                    
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.primary)
                        .padding(.bottom, 30)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongUsername))
                    
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                        .border(.red, width: CGFloat(wrongPassword))
                    
                    Button("Login") {
                        autheticateUser(username: username, password: password)
                    }
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 300, height: 50)
                    .background(Color.primary)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: GitaView(), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                    HStack{
                        Text("Don't have an account ?")
                            .font(.title3)
                            .bold()
                            .foregroundColor(.white)
                            .padding(.top, 50)
                        
                        Button("Sign Up") {
                            showingSignUpScreen = true
                        }
                        .font(.title3)
                        .bold()
                        .foregroundColor(.primary)
                        .padding(.top, 50)
                        
                        NavigationLink(destination: SignUpView(), isActive: $showingSignUpScreen){
                            EmptyView()
                        }
                    }

                }
            }
            .navigationBarHidden(true)
        }
    }
    
    func autheticateUser(username: String, password: String) {
        if username.lowercased() == "vanshita2002" {
            wrongUsername = 0
            if password.lowercased() == "abc123" {
                wrongPassword = 0
                showingLoginScreen = true
            } else {
                wrongPassword = 2
            }
        } else {
            wrongUsername = 2
        }
    }
}

#Preview {
    LoginView()
}
