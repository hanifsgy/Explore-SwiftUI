//
//  CoverImage.swift
//  Explore-SwiftUI
//
//  Created by Muhammad Hanif Sugiyanto on 24/06/19.
//  Copyright © 2019 Muhammad Hanif Sugiyanto. All rights reserved.
//

import SwiftUI

struct CoverImage : View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Catalina")
                .font(.title)
            Image("catalina")
                .resizable()
                .frame(height: 250)
        }
    }
}

#if DEBUG
struct CoverImage_Previews : PreviewProvider {
    static var previews: some View {
        CoverImage()
    }
}
#endif
