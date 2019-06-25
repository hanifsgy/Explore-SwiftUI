//
//  CustomEnvView.swift
//  Explore-SwiftUI
//
//  Created by Muhammad Hanif Sugiyanto on 25/06/19.
//  Copyright © 2019 Muhammad Hanif Sugiyanto. All rights reserved.
//  Material from jnadeau

import SwiftUI

struct CustomEnvView : View {
    
    var body: some View {
        NavigationView {
            VStack {
                SomeMagicCard(action: nothing) {
                    Text("Ah shit")
                    Text("Here we go again")
                }

                SomeMagicCard(action: nothing) {
                    Text("Boy Pablo")
                    Text("Here we sad again")
                }
                .environment(\.cardStyle, .bumbleBee)


                SomeMagicCard(action: nothing) {
                    Text("Boy Green")
                    Text("Here we green again")
                    }
                    .environment(\.cardStyle, .green)
                
                Spacer()
            }
        }
        .navigationBarTitle(Text("Custom Environments"))
    }
    
    private func nothing() { }
}


// MARK: - Defines some views
/// We will creates some view that can handle custom environment
struct SomeMagicCard<Title: View, Subtitle: View> : View {
    var action: () -> Void
    var title: Title
    var subtitle: Subtitle
    
    // Intializations
    /// a swift tuple of View values
    init(action: @escaping () -> Void, @ViewBuilder _ content: () -> TupleView<(Title, Subtitle)>) {
        self.action = action
        (title, subtitle) = content().value
    }
    
    var body: some View {
        Button(action: action) {
            VStack(alignment: .leading) {
                title
                    .font(Font.system(.title, design: .rounded).bold())
                subtitle
                    .font(Font.system(.headline, design: .rounded))
            }
        }
        .buttonStyle(.card)
        .frame(maxHeight: 225)
    }
}

// MARK: - Custom button style
/// we will creates some static variable as `.card` based on `ButtonStyle`
extension StaticMember where Base : ButtonStyle {
    static var card: CardButtonStyle.Member {
        return .init(CardButtonStyle())
    }
}

// MARK: - Custom Card Style
/// Custom button style that displays the content in a colorful "card" with a cute scaling effect when pressed.
struct CardButtonStyle : ButtonStyle {
    func body(configuration: Button<Label>, isPressed: Bool) -> Body {
        Body(label: configuration.label, isPressed: isPressed)
    }
    
    struct Body : View {
        let label: Label
        let isPressed: Bool
        
        @Environment(\.cardStyle) private var cardStyle: CardStyle
        
        var body: some View {
            ZStack(alignment: .topLeading) {
                baseShape
                    .fill(cardStyle.baseColor)
                    .shadow(color: .cardShadow, radius: 4, x: 0, y: 6)
                
                // Cheating at gradients :)
                baseShape
                    .fill(overlayGradient)
                    .blendMode(.overlay)
                
                label
                    .foregroundColor(cardStyle.foregroundColor)
                    .shadow(color: .cardTextShadow, radius: 1, x: 0, y: 1)
                    .padding(12)
                }
                .padding([.horizontal, .top])
                .padding(.bottom, 22)
                .scaleEffect(isPressed ? 0.95 : 1)
                .animation(.spring())
        }
        
        private var baseShape: RoundedRectangle {
            RoundedRectangle(cornerRadius: 16, style: .continuous)
        }
        
        private var overlayGradient: LinearGradient {
            LinearGradient(
                gradient: Gradient(colors: [.cardGradBottom, .cardGradTop]),
                startPoint: .bottom,
                endPoint: .top
            )
        }
    }
}

// MARK: - Custom Environment Stuff
/// A simple type we're going to stuff in the environment.
struct CardStyle {
    var baseColor: Color
    var foregroundColor: Color
    
    static let `default` = CardStyle(baseColor: .pink, foregroundColor: .white)
    static let bumbleBee = CardStyle(baseColor: .yellow, foregroundColor: .black)
    static let green = CardStyle(baseColor: .green, foregroundColor: .white)
}

/**
 This defines a custom `EnvironmentKey`. As a type, it does the following things:
 - The identity of the type acts as a key for getting/setting values from the environment.
 - The associated type `Value` (here `CardStyle`) determines what the stored value type is.
 - The `defaultValue` static provides a backstop value for when there's no override in the environment. You can always make the type nullable, return nil here, and backstop the value at the point of use instead.
 */
struct CardStyleKey : EnvironmentKey {
    static var defaultValue: CardStyle { return .default }
}

/**
 This defines a property on `EnvironmentValues` that just covers subscripting using the custom `EnvironmentKey` we already defined.
 We'll address this property using a `KeyPath` when we want to use the `.environment()` modifier to push a new `CardStyle` value in the environment.
 */
extension EnvironmentValues {
    var cardStyle: CardStyle {
        get { return self[CardStyleKey.self] }
        set { self[CardStyleKey.self] = newValue }
    }
}

// MARK: - Misc
extension Color {
    static let cardShadow = Color.black.opacity(0.25)
    static let cardTextShadow = Color.black.opacity(0.2)
    static let cardGradTop = Color(white: 0.7)
    static let cardGradBottom = Color(white: 0.4)
}

#if DEBUG
struct CustomEnvView_Previews : PreviewProvider {
    static var previews: some View {
        CustomEnvView()
    }
}
#endif
