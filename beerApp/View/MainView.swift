//
//  ContentView.swift
//  beerApp
//
//  Created by Andrea Arizzoli on 05/11/21.
//

import SwiftUI
import Kingfisher
import SwiftUIRefresh
import Lottie

struct MainView: View {
    
    @StateObject var beersData = BeerViewModel()
    @State private var isShowing = false
    
    var body: some View {
        VStack{
            switch self.beersData.status {
                case "loaded":
                    NavigationView {
                        List {
                            ForEach(self.beersData.beers, id:\.self) { beer in
                                ListItemView(beer: beer)
                            }
                        }
                        .navigationTitle("BEERS")
                        .pullToRefresh(isShowing: $isShowing) {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                self.beersData.getBeers()
                                self.isShowing = false
                            }
                        }
                    }
                case "error":
                    List {
                        LottieView(name: "error", loopMode: .loop)
                            .frame(width: 350, height: 350, alignment: .center)
                        Text("Something went wrong!")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top ,10)
                    }.pullToRefresh(isShowing: $isShowing) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            self.beersData.getBeers()
                            self.isShowing = false
                        }
                    }
                default:
                    LottieView(name: "loading", loopMode: .loop)
                        .frame(width: 200, height: 200, alignment: .center)

            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

