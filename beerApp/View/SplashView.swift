//
//  SplashView.swift
//  beerApp
//
//  Created by Andrea Arizzoli on 06/11/21.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200, alignment: .center)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
