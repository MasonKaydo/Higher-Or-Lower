//
//  ContentView.swift
//  Higher Or Lower
//
//  Created by mason kaydo on 11/18/25.
//

import SwiftUI

struct ContentView: View {
    @State var money = 1000
    @State var guess = true
    @State var bet = 1
    var body: some View {
        NavigationView{
            ZStack{
                Image("background")
                    .resizable()
                    .frame(width: 500, height: 1000)
                VStack(){
                    Text("Higher or Lower")
                        .font(Font.largeTitle.bold())
                        .foregroundColor(.white)
                        .padding()
                    NavigationLink("Play", destination: SwiftUIView01())
                    .font(Font.largeTitle.bold())
                    
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
