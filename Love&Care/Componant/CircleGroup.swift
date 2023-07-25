//
//  CircleGroup.swift
//  Love&Care
//
//  Created by Soha Ahmed Hamdy on 25/07/2023.
//

import SwiftUI

struct CircleGroup: View {
    
    var circleColor : Color = .gray
    @State var isAnimating : Bool = false
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(circleColor.opacity(0.2), lineWidth: 40)
                .frame(width: 280, height: 280)
            Circle()
                .stroke(circleColor.opacity(0.2), lineWidth: 80)
                .frame(width: 280, height: 280)
        }// ZStack
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1.5), value: isAnimating)
        .onAppear {
            isAnimating.toggle()
        }
    }
}

struct CircleGroup_Previews: PreviewProvider {
    static var previews: some View {
        CircleGroup()
    }
}
