//
//  TimerView.swift
//  Workout
//
//  Created by blind heitz nathan on 03/03/2022.
//

import SwiftUI

struct TimerView: View {
    
    @State var category: Category = .bike
    
    var body: some View {
        VStack {
            Text(category.rawValue.capitalized)
                .font(.system(size: 16, weight: .regular))
                .foregroundColor(Color.black)
                            
            Spacer()
            
            HStack {
                Text("00")
                    .font(.system(size: 45, weight: .medium))
                    .foregroundColor(Color.black)
                Text(":")
                    .font(.system(size: 45, weight: .medium))
                    .foregroundColor(Color.black)
                Text("00")
                    .font(.system(size: 45, weight: .medium))
                    .foregroundColor(Color.black)
                Text(":")
                    .font(.system(size: 45, weight: .medium))
                    .foregroundColor(Color.black)
                Text("00")
                    .font(.system(size: 45, weight: .medium))
                    .foregroundColor(Color.black)
            }
            .padding()
            
            Text("0 m")
                .font(.system(size: 45, weight: .medium))
                .foregroundColor(Color.black)
            
            Spacer()
            
            Picker("Category", selection: $category) {
                ForEach(Category.allCases, id: \.self) {
                    Image(systemName: $0.icon)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            
            Button {
                
            } label: {
                HStack {
                    Image(systemName: "play.fill")
                    Text("Go")
                }
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.orange)
                .cornerRadius(30)
                .padding(.horizontal, 125)
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
