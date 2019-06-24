//
//  MapView.swift
//  Explore-SwiftUI
//
//  Created by Muhammad Hanif Sugiyanto on 24/06/19.
//  Copyright © 2019 Muhammad Hanif Sugiyanto. All rights reserved.
//

import SwiftUI

struct MapView : View {
    var body: some View {
        ZStack(alignment: Alignment.top) {
            Map()
            SlideOverCard {
                VStack(alignment: .center) {
                    Handle()
                    CoverImage()
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. \n\n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                        .font(.caption)
                        .lineLimit(nil)
                    
                    Spacer()
                    }
                    .padding(EdgeInsets(top: 12, leading: 12, bottom: 0, trailing: 12))
                }
            }
            .edgesIgnoringSafeArea(.top)
    }
}
#if DEBUG
struct MapView_Previews : PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
#endif
