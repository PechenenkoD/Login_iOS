//
//  GradientButton.swift
//  LoginApp
//
//  Created by Dmitro Pechenenko on 15.08.2023.
//

import SwiftUI

struct GradientButton: View {
    
    var title: String
    var icon: String
    var onClick: () -> ()
    
    var body: some View {
        Button(action: onClick) {
            HStack(spacing: 15) {
                Text(title)
                Image(systemName: icon)
            }
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding(.vertical, 12)
            .padding(.horizontal, 35)
            .background(.linearGradient(colors: [Color.orange, .orange, .red], startPoint: .top, endPoint: .bottom))
            .cornerRadius(30)
        }
    }
}

struct GradientButton_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
