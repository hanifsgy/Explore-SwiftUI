//
//  CardContentView.swift
//  Explore-SwiftUI
//
//  Created by Muhammad Hanif Sugiyanto on 28/06/19.
//  Copyright © 2019 Muhammad Hanif Sugiyanto. All rights reserved.
//

import SwiftUI

struct CardContentView : View {
    var body: some View {
        ScrollView(showsHorizontalIndicator: false) {
            HStack {
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    CardSub()
                }
            }
        }
    }
}

#if DEBUG
struct CardContentView_Previews : PreviewProvider {
    static var previews: some View {
        CardContentView()
    }
}
#endif

struct CardSub : View {
    var body: some View {
        return VStack(alignment: .leading) {
            Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
                .font(.title)
                .fontWeight(.bold)
                .color(.white)
                .padding(20)
                .lineLimit(4)
                .frame(width: 150)
                Spacer()
                Image("Illustration1")
            }
            .background(Color("background3"))
            .cornerRadius(30)
            .frame(width: 246, height: 350)
            .shadow(color: Color("backgroundShadow3"),
            radius: 20,
            x: 0,
            y:  20)
        }
    }
