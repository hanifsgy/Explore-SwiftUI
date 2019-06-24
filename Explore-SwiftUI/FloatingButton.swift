//
//  FloatingButton.swift
//  Explore-SwiftUI
//
//  Created by Muhammad Hanif Sugiyanto on 24/06/19.
//  Copyright © 2019 Muhammad Hanif Sugiyanto. All rights reserved.
//

import SwiftUI

enum TypeButton {
    case main
    case top
    case middle
    case left
}

struct ButtonData: Hashable {
    let name: String
    let position: Double
    let type: TypeButton
}

struct FloatingButton : View {
    
    @State var isOn = false
    let buttons: [ButtonData] = [
        ButtonData(name: "ic_delete_24_white", position: 2, type: .top),
        ButtonData(name: "ic_filter_calendar_24_white", position: 3, type: .middle),
        ButtonData(name: "ic_invite_family_white", position: 4, type: .left),
        ButtonData(name: "plus", position: 1, type: .main)
    ]
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                ZStack {
                    ForEach(buttons.identified(by: \.self)) { button in
                        CircleButton(systemName: button.name,
                                     rotationDegrees: self.rotationDegree(for: button.position, isOn: self.isOn),
                                     delay: 0.1)
                            .offset(x: self.offsetX(type: button.type, isOn: self.isOn),
                                    y: self.offsetY(type: button.type, isOn: self.isOn))
                            .gesture(TapGesture().onEnded { self.isOn.toggle() })
                    }
                }
            }
        }.padding()
    }
    
    private func rotationDegree(for: Double, isOn: Bool) -> Double {
        return isOn ? 0.0 : -90.0
    }
    
    private func offsetX(type: TypeButton, isOn: Bool) -> CGFloat {
        switch type {
        case .main:
            return isOn ? 0.0 : 0.0
        case .top:
            return isOn ? 0.0 : 0.0
        case .middle:
            return isOn ? -75 : 0.0
        case .left:
            return isOn ? -120 : 0.0
        }
    }
    
    private func offsetY(type: TypeButton, isOn: Bool) -> CGFloat {
        switch type {
        case .main:
            return isOn ? 0.0 : 0.0
        case .top:
            return isOn ? -100 : 0.0
        case .middle:
            return isOn ? -70 : 0.0
        case .left:
            return isOn ? -5.0 : 0.0
        }
    }
    
}

#if DEBUG
struct FloatingButton_Previews : PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                FloatingButton()
            }
        }.padding()
    }
}
#endif

