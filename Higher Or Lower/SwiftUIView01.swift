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
    @State var higher = true
    @State var cards = ["2C,2D,2H,2S,3C,3D,3H,3S,4C,4D,4S,4H,5S,5H,5C,5D,6C,6S,6H,6D,7C,7H,7S,7D,8D,8C,8H,8S,9C,9D,9H,9S,10H,10S,10D,1OC,11C,11D,11H,11S,12C,12D,12H,12S,13C,13D,13H,13S,1C,1D,1H,1S"]
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            //fills the area
        //expands image past the actually phone screen
            VStack{
                Image("")
                Spacer()
                HStack{
                    Button() {
                        higher = false
                    }label: {
                        Text("Higher")
                            .font(.largeTitle)
                            .padding(50)
                    }
                    .controlSize(.large)
                    Button() {
                        higher = true
                    }label: {
                        Text("Lower")
                            .font(.largeTitle)
                            .padding(50)
                    }
                    .controlSize(.large)
                }
                Text("Money : \(money)")
                    .font(Font.largeTitle.bold())
                    .foregroundColor(.green)
            }
        }
    }
    func drawCard() -> String {
        let index = Int.random(in: 0..<cards.count)
            let card = cards[index]
            cards.remove(at: index)
            return card
        }
}


#Preview {
    SwiftUIView01()
}
