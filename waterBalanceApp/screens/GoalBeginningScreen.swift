//
//  GoalBeginningScreen.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 17/01/2022.
//

import SwiftUI

struct GoalBeginningScreen: View {
    @ObservedObject var store: Store
    
    @State var isRemindBeginningScreenActive: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                NavigationLink(isActive: $isRemindBeginningScreenActive) {
                    RemindBeginningScreen(store: store)
                } label: {
                    EmptyView()
                }

                VStack {
                    Text("WATER BALANCE")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .italic()
                        .foregroundColor(MyColors.lightBlue)
                        .padding(.bottom, 62)
                    
                    GoalComponent(goal: $store.goal)
                        .padding(.bottom, 116)
                    
                    CustomButton(text: "Next") {
                        isRemindBeginningScreenActive = true
                    }
                }
            }
                .navigationBarHidden(true)
        }
    }
}

struct GoalBeginningScreen_Previews: PreviewProvider {
    static var previews: some View {
        GoalBeginningScreen(store: Store())
    }
}
