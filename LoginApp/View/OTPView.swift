//
//  OTPView.swift
//  LoginApp
//
//  Created by Dmitro Pechenenko on 15.08.2023.
//

import SwiftUI

struct OTPView: View {
    
    @Binding var otpText: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "arrow.left")
                    .font(.title2)
                    .foregroundStyle(.gray)
            }
            .padding(.top, 15)
            
            Text("Enter OTP")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .padding(.top, 5)
            Text("An 6 digit code has been sent to your Email ID.")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding(.top, -5)
            VStack(spacing: 25) {
                OTPVerificationView(otpText: $otpText)
                GradientButton(title: "Send Link", icon: "arrow.right") {
                    
                }
                .hSpacing(.trailing)
                .disableWithOpacity(otpText.isEmpty)
            }
            .padding(.top, 20)
            
            Spacer(minLength: 0)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 25)
        .interactiveDismissDisabled()
    }
}

#Preview {
    ContentView()
}
