//
//  TabView.swift
//  Explore-SwiftUI
//
//  Created by Muhammad Hanif Sugiyanto on 25/06/19.
//  Copyright © 2019 Muhammad Hanif Sugiyanto. All rights reserved.
//

import SwiftUI

struct TabView : View {
    var body: some View {
        TabbedView {
            FacebookLikeView()
                .tabItemLabel(VStack {
                    Image("ios-beer")
                    Text("Facebook")
                })
                .tag(0)
            
            CardWalletView()
                .tabItemLabel(VStack {
                    Image("ios-egg")
                    Text("Wallet")
                })
                .tag(1)
            
            MapView()
                .tabItemLabel(VStack {
                    Image("ios-journal")
                    Text("Map")
                })
                .tag(2)
            
            FloatingButton()
                .tabItemLabel(VStack {
                    Image("ios-rocket")
                    Text("Floating")
                })
                .tag(3)
        }
    }
}

#if DEBUG
struct TabView_Previews : PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
#endif
