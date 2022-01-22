//
//  GoalComponent.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 17/01/2022.
//

import SwiftUI

struct GoalComponent: View {
    @Binding var goal: Goal?
    
    var body: some View {
        VStack {
            Text("What is your goal?")
                .font(.system(size: 36, weight: .bold, design: .default))
            
            FormContainer(height: 330) {
                VStack(alignment: .center, spacing: 14) {
                    GoalRadio(goalEnum: Goal.goalOne, goal: $goal)
                        .onTapGesture {
                            goal = Goal.goalOne
                        }
                    GoalRadio(goalEnum: Goal.goalTwo, goal: $goal)
                        .onTapGesture {
                            goal = Goal.goalTwo
                        }
                    GoalRadio(goalEnum: Goal.goalThree, goal: $goal)
                        .onTapGesture {
                            goal = Goal.goalThree
                        }
                    GoalRadio(goalEnum: Goal.goalFour, goal: $goal)
                        .onTapGesture {
                            goal = Goal.goalFour
                        }
                }
            }
        }
    }
}

struct GoalRadio: View {
    let goalEnum: Goal
    @Binding var goal: Goal?
    
    var body: some View {
        HStack {
            Text(goalEnum.rawValue)
                .font(.system(size: 16, weight: .semibold, design: .default))
            
            Spacer()
            
            ZStack {
                Circle()
                    .strokeBorder(MyColors.blue, lineWidth: 2)
                    .frame(width: 20, height: 20)
                
                if goal == goalEnum {
                    Circle()
                        .fill(MyColors.blue)
                        .frame(width: 12, height: 12)
                }
            }
        }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            .frame(width: 320, height: 60, alignment: .center)
            .background(.white)
            .cornerRadius(16)
    }
}

struct GoalComponent_Previews: PreviewProvider {
    static var previews: some View {
        GoalComponent(goal: .constant(.goalOne))
    }
}
