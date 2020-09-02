//
//  ContentView.swift
//  AnimatableDataAnimation
//
//  Created by JT3 on 2020/09/02.
//  Copyright © 2020 JT. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var diamondWidth: CGFloat = 100
    var body: some View {
        Diamond(width: diamondWidth)
            .onTapGesture {
                withAnimation(.linear(duration: 2)) {
                    self.diamondWidth = CGFloat.random(in: 100...300)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Diamond: Shape, Animatable {
    var width: CGFloat
    
    var animatableData: CGFloat {
        get {
            print("get \(self.width)")
            return self.width
        }
        set {
            print("set \(self.width) -> \(newValue)")
            self.width = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        print("path called. width: \(width)")
        let point1 = CGPoint(x: rect.midX, y: rect.minY)
        let point2 = CGPoint(x: rect.midX - width / 2, y: rect.midY)
        let point3 = CGPoint(x: rect.midX, y: rect.maxY)
        let point4 = CGPoint(x: rect.midX + width / 2, y: rect.midY)
        
        var p = Path()
        p.move(to: point1)
        p.addLine(to: point2)
        p.addLine(to: point3)
        p.addLine(to: point4)
        
        return p
    }
}
