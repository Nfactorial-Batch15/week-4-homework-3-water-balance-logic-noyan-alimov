//
//  CustomButton.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 18/01/2022.
//

import SwiftUI

struct CustomButton: View {
    let text: String
    let onTap: () -> Void
    
    var body: some View {
        ZStack {
            MyColors.blue
            Text(text)
                .foregroundColor(.white)
                .font(.system(size: 22, weight: .semibold, design: .default))
        }
            .frame(width: 358, height: 60, alignment: .center)
            .cornerRadius(16)
            .onTapGesture(perform: onTap)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(text: "Next") {
            print("Tapped")
        }
    }
}
