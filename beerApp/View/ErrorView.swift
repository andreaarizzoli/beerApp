//
//  ErrorView.swift
//  beerApp
//
//  Created by Andrea Arizzoli on 07/11/21.
//

import SwiftUI
import SwiftUIRefresh
import Lottie

struct ErrorView: View {
    
    @State private var isShowing = false
    @StateObject var beersData = BeerViewModel()

    var body: some View {
        VStack {
            Spacer()
            List {
                VStack {
                    LottieView(name: "error", loopMode: .loop)
                        .frame(width: 350, height: 350, alignment: .center)
                    Text("Something went wrong!")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .center)
                }

            }
            .pullToRefresh(isShowing: $isShowing) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.beersData.getBeers()
                    self.isShowing = false
                }
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
