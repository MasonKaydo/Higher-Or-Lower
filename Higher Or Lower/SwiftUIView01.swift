//
//  SwiftUIView01.swift
//  Higher Or Lower
//
//  Created by mason kaydo on 11/18/25.
//

import SwiftUI

struct SwiftUIView01: View {
    @State var money = 1000
    @State var guess = true
    var body: some View {
        ZStack{
            
            Image("background")
                .resizable()
                .frame(width: 500, height: 1000)
            VStack{
                Text("Money : \(money)")
                    .font(Font.largeTitle.bold())
            }
        }
    }
}

#Preview {
    SwiftUIView01()
}
