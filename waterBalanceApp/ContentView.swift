//
//  ContentView.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 17/01/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var store = Store()
    
    var body: some View {
        ZStack {
            if store.showMainApp {
                TabBar()
            } else {
                GoalBeginningScreen(store: store)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store())
    }
}
