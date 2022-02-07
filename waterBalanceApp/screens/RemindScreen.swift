//
//  RemindBeginningScreen.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 18/01/2022.
//

import SwiftUI

struct RemindScreen: View {
    @ObservedObject var store: Store
    let screenType: ScreenType
    
    @Environment(\.presentationMode) var presentationMode
    
//    @State var internalRemindPeriod: RemindPeriod? = nil
    @State var isIntakeScreenActive: Bool = false
    
    var body: some View {
        ZStack {
            NavigationLink(isActive: $isIntakeScreenActive) {
                IntakeScreen(store: store, intakeType: .daily)
            } label: {
                EmptyView()
            }
            
            VStack {
                Text(screenType == .beginning ? "WATER BALANCE" : "REMINDER")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .italic()
                    .foregroundColor(MyColors.lightBlue)
                    .padding(.bottom, 62)
                
                RemindComponent(remindPeriod: $store.remindPeriod)
                
                Spacer()
                
                CustomButton(text: screenType == .beginning ? "Next" : "Save") {
//                    store.remindPeriod = internalRemindPeriod
                    if screenType == .beginning {
                        isIntakeScreenActive = true
                    } else {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                    .padding(.bottom, 50)
            }
//                .onAppear {
//                    internalRemindPeriod = store.remindPeriod
//                }
        }
    }
}

struct RemindScreen_Previews: PreviewProvider {
    static var previews: some View {
        RemindScreen(store: Store(), screenType: .beginning)
    }
}
