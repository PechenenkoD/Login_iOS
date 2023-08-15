//
//  SignUp.swift
//  LoginApp
//
//  Created by Dmitro Pechenenko on 15.08.2023.
//

import SwiftUI

struct SignUp: View {
    
    @Binding var showSignup: Bool
    @State private var emailID: String = ""
    @State private var fullName: String = ""
    @State private var password: String = ""
    @State private var askOTP: Bool = false
    @State private var otpText: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Button(action: {
                showSignup = false
            }) {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding(.top, 10)
            
            Text("SignUp")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 25)
            Text("Please sign up to continue")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.top, -5)
            VStack(spacing: 25) {
                CustomTF(sfIcon: "at", hint: "Email ID", value: $emailID)
                CustomTF(sfIcon: "person", hint: "Full Name", value: $fullName)
                    .padding(.top, 5)
                CustomTF(sfIcon: "lock", hint: "Password", isPassword: true, value: $password)
                    .padding(.top, 5)

                
                GradientButton(title: "Continue", icon: "arrow.right") {
                    askOTP.toggle()
                }
                .hSpacing(.trailing)
                .disableWithOpacity(emailID.isEmpty || password.isEmpty || fullName.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 6) {
                Text("Already have an account?")
                    .foregroundColor(.gray)
                Button("Login") {
                    showSignup = false
                }
                .fontWeight(.bold)
                .tint(Color.orange)
            }
            .font(.callout)
            .hSpacing()
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .toolbar(.hidden, for: .navigationBar)
        .sheet(isPresented: $askOTP, content: {
            if #available(iOS 16.4, *) {
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(350)])
                    .presentationCornerRadius(30)
            } else {
                OTPView(otpText: $otpText)
                    .presentationDetents([.height(350)])
            }
        })
    }
}

#Preview {
    ContentView()
}
