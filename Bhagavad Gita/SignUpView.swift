//
//  SignUpView.swift
//  Bhagavad Gita
//
//  Created by Vanshita on 23/05/24.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var name = ""
    @State private var dob = ""
    @State private var gender = ""
    @State private var phno = ""
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("wallpaper")
                    .resizable()
                    .blur(radius: 7.0)
                    .ignoresSafeArea()
                
                VStack {
                    Text("Sign Up")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.primary)
                        .padding(.top, 0)
                    
                    TextField("Name", text: $name)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                    
                    TextField("Date of Birth", text: $dob)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                    
                    TextField("Gender", text: $gender)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                    
                    TextField("Phone Number", text: $phno)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                    
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                    
                    TextField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(10)
                    
                    Button("Sign Up") {
                        showingLoginScreen = true
                    }
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 300, height: 50)
                    .background(Color.primary)
                    .cornerRadius(10)
                    
                    NavigationLink(destination: LoginView(), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    SignUpView()
}
