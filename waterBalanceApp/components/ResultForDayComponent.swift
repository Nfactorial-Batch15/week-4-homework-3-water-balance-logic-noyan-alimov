//
//  ResultForDayComponent.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 23/01/2022.
//

import SwiftUI

struct ResultForDayComponent: View {
    let resultForDay: ResultForDay
    
    var body: some View {
        VStack {
            HStack {
                Text(getTodaysDate() == resultForDay.date ? "Today" : resultForDay.date)
                    .font(.system(size: 20, weight: .bold, design: .default))
                
                Spacer()
            }
                .padding(.bottom)
            
            ForEach(resultForDay.waterIntakes) { waterIntake in
                HStack {
                    Text("\(waterIntake.intake) ml")
                    
                    Spacer()
                    
                    Text(waterIntake.time)
                        .foregroundColor(.gray)
                }
                
                Divider()
                    .padding(.bottom)
            }
        }
        .padding()
    }
}

struct ResultForDayComponent_Previews: PreviewProvider {
    static var previews: some View {
        ResultForDayComponent(resultForDay: ResultForDay(date: "23.01.22", waterIntakes: [WaterIntake(intake: "250", time: "12:13"), WaterIntake(intake: "100", time: "10:12")]))
    }
}
