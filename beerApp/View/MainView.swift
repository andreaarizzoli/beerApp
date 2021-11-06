//
//  ContentView.swift
//  beerApp
//
//  Created by Andrea Arizzoli on 05/11/21.
//

import SwiftUI
import Kingfisher


struct MainView: View {
    
    @StateObject var beersData = BeerViewModel()
    
    var body: some View {
        VStack{
            
            if beersData.isLoading {
                Text("Loading data")
            } else {
                NavigationView {
                    List {
                        ForEach(beersData.beers, id:\.self) { beer in
                            HStack {
                                KFImage(URL(string: beer.image_url)!)
                                    .placeholder{
                                        background(Color .gray)
                                    }
//                                    .cancelOnDisappear(true)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 75, height: 74)
                                    .cornerRadius(20)
                                VStack (alignment: .leading, spacing: 2){
                                    Text(beer.name)
                                           .bold()
                                        .font(.system(size: 22))
                                    Spacer()
                                    Text(beer.tagline)
                                        .font(.system(size: 16))

                                }.padding(.vertical)
                                
                             
                            }.padding(3)
                            
//                                NavigationLink (destination: item.destination){
//                                    SectionView(section: item)
//                                }
                        }
                    }
                    .navigationTitle("BEERS")
                }
            }
        }
        .onAppear {
            self.beersData.getBeers()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

