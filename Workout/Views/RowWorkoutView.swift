//
//  RowWorkoutView.swift
//  Workout
//
//  Created by blind heitz nathan on 03/03/2022.
//

import SwiftUI

struct RowWorkoutView: View {
    
    let category: Category
    let date: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: category.icon)
                Text(date)
            }
        }
    }
}

struct RowWorkoutView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Workout.testData) { workout in
            RowWorkoutView(category: workout.categogy, date: workout.getFormattedDate())
                .previewLayout(.sizeThatFits)
        }
    }
}
