//
//  ContentView.swift
//  blend
//
//  Created by Dmitiy Myachin on 11.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State var offset: CGSize = .zero
    var body: some View {
        ZStack{
            VStack(spacing: 0) {
                Rectangle().foregroundColor(.white)
                Rectangle().foregroundColor(.pink)
                Rectangle().foregroundColor(.yellow)
                Rectangle().foregroundColor(.black)
            }.ignoresSafeArea()
         Rectangle()
                .foregroundColor(.white)
                .blendMode(.difference)
                .overlay(Rectangle().blendMode(.color))
                .overlay(Rectangle().foregroundColor(.white).blendMode(.overlay))
                .overlay(Rectangle().foregroundColor(.black).blendMode(.overlay))
                .frame(width: 120,height: 120)
                .clipShape(.rect(cornerRadii: .init(topLeading: 20, bottomLeading: 20, bottomTrailing: 20, topTrailing: 20), style: .continuous))
                .offset(offset)
                .gesture(DragGesture().onChanged({ value in
                    offset = value.translation
                }).onEnded({ _ in
                    withAnimation(.interpolatingSpring(duration: 0.6, bounce: 0.4)){
                        offset = .zero
                    }
                }))
        }
    }
}

#Preview {
    ContentView()
}
