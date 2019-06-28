//
//  HomeOfCard.swift
//  Explore-SwiftUI
//
//  Created by Muhammad Hanif Sugiyanto on 28/06/19.
//  Copyright © 2019 Muhammad Hanif Sugiyanto. All rights reserved.
//

import SwiftUI

struct HomeOfCard : View {
    // MARK: - Properties
    @State var show = false
    @State var showProfile = false

    var body: some View {
        ZStack {
            Card()
                .background(Color.white)
                .cornerRadius(30)
                .shadow(radius: 30)
                .animation(.fluidSpring())
                .offset(y: showProfile ? 0 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -30, y: showProfile ? 0 : 80)
                .animation(.fluidSpring())
            
            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? 0 : 80)
                .animation(.fluidSpring())
            
            HomeMenuView(show: $show)
        }
    }
}

#if DEBUG
struct HomeOfCard_Previews : PreviewProvider {
    static var previews: some View {
        HomeOfCard()
    }
}
#endif

struct MenuRow : View {
    
    var image: String = ""
    var text: String = ""
    
    var body: some View {
        return HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color.black)
                .frame(width: 32, height: 32)
            Text(text)
                .font(.headline)
            Spacer()
        }
    }
}


// MARK: - Creates Menu Data
struct Menu : Identifiable {
    var id = UUID()
    var title: String
    var icon: String
}

let menuData = [
    Menu(title: "Me", icon: "person.circle"),
    Menu(title: "Billing", icon: "creditcard"),
    Menu(title: "Team", icon: "person.and.person"),
    Menu(title: "Group", icon: "folder.badge.person.crop.fill"),
    Menu(title: "Group", icon: "arrow.uturn.down")]


struct HomeMenuView : View {
    var menuItems = ["Me","Billing","Team","Group","Sign Out"]
    var menu = menuData
    
    // Bindings: will listen state from parent components
    @Binding var show: Bool
    
    var body: some View {
        return VStack(alignment: .leading, spacing: 20) {
            ForEach(menu) { item in
                MenuRow(image: item.icon, text: item.title)
            }
            Spacer()
        }
        .padding(.top, 20)
        .padding(30)
        .frame(minWidth: 0, maxHeight: .infinity)
        .background(Color.white)
        .cornerRadius(30.0)
        .padding(.trailing, 60)
        .shadow(radius: 20.0)
        .rotation3DEffect(Angle(degrees: show ? 0 : 90), axis: (x: 0.0, y: 10.0, z: 0.0))
        .animation(.basic())
        .offset(x: show ? 0 : -UIScreen.main.bounds.width)
        .tapAction {
            self.show.toggle()
        }
    }
}

struct RightMenu : View {
    var icon = "person.crop.circle"
    
    var body: some View {
        return HStack {
            Image(systemName: icon)
                .foregroundColor(.black)
        }
        .frame(width: 44, height: 44)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10)
}
}

struct MenuButton : View {
    
    @Binding var show: Bool
    
    var body: some View {
        return ZStack(alignment: .topLeading) {
            Button(action: {
                self.show.toggle()
            }) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash")
                        .foregroundColor(.black)
                }
                .padding(.trailing, 20)
                .frame(width: 90, height: 60)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10)
        }
        Spacer()
    }
}
}

struct MenuRight : View {
    @Binding var show: Bool
    
    var body: some View {
        return ZStack(alignment: .topTrailing) {
            HStack {
                Button(action: {
                    self.show.toggle()
                }) {
                    RightMenu()
                }
                Button(action: {
                    self.show.toggle()
                }) {
                    RightMenu(icon: "bell")
                }
            }
            Spacer()
        }
    }
}
