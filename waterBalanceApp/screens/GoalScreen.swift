//
//  GoalBeginningScreen.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 17/01/2022.
//

import SwiftUI

struct GoalScreen: View {
    @ObservedObject var store: Store
    let screenType: ScreenType
    
    @Environment(\.presentationMode) var presentationMode
    
//    @State var internalGoal: Goal? = nil
    @State var isRemindScreenActive: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationLink(isActive: $isRemindScreenActive) {
                RemindScreen(store: store, screenType: screenType)
            } label: {
                EmptyView()
            }

            VStack {
                Text(screenType == .beginning ? "WATER BALANCE" : "THE GOAL")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .italic()
                    .foregroundColor(MyColors.lightBlue)
                    .padding(.bottom, 62)
                
                GoalComponent(goal: $store.goal)
                    .padding(.bottom, 116)
                
                CustomButton(text: screenType == .beginning ? "Next" : "Save") {
//                    store.goal = internalGoal
                    if screenType == .beginning {
                        isRemindScreenActive = true
                    } else {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
            .navigationBarHidden(screenType == .beginning ? true : false)
//            .onAppear {
//                internalGoal = store.goal
//            }
    }
}

struct GoalScreen_Previews: PreviewProvider {
    static var previews: some View {
        GoalScreen(store: Store(), screenType: .beginning)
    }
}
