//
//  IntakeScreen.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 22/01/2022.
//

import SwiftUI

struct IntakeScreen: View {
    @Binding var intake: String
    
    var body: some View {
        VStack {
            Text("WATER BALANCE")
                .font(.system(size: 24, weight: .bold, design: .default))
                .italic()
                .foregroundColor(MyColors.lightBlue)
                .padding(.bottom, 62)
            
            IntakeComponent(intake: $intake)
                .padding(.bottom, 77)
            
            CustomButton(text: "Save") {
                print("Tapped")
            }
                .padding(.bottom, 50)
        }
    }
}

struct IntakeScreen_Previews: PreviewProvider {
    static var previews: some View {
        IntakeScreen(intake: .constant("10"))
    }
}
