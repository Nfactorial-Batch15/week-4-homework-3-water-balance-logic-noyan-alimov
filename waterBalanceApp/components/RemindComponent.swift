//
//  RemindComponent.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 18/01/2022.
//

import SwiftUI

struct RemindComponent: View {
    @Binding var remindPeriod: RemindPeriod?
    
    var body: some View {
        VStack {
            Text("Remind me each")
                .font(.system(size: 36, weight: .bold, design: .default))
            
            FormContainer(height: 330) {
                VStack(alignment: .center, spacing: 14) {
                    HStack(alignment: .center, spacing: 14) {
                        RemindRadio(remindPeriodEnum: .fifteenMins, remindPeriod: $remindPeriod)
                            .onTapGesture {
                                remindPeriod = .fifteenMins
                            }
                        RemindRadio(remindPeriodEnum: .thirtyMins, remindPeriod: $remindPeriod)
                            .onTapGesture {
                                remindPeriod = .thirtyMins
                            }
                    }
                    HStack(alignment: .center, spacing: 14) {
                        RemindRadio(remindPeriodEnum: .fortyFiveMins, remindPeriod: $remindPeriod)
                            .onTapGesture {
                                remindPeriod = .fortyFiveMins
                            }
                        RemindRadio(remindPeriodEnum: .oneHour, remindPeriod: $remindPeriod)
                            .onTapGesture {
                                remindPeriod = .oneHour
                            }
                    }
                    HStack(alignment: .center, spacing: 14) {
                        RemindRadio(remindPeriodEnum: .oneAndHalfHours, remindPeriod: $remindPeriod)
                            .onTapGesture {
                                remindPeriod = .oneAndHalfHours
                            }
                        RemindRadio(remindPeriodEnum: .twoHours, remindPeriod: $remindPeriod)
                            .onTapGesture {
                                remindPeriod = .twoHours
                            }
                    }
                    HStack(alignment: .center, spacing: 14) {
                        RemindRadio(remindPeriodEnum: .threeHours, remindPeriod: $remindPeriod)
                            .onTapGesture {
                                remindPeriod = .threeHours
                            }
                        RemindRadio(remindPeriodEnum: .fourHours, remindPeriod: $remindPeriod)
                            .onTapGesture {
                                remindPeriod = .fourHours
                            }
                    }
                }
            }
        }
    }
}

struct RemindRadio: View {
    let remindPeriodEnum: RemindPeriod
    @Binding var remindPeriod: RemindPeriod?
    
    var body: some View {
        ZStack {
            Text(remindPeriodEnum.rawValue)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(remindPeriod == remindPeriodEnum ? MyColors.blue : .black)
        }
            .padding(.horizontal, 24)
            .padding(.vertical, 16)
            .frame(width: 150, height: 60, alignment: .center)
            .background(.white)
            .cornerRadius(16)
            .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(remindPeriod == remindPeriodEnum ? MyColors.blue : .white, lineWidth: remindPeriod == remindPeriodEnum ? 2 : 0)
            )
            
    }
}

struct RemindComponent_Previews: PreviewProvider {
    static var previews: some View {
        RemindComponent(remindPeriod: .constant(.fourHours))
    }
}
