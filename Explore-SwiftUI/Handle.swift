//
//  Handle.swift
//  Explore-SwiftUI
//
//  Created by Muhammad Hanif Sugiyanto on 24/06/19.
//  Copyright © 2019 Muhammad Hanif Sugiyanto. All rights reserved.
//

import SwiftUI


struct Handle : View {
    private let handleThickness = CGFloat(5.0)
    var body: some View {
        RoundedRectangle(cornerRadius: handleThickness / 2.0)
            .frame(width: 40, height: handleThickness)
            .foregroundColor(Color.secondary)
            .padding(5)
    }
}

#if DEBUG
struct Handle_Previews : PreviewProvider {
    static var previews: some View {
        Handle()
    }
}
#endif
