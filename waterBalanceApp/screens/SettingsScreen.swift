//
//  SettingsScreen.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 23/01/2022.
//

import SwiftUI

struct SettingsScreen: View {
    @ObservedObject var store: Store
    
    @State var isGoalScreenActive = false
    @State var isRemindScreenActive = false
    @State var isIntakeScreenActive = false
    
    var body: some View {
        ZStack {
            NavigationLink(isActive: $isGoalScreenActive) {
                GoalScreen(store: store, screenType: .mainApp)
            } label: {
                EmptyView()
            }
            
            NavigationLink(isActive: $isRemindScreenActive) {
                RemindScreen(store: store, screenType: .mainApp)
            } label: {
                EmptyView()
            }
            
            NavigationLink(isActive: $isIntakeScreenActive) {
                IntakeScreen(store: store, intakeType: .daily)
            } label: {
                EmptyView()
            }
            
            VStack {
                Text("EDIT")
                    .font(.system(size: 17, weight: .bold, design: .default))
                    .italic()
                    .foregroundColor(MyColors.lightBlue)
                
                VStack {
                    HStack {
                        Text("Daily Intake Level")
                        
                        Spacer()
                        
                        Text("\(store.dailyIntake) ML")
                            .foregroundColor(.gray)
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .onTapGesture {
                                isIntakeScreenActive = true
                            }
                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    HStack {
                        Text("Your goal")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .onTapGesture {
                                isGoalScreenActive = true
                            }
                    }
                    
                    Divider()
                        .padding(.vertical)
                    
                    HStack {
                        Text("Reminder")
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .onTapGesture {
                                isRemindScreenActive = true
                            }
                    }
                }
                    .padding()
                
                Spacer()
            }
        }
            .navigationBarHidden(true)
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen(store: Store())
    }
}
