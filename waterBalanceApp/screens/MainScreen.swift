//
//  MainScreen.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 22/01/2022.
//

import SwiftUI

struct MainScreen: View {
    @ObservedObject var store: Store
    
    @State var isIntakeScreenActive = false
    
    var body: some View {
        GeometryReader { geometry in
            NavigationLink(isActive: $isIntakeScreenActive) {
                IntakeScreen(store: store, intakeType: .current)
            } label: {
                EmptyView()
            }
            
            VStack {
                Text("WATER BALANCE")
                    .font(.system(size: 17, weight: .bold, design: .default))
                    .italic()
                    .foregroundColor(MyColors.lightBlue)
                    
                Spacer()
                
                VStack {
                    ZStack {
                        Circle()
                            .strokeBorder(.white, lineWidth: 4)
                        
                        VStack {
                            Text("\(store.progressPercent)%")
                                .font(.system(size: 36, weight: .bold, design: .default))
                            
                            Text("\(store.currentIntake.count == 0 ? "0" : store.currentIntake) out of \(store.dailyIntake) ML")
                        }
                        
                    }
                        .frame(width: 200, height: 200, alignment: .center)
                        
                        
                    Text(today)
                        .padding(.vertical, 60)
                    
                    Text(store.currentIntakeDouble == 0 ? "Add your first drink for today" : "Great job!")
                        .font(.system(size: 36, weight: .semibold, design: .default))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                }
                    .frame(width: geometry.size.width * 0.94, height: geometry.size.height * 0.5, alignment: .center)
                    .padding(.top, 42)
                    .padding(.bottom, 100)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [MyColors.lighterBlue, .white]), startPoint: .top, endPoint: .bottom)
                    )
                
                Spacer()
                
                CustomButton(text: "Add") {
                    isIntakeScreenActive = true
                }
            }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
        }
            .navigationBarHidden(true)
    }
    
    var today: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        return dateFormatter.string(from: Date())
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen(store: Store())
    }
}
