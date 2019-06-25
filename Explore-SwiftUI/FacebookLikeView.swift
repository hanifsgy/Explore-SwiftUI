//
//  FacebookLikeView.swift
//  Explore-SwiftUI
//
//  Created by Muhammad Hanif Sugiyanto on 22/06/19.
//  Copyright © 2019 Muhammad Hanif Sugiyanto. All rights reserved.
//

import SwiftUI

struct FacebookLikeView : View {
    
    // MARK: - Properties
    @State var isDragging = false
    @State var selectedReaction: String? = nil
    
    var reactions = ["love", "sad", "haha", "wow", "angry"]
    var reactionSize: CGFloat = 50
    var reactionSpacing: CGFloat = 10
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack {
                ZStack(alignment: .leading) {
                    /// Create reactions
                    HStack(spacing: reactionSpacing) {
                        ForEach(reactions.identified(by: \.self)) { reaction in
                            Image(reaction)
                                .resizable()
                                .animation(.spring())
                                .frame(width: (self.selectedReaction == reaction ? self.reactionSize * 1.5 : self.reactionSize),
                                       height: (self.selectedReaction == reaction ? self.reactionSize * 1.5 : self.reactionSize))
                                .offset(y: self.isDragging ? self.selectedReaction == reaction ? (self.reactionSize * -1.5) : (self.reactionSize * -1) : 0)
                                .opacity(self.isDragging ? 1 : 0)
                        }
                        }
                        .frame(width: self.reactionSize, height: self.reactionSize)
                        .offset(x: ((reactionSize + reactionSpacing) * CGFloat(reactions.count) - reactionSpacing - reactionSize) / 2)
                    /// Create Like Button
                    Image("like")
                        .resizable()
                        .frame(width: self.reactionSize, height: self.reactionSize)
                        .gesture(DragGesture().onChanged({ (value) in
                            self.isDragging = true
                            
                            if (value.translation.height < (self.reactionSize * -0.5) && value.translation.height > (self.reactionSize * -2.5)) {
                                var id = Int(floor(value.translation.width / (self.reactionSize + self.reactionSpacing)))
                                if (id < self.reactions.count) {
                                    if (id < 0) {
                                        id = 0
                                    }
                                    self.selectedReaction = self.reactions[id]
                                } else {
                                    self.selectedReaction = nil
                                }
                            }
                        }).onEnded({ (value) in
                            self.selectedReaction = nil
                            self.isDragging = false
                        }))
                        .frame(width: self.reactionSize, height: self.reactionSize)
                }
                Spacer()
            }.padding()
        }
    }
}

#if DEBUG
struct FacebookLikeView_Previews : PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            HStack {
                FacebookLikeView()
                Spacer()
                }.padding()
        }
    }
}
#endif
