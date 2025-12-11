//
//  Rules.swift
//  Higher Or Lower
//
//  Created by mason kaydo on 12/9/25.
//

import SwiftUI

struct Rules: View {
    var body: some View {
        Text("A starting card or number is shown.You guess “Higher” or “Lower.The next card/number is revealed.If your guess is correct, you keep going.If your guess is wrong, the round ends.Ties: The new card/number is the same → usually a loss (unless the version says otherwise). The goal is to get the most correct guesses in a row or reach a target score.")
    }
}

#Preview {
    Rules()
}
