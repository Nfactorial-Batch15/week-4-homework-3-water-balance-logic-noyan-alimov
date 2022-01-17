//
//  FormContainer.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 17/01/2022.
//

import SwiftUI

struct FormContainer<Content: View>: View {
    let height: CGFloat
    var content: Content
    
    public init(height: CGFloat, @ViewBuilder content: () -> Content) {
        self.height = height
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            MyColors.lighterBlue
            content
        }
            .frame(width: 358, height: height, alignment: .center)
            .cornerRadius(16)
    }
}

struct FormContainer_Previews: PreviewProvider {
    static var previews: some View {
        FormContainer(height: 330) {
            Text("hi")
        }
    }
}
