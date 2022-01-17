//
//  RemindBeginningScreen.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 18/01/2022.
//

import SwiftUI

struct RemindBeginningScreen: View {
    @Binding var remindPeriod: RemindPeriod
    
    var body: some View {
        VStack {
            Text("WATER BALANCE")
                .font(.system(size: 24, weight: .bold, design: .default))
                .italic()
                .foregroundColor(MyColors.lightBlue)
                .padding(.bottom, 62)
            
            RemindComponent(remindPeriod: $remindPeriod)
                .padding(.bottom, 116)
            
            CustomButton(text: "Next") {
                print("Tapped")
            }
                .padding(.bottom, 50)
        }
    }
}

struct RemindBeginningScreen_Previews: PreviewProvider {
    static var previews: some View {
        RemindBeginningScreen(remindPeriod: .constant(.oneAndHalfHours))
    }
}
