//
//  IndicatorView.swift
//  CustomTabViewIndicator
//
//  Created by Azar Aliyev on 7/24/24.
//

import SwiftUI

struct IndicatorView: View {
    @Binding var currentPage: Int
    @Binding var screenMidX: CGFloat
    @Binding var difference: CGFloat
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0...2, id: \.self) { tab in
                Capsule()
                    .frame(width: (tab == currentPage) ? 28 : 9, height: 5)
                    .foregroundStyle(Color((tab == currentPage) ? "Color1" : "Color2"))
            }
        }
        .overlay(alignment: .leading) {
            Capsule()
                .fill(Color("Color1"))
                .frame(width: 28)
                .padding(.leading, 19 * (difference/screenMidX))
        }
    }
}

#Preview {
    IndicatorView(currentPage: .constant(0), screenMidX: .constant(0), difference: .constant(0))
}
