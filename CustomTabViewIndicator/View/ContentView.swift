//
//  ContentView.swift
//  CustomTabViewIndicator
//
//  Created by Azar Aliyev on 7/22/24.
//

import SwiftUI

struct ContentView: View {
    @State var currentPage: Int = 0 //current page index
    @State var pageMidX: CGFloat = 0
    @State var screenMidX: CGFloat = 0
    @State var screenMaxX: CGFloat = 0
    @State var difference: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Spacer()
                
                HStack {
                    Spacer()
                    Button(action: {
                        withAnimation {
                            currentPage = 2
                        }
                    }, label: {
                        Text("Skip")
                            .foregroundStyle(Color(.text2))
                            .font(.system(size: 14))
                    })
                }
                .padding(.trailing, 24)
                .opacity((currentPage == 2) ? 0 : 1)
                
                TabView(selection: $currentPage) {
                    GeometryReader {geometry in
                        WelcomeScreenCardView(personIcon: "PersonIcon1",
                                              titleText: "Numerous free trial courses",
                                              infoText: "Free courses for you to find your way to learning")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .onAppear{
                            pageMidX = geometry.frame(in: .global).midX
                        }
                        .onChange(of: geometry.frame(in: .global).midX) { newMidX in
                            if currentPage == 0 {
                                pageMidX = (newMidX >= 0) ? newMidX : 0
                                pageMidX = (pageMidX <= screenMaxX) ? pageMidX : screenMaxX
                                difference = screenMidX * CGFloat((1 + currentPage)) - pageMidX
                            }
                        }
                    }
                    .tag(0)
                    
                    GeometryReader { geometry in
                        WelcomeScreenCardView(personIcon: "PersonIcon1",
                                              titleText: "Quick and easy learning",
                                              infoText: "Easy and fast learning at any time to help you improve various skills")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .onChange(of: geometry.frame(in: .global).midX) { newMidX in
                            if currentPage == 1 {
                                pageMidX = (newMidX >= 0) ? newMidX : 0
                                pageMidX = (pageMidX <= screenMaxX) ? pageMidX : screenMaxX
                                difference = screenMidX * CGFloat((1 + currentPage)) - pageMidX
                            }
                        }
                    }
                    .tag(1)
                    
                    GeometryReader { geometry in
                        WelcomeScreenCardView(personIcon: "PersonIcon1",
                                              titleText: "Create your own study plan",
                                              infoText: "Study according to the study plan, make study more motivated")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .onChange(of: geometry.frame(in: .global).midX) { newMidX in
                            if currentPage == 2 {
                                pageMidX = (newMidX >= 0) ? newMidX : 0
                                pageMidX = (pageMidX <= screenMaxX) ? pageMidX : screenMaxX
                                difference = screenMidX * CGFloat((1 + currentPage)) - pageMidX
                            }
                        }
                    }
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 460)
                
                IndicatorView(currentPage: $currentPage, screenMidX: $screenMidX, difference: $difference)
                
                Spacer()
                
                HStack(spacing: 15) {
                    Spacer(minLength: 20)
                    Button(action: {
                        
                    }, label: {
                        Text("Sign up")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    })
                    .frame(idealHeight: 50, maxHeight: 50)
                    .buttonStyle(BorderedProminentButtonStyle())
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("Log in")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    })
                    .frame(idealHeight: 50, maxHeight: 50)
                    .buttonStyle(BorderedButtonStyle())
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                    Spacer(minLength: 20)
                }
                .opacity((currentPage == 2) ? 1 : 0)
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/(duration: 0.3), value: currentPage)
                
                Spacer()
            }
            .ignoresSafeArea()
            .padding()
            .onAppear {
                screenMidX = geometry.frame(in: .global).midX
                screenMaxX = geometry.frame(in: .global).maxX
            }
        }
        
    }
}

struct IndicatorView : View {
    
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
    ContentView()
}
