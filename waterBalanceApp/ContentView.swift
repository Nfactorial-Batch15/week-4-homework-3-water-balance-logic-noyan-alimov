//
//  ContentView.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GoalBeginningScreen(goal: .constant(.goalOne))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
