//
//  IntakeComponent.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 22/01/2022.
//

import SwiftUI

struct IntakeComponent: View {
    @Binding var intake: String
    
    var body: some View {
        VStack {
            Text("Daily intake?")
                .font(.system(size: 36, weight: .bold, design: .default))
            
            FormContainer(height: 108) {
                HStack {
                    ZStack {
                        Color.white
                        
                        TextField("intake", text: $intake)
                            .keyboardType(.numberPad)
                            .multilineTextAlignment(.center)
                            .foregroundColor(MyColors.blue)
                            .font(.system(size: 16, weight: .bold, design: .default))
                    }
                        .frame(width: 250, height: 60, alignment: .center)
                        .cornerRadius(16)
                    
                    Text("ML")
                        .padding(.trailing, 43)
                        .padding(.leading, 12)
                }
            }
            
        }
    }
}

struct IntakeComponent_Previews: PreviewProvider {
    static var previews: some View {
        IntakeComponent(intake: .constant("10"))
    }
}
