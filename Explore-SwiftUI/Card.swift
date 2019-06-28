//
//  Card.swift
//  Explore-SwiftUI
//
//  Created by Muhammad Hanif Sugiyanto on 28/06/19.
//  Copyright © 2019 Muhammad Hanif Sugiyanto. All rights reserved.
//

import SwiftUI

struct Card : View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardBottom()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardBack ()
                .background(show ? Color("background9") : Color.gray)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -280 : -40.0)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15: 0))
                .animation(.basic(duration: 0.9, curve: .easeInOut))
                .blendMode(.hardLight)
                .offset(x: viewState.width, y: viewState.height)
            CardBack ()
                .background(show ? Color("background8") : Color.gray)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20.0)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .animation(.basic(duration: 0.5, curve: .easeInOut))
                .blendMode(.hardLight)
                .offset(x: viewState.width, y: viewState.height)
            
            CertificateView()
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .animation(.spring(mass: 1,
                                   stiffness: 100,
                                   damping: 10,
                                   initialVelocity: 1))
                .tapAction {
                    self.show.toggle()
                }
                .gesture(DragGesture()
                    .onChanged({ (value) in
                        self.viewState = value.translation
                        self.show = true
                    })
                    .onEnded({ (value) in
                        self.viewState = CGSize.zero
                        self.show = false
                    }))
        }
    }
}

#if DEBUG
struct Card_Previews : PreviewProvider {
    static var previews: some View {
        Card()
    }
}
#endif

struct CardBack : View {
    var body: some View {
        return VStack {
            Text("a")
            }
            .frame(width: 340.0, height: 220.0)
    }
}

struct CertificateView : View {
    var body: some View {
        return VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Some Cards")
                        .font(.headline)
                        .fontWeight(.bold)
                        .color(Color("accent"))
                        .padding(.top)
                    Text("Some subtitle")
                        .color(.white)
                    
                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
                }
                .padding(.horizontal)
            Spacer()
            Image("Background")
            }
            .frame(width: 340.0, height: 220.0)
            .background(Color.black)
            .cornerRadius(15).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

struct TitleView : View {
    var body: some View {
        return VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
            }.padding()
    }
}

struct CardBottom : View {
    var body: some View {
        return VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text("Ah shit here we go again to gain a new certificates for iOS")
                .lineLimit(5)
            Spacer()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 20)
            .offset(y: 600)
    }
}
