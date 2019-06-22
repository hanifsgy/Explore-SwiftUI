//
//  CardWalletView.swift
//  Explore-SwiftUI
//
//  Created by Muhammad Hanif Sugiyanto on 22/06/19.
//  Copyright © 2019 Muhammad Hanif Sugiyanto. All rights reserved.
//

import SwiftUI

struct CardWalletView : View {
    
    // MARK: - Properties
    @State var translation: CGSize = .zero
    @State var selected: Int? = nil
    let totalCards = 5
    static let gradientStart = Color(red: 18/255, green: 37/255, blue: 129/255)
    static let gradientEnd = Color(red: 26/255, green: 53/255, blue: 205/255)
    
    var body: some View {
        ZStack(alignment: .center) {
            ForEach(0..<totalCards) { idx in
                    Rectangle()
                    .fill(LinearGradient(
                        gradient: .init(colors: [Self.gradientStart, Self.gradientEnd]),
                        startPoint: .init(x: 0.5, y: 0),
                        endPoint: .init(x: 0.5, y: 0.6)))
                    .cornerRadius(20)
                    .border(Color.white, width: 2, cornerRadius: 20)
                    .offset(CGSize(width: 0, height: self.cardTranslation(idx)))
                    .gesture(TapGesture().onEnded({ (_) in
                        withAnimation(.basic(duration: 0.4, curve: .easeInOut)) {
                            if self.selected != nil {
                                self.selected = nil
                            } else {
                                self.selected = idx
                            }
                        }
                    }))
            }
        }
            .offset(x: 0, y: -120)
            .frame(height: 230)
            .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2))
            .aspectRatio(1, contentMode: .fill)
            .gesture(DragGesture().onChanged({ (value) in
                self.translation = value.translation
            }).onEnded({ (_) in
                withAnimation(.basic(duration: 0.3, curve: .easeOut)) {
                    self.translation = .zero
                }
            }))
    }
    
    private func cardTranslation(_ index: Int) -> CGFloat {
        if let selected = selected {
            if index == selected {
                return -50
            } else {
                return 1000
            }
        } else {
            return max(CGFloat(index * 30) + self.translation.height * (CGFloat(index + 1) / CGFloat(totalCards + 1)), 0.0)
        }
    }
}

#if DEBUG
struct CardWalletView_Previews : PreviewProvider {
    static var previews: some View {
        CardWalletView()
    }
}
#endif
