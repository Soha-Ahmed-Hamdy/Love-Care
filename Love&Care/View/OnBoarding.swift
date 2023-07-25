//
//  OnBoarding.swift
//  Love&Care
//
//  Created by Soha Ahmed Hamdy on 25/07/2023.
//

import SwiftUI

struct OnBoarding: View {
    
    @AppStorage("isOnBoarding") private var isOnBoarding : Bool = true
    @State var isAnimating : Bool = false
    @State var imageOffset : CGSize = CGSize(width: 0.0, height: 0.0)
    @State var buttonOffset : CGFloat = 0.0
    @State var buttonWidth : CGFloat = UIScreen.main.bounds.width - 80
    let feedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        ZStack{
            VStack{
                
                //MARK: - top
                VStack{
                    Text(imageOffset.width == 0 ? "Care" : "Love")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                    
                    Text("Life doesn't come with a manue, it comes with a mother")
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }// top VStack
                .offset(y: isAnimating ? 0 : -200)
                .animation(.easeOut(duration: 1.5), value: isAnimating)
                
                Spacer()
                
                //MARK: - center
                ZStack{
                    CircleGroup(circleColor: .white)
                        .offset(x: imageOffset.width * -1 )
                        .rotationEffect(.degrees(imageOffset.width / -15))
                        .blur(radius: abs(imageOffset.width) / 5 )
                    Image("happy-pregnant")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                        .offset(x: imageOffset.width, y: 0)
                        .rotationEffect(.degrees(imageOffset.width / 15))
                        .shadow(color: .black.opacity(0.3), radius: 8, x: 3, y: 30)
                        .overlay(
                            Image(systemName: "arrow.left.and.right.circle")
                                .font(.largeTitle)
                                .foregroundColor(.white.opacity(imageOffset.width == 0 ? 1 : 0))
                            ,alignment: .bottom
                        )
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if abs(gesture.translation.width) <= 150{
                                        imageOffset = gesture.translation
                                    }
                                })
                                .onEnded({ gesture in
                                    withAnimation(.easeOut(duration: 0.5)){
                                        imageOffset = .zero
                                    }
                                })
                        )
                        .scaleEffect(isAnimating ? 1 : 0.5)
                        .animation(.easeOut(duration: 1.5), value: isAnimating)
                        
                }// center ZStack
                
                Spacer()
                
                //MARK: - bottom
                ZStack{
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    Text("Start")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    // first circle
                    HStack{
                        Capsule()
                            .fill(Color("red"))
                            .frame(width: 80 + buttonOffset)
                        Spacer()
                    }
                    
                    
                    // circle too dragged
                    HStack{
                        ZStack{
                            Circle()
                                .fill(Color("red"))
                            Circle()
                                .fill(.black.opacity(0.2))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                        }
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if (gesture.translation.width > 0.0) && (buttonOffset <= buttonWidth - 40){
                                        buttonOffset = gesture.translation.width
                                    }
                                })
                                .onEnded({ gesture in
                                    
                                    if buttonOffset >= buttonWidth / 2 {
                                        playSound(sound: "chimeup", type: "mp3")
                                        feedback.notificationOccurred(.success)
                                        isOnBoarding = false
                                    }else{
                                        withAnimation {
                                            buttonOffset = 0.0
                                        }
                                    }
                                    
                                })
                        )
                        Spacer()
                    }
                }// bottom ZStack
                .frame(height: 80)
                .offset(y: isAnimating ? 0 : 200)
                .animation(.easeOut(duration: 1.5), value: isAnimating)
                
            }// Outer VStack
        }// ZStack
        .ignoresSafeArea()
        .padding()
        .background(Color("blue"))
        .onAppear {
            isAnimating.toggle()
        }
        
        
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
