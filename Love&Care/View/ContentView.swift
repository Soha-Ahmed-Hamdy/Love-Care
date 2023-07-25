//
//  ContentView.swift
//  Love&Care
//
//  Created by Soha Ahmed Hamdy on 25/07/2023.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("isOnBoarding") private var isOnBoarding : Bool = true
    
    var body: some View {
        if isOnBoarding{
            OnBoarding()
        }else{
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
