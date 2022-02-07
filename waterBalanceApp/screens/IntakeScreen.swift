//
//  IntakeScreen.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 22/01/2022.
//

import SwiftUI

struct IntakeScreen: View {
    @ObservedObject var store: Store
    let intakeType: Intake
    
    @State var intakeInternal: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("WATER BALANCE")
                .font(.system(size: 24, weight: .bold, design: .default))
                .italic()
                .foregroundColor(MyColors.lightBlue)
            
            Spacer()
            
            IntakeComponent(intake: $intakeInternal, intakeType: intakeType)
            
            Spacer()
            
            CustomButton(text: "Save") {
                if intakeType == .daily {
                    store.dailyIntake = intakeInternal
                } else if intakeType == .current {
                    store.incrementCurrIntake(currIntakeStr: intakeInternal)
                }
                presentationMode.wrappedValue.dismiss()
            }
                .padding(.bottom, 50)
        }
    }
}

struct IntakeScreen_Previews: PreviewProvider {
    static var previews: some View {
        IntakeScreen(store: Store(), intakeType: .daily)
    }
}
