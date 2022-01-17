//
//  GoalBeginningScreen.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 17/01/2022.
//

import SwiftUI

struct GoalBeginningScreen: View {
    @State var isRemindBeginningScreenActive: Bool = false
    
    @Binding var goal: Goal
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                NavigationLink(isActive: $isRemindBeginningScreenActive) {
                    RemindBeginningScreen(remindPeriod: .constant(.oneAndHalfHours))
                } label: {
                    EmptyView()
                }

                VStack {
                    Text("WATER BALANCE")
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .italic()
                        .foregroundColor(MyColors.lightBlue)
                        .padding(.bottom, 62)
                    
                    GoalComponent(goal: $goal)
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
        GoalBeginningScreen(goal: .constant(.goalOne))
    }
}
