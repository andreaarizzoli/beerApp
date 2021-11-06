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
            switch beersData.status {
                case "loaded":
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
                                        Spacer()
                                        Text(beer.tagline)
                                            .font(.subheadline).foregroundColor(.gray)
                                    }.padding(.vertical)
                                }.padding(3)
                                
    //                                NavigationLink (destination: item.destination){
    //                                    SectionView(section: item)
    //                                }
                            }
                        }.navigationTitle("BEERS")
                    }
                case "error":
                    Text("Something went wrong!")
                default:
                    Text("Loading data")
            }
        }
        .onAppear { self.beersData.getBeers() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

