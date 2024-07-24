//
//  WelcomeScreenCardView.swift
//  CustomTabViewIndicator
//
//  Created by Azar Aliyev on 7/22/24.
//

import SwiftUI

struct WelcomeScreenCardView: View {
    
    let personIcon: String
    let titleText: String
    let infoText: String
    
    var body: some View {
        VStack {
            Image(personIcon)
                .frame(width: 260.0, height: 260.0)
            
            Text(titleText)
                .fontWeight(.semibold)
                .font(.system(size: 22))
                .frame(width: 216)
                .multilineTextAlignment(.center)
                .padding()
            
            Text(infoText)
                .font(.system(size: 16))
                .foregroundStyle(Color(.text2))
                .frame(width: 180, height: 72, alignment: .top)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    WelcomeScreenCardView(personIcon: "PersonIcon1", titleText: "Hello", infoText: "Hello")
}
