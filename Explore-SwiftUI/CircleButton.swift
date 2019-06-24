//
//  CircleButton.swift
//  Explore-SwiftUI
//
//  Created by Muhammad Hanif Sugiyanto on 24/06/19.
//  Copyright © 2019 Muhammad Hanif Sugiyanto. All rights reserved.
//

import SwiftUI

struct CircleButton : View {
    let systemName: String
    let rotationDegrees: Double
    let delay: Double
    
    var body: some View {
        Image(systemName)
            .frame(width: 48, height: 48)
            .padding(EdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1))
            .background(Color.pink)
            .accentColor(Color.white)
            .clipShape(Circle())
            .rotationEffect(.init(degrees: rotationDegrees))
            .animation(Animation.spring().delay(delay).speed(2))
    }
}

#if DEBUG
struct CircleButton_Previews : PreviewProvider {
    static var previews: some View {
        CircleButton(systemName: "plus", rotationDegrees: 90, delay: 2.0)
    }
}
#endif
