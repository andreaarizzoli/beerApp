//
//  manager.swift
//  beerApp
//
//  Created by Andrea Arizzoli on 06/11/21.
//

import SwiftUI

struct ManagerView: View {
    @State private var start = false
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            if start {
                MainView()
            } else {
                SplashView()
                .onReceive(timer) { input in
                        self.start = true
                }
            }
        }
    }
}

struct manager_Previews: PreviewProvider {
    static var previews: some View {
        ManagerView()
    }
}
