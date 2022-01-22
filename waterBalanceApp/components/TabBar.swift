//
//  TabBar.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 22/01/2022.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
//            MainScreen()
            Text("Main")
                .tabItem {
                    Image(systemName: "house")
                    Text("Main")
                }
                
            
//            SettingsScreen()
            Text("Settings")
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
        TabBar()
    }
}
