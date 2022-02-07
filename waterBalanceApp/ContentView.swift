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
        NavigationView {
            ZStack {
                if store.showMainApp {
                    TabBar(store: store)
                } else {
                    GoalScreen(store: store, screenType: .beginning)
                }
            }
        }
            .onAppear {
                store.onStart()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: Store())
    }
}
