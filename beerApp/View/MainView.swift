//
//  ContentView.swift
//  beerApp
//
//  Created by Andrea Arizzoli on 05/11/21.
//

import SwiftUI
import Kingfisher
import SwiftUIRefresh

struct MainView: View {
    
    @StateObject var beersData = BeerViewModel()
    @State private var isShowing = false
    
    var body: some View {
        VStack{
            switch beersData.status {
                case "loaded":
                    NavigationView {
                        List {
                            ForEach(beersData.beers, id:\.self) { beer in
                                HStack {
                                    KFImage(URL(string: beer.image_url ?? "https://images.punkapi.com/v2/keg.png"))
                                        .placeholder{
                                            Image("placeholder")
                                        }
                                        .cancelOnDisappear(true)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 75, height: 74)
                                        .cornerRadius(20)
                                    VStack (alignment: .leading, spacing: 2){
                                        Text(beer.name)
                                               .bold()
                                        Spacer()
                                        Text(beer.tagline)
                                            .font(.subheadline).foregroundColor(.gray)
                                    }.padding(.vertical)
                                }.padding(3)
                                
    //                                NavigationLink (destination: item.destination){
    //                                    SectionView(section: item)
    //                                }
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
                    Text("Something went wrong!")
                    //AGGIUGNERE ANIMAZIONE
                default:
                    Text("Loading data")
                    //AGGIUGNERE ANIMAZIONE
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

