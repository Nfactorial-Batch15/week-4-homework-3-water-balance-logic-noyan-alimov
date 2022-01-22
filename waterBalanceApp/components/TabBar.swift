//
//  TabBar.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 22/01/2022.
//

import SwiftUI

struct TabBar: View {
    @ObservedObject var store: Store
    
    var body: some View {
        TabView {
            MainScreen(store: store)
                .tabItem {
                    Image(systemName: "house")
                    Text("Main")
                }
                
            
            SettingsScreen(store: store)
                .tabItem {
                    Image(systemName: "slider.horizontal.3")
                    Text("Settings")
                }
            
//            HistoryScreen()
            Text("History")
                .tabItem {
                    Image(systemName: "doc")
                    Text("History")
                }
        }
            .accentColor(MyColors.blue)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(store: Store())
    }
}
