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

    // Immutable template of a full deck. Make sure names match your assets.
    // Note: "10C" instead of "1OC".
    private let fullDeck = [
        "2C","2D","2H","2S",
        "3C","3D","3H","3S",
        "4C","4D","4H","4S",
        "5C","5D","5H","5S",
        "6C","6D","6H","6S",
        "7C","7D","7H","7S",
        "8C","8D","8H","8S",
        "9C","9D","9H","9S",
        "10C","10D","10H","10S",
        "11C","11D","11H","11S",
        "12C","12D","12H","12S",
        "13C","13D","13H","13S",
        "1C","1D","1H","1S"
    ]

    // Mutable working deck
    @State private var cards: [String] = []

    // Holds the currently shown card image name
    @State private var currentCard: String? = nil

    // Bet amount for the next round
    @State private var bet: Double = 10

    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack {
                // Show the current card if available, otherwise a placeholder/back
                if let cardName = currentCard {
                    Image(cardName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 300)
                        .shadow(radius: 8)
                        .padding()
                } else {
                    // Replace "card_back" with your actual card back asset if you have one
                    Image("Red_back")
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 300)
                        .foregroundColor(.white)
                        .opacity(0.8)
                        .padding()
                }

                Spacer()

                // Draw button
                Button {
                    currentCard = drawCard()
                } label: {
                    Text("Draw Card")
                        .font(.title2.bold())
                        .padding(.horizontal, 24)
                        .padding(.vertical, 12)
                        .background(.ultraThinMaterial, in: Capsule())
                }
                .padding(.bottom, 12)

                HStack{
                    Button {
                        higher = false
                    } label: {
                        Text("Higher")
                            .font(.largeTitle)
                            .padding(50)
                    }
                    .controlSize(.large)
                    Button {
                        higher = true
                    } label: {
                        Text("Lower")
                            .font(.largeTitle)
                            .padding(50)
                    }
                    .controlSize(.large)
                }

                Text("Money : \(money)")
                    .font(Font.largeTitle.bold())
                    .foregroundColor(.green)
                    .padding(.bottom, 80) // leave space so it's not covered by the slider inset
            }
        }
        // Persistent bottom area for the bet slider so it always stays visible
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: 8) {
                HStack {
                    Text("Bet: \(Int(bet))")
                        .font(.headline)
                        .foregroundColor(.white)
                    Spacer()
                    Text("Balance: \(money)")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                .padding(.horizontal)

                Slider(
                    value: Binding(
                        get: { min(bet, Double(max(money, 1))) },
                        set: { bet = min($0, Double(max(money, 1))) }
                    ),
                    in: 1...Double(max(money, 1)),
                    step: 1
                )
                .tint(.green)
                .padding(.horizontal)
            }
            .padding(.vertical, 10)
            .background(.ultraThinMaterial)
        }
        .onAppear {
            // Initialize and shuffle the deck when the view appears
            reshuffleDeck()
            // Ensure bet starts within balance
            bet = min(bet, Double(max(money, 1)))
        }
    }

    // Draws a random card from the deck and removes it.
    // If the deck is empty, reshuffles and draws from the fresh deck.
    func drawCard() -> String? {
        if cards.isEmpty {
            reshuffleDeck()
        }
        guard !cards.isEmpty else {
            return nil
        }
        let index = Int.random(in: 0..<cards.count)
        let card = cards[index]
        cards.remove(at: index)
        return card
    }

    // Rebuilds the deck from the template and shuffles it.
    private func reshuffleDeck() {
        cards = fullDeck.shuffled()
    }
}


#Preview {
    SwiftUIView01()
}
