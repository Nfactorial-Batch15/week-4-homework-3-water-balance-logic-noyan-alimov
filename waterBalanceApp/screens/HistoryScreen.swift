//
//  HistoryScreen.swift
//  waterBalanceApp
//
//  Created by Noyan Alimov on 23/01/2022.
//

import SwiftUI

struct HistoryScreen: View {
    let history: [ResultForDay]
    
    var body: some View {
        ScrollView {
            VStack {
                Text("HISTORY")
                    .font(.system(size: 17, weight: .bold, design: .default))
                    .italic()
                    .foregroundColor(MyColors.lightBlue)
                
                ForEach(history, id: \.date) { resultForDay in
                    ResultForDayComponent(resultForDay: resultForDay)
                }
                
                Spacer()
            }
        }
    }
}

struct HistoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        HistoryScreen(history: [ResultForDay(date: "23.01.22", waterIntakes: [WaterIntake(intake: "250", time: "12:13"), WaterIntake(intake: "100", time: "10:12")]), ResultForDay(date: "20.01.22", waterIntakes: [WaterIntake(intake: "50", time: "09:20"), WaterIntake(intake: "400", time: "16:10")])])
    }
}
