//
//  manager.swift
//  beerApp
//
//  Created by Andrea Arizzoli on 06/11/21.
//

import SwiftUI

struct ManagerView: View {
//    @EnvironmentObject var model: ModelView
    @ObservedObject var beerData = BeerViewModel()
    @State private var flagStart = false
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
       
        ZStack{
            if self.flagStart
            {
//                MenuView().environmentObject(self.model)
                MainView()
                    .transition(AnyTransition.slide)
                    .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
            } else {
                SplashView()
                    .onReceive(timer) { input in
                        self.flagStart = true
                }
                .zIndex(1)
            }
            
        }
//        .onAppear {
//            self.beerData.getBeers()
//        }
            
        
    }
}

struct manager_Previews: PreviewProvider {
    static var previews: some View {
        ManagerView()
    }
}
