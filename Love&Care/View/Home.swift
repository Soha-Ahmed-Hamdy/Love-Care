//
//  Home.swift
//  Love&Care
//
//  Created by Soha Ahmed Hamdy on 25/07/2023.
//

import SwiftUI

struct Home: View {
    
    @AppStorage("isOnBoarding") private var isOnBoarding : Bool = false
    @State var isAnimating : Bool = false
    let feedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        VStack(alignment: .center, spacing: 30){
            ZStack{
                CircleGroup(circleColor: .gray)
                Image("baby-boy")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .offset(y: isAnimating ? 30 : -30 )
                    .animation(.easeOut(duration: 2.5).repeatForever(autoreverses: true), value: isAnimating)
            }
            
            
            Text("Having children just puts the whole world into perspective. Everthing else just disappears")
                .padding()
                .font(.system(size: 20))
                .fontWeight(.light)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            
            Button{
                playSound(sound: "success", type: "m4a")
                feedback.notificationOccurred(.success)
                isOnBoarding.toggle()
            } label: {
                
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(size: 25, design: .rounded))
                    .fontWeight(.heavy)
                
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            
        }//outer VStack
        .onAppear {
            isAnimating.toggle()
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
