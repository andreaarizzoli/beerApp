//
//  DetailView.swift
//  beerApp
//
//  Created by Andrea Arizzoli on 07/11/21.
//

import SwiftUI
import Kingfisher


struct DetailView: View {
    
    @State var beer: BeerModel
    
    var body: some View {
        ScrollView {
            KFImage(URL(string: beer.image_url ?? "https://images.punkapi.com/v2/keg.png"))
                .placeholder{
                    Image("placeholder")
                    Text("Loading")
                }
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .cornerRadius(20)
            Text(beer.name ?? "Name not available")
                .font(.title)
                .padding(.top ,25)
            Text(beer.tagline ?? "Tagline not available")
                .font(.headline)
                .padding(.top ,15)
            HStack {
                Text("IBU \(String(beer.ibu ?? 0))")
                Text("Alc. \(String(beer.abv ?? 0))%")
                    .padding(.horizontal ,30)
                Text("SRM \(String(beer.srm ?? 0))")
            }
            .font(.headline)
            .padding(.top ,15)
            VStack (alignment: .center){
                Text(beer.description ?? "Description not available")
                    .fontWeight(.light)
                    .padding(.top ,10)
                Text("Food pairing:")
                    .fontWeight(.bold)
                    .padding(.vertical ,15)
                if beer.food_pairing == nil {
                    Text("Food pairing not available")
                        .fontWeight(.light)
                } else {
                    ForEach( beer.food_pairing, id:\.self) { tip in
                        Text(tip)
                            .fontWeight(.light)
                    }
                }
                Text("Brewers tip:")
                    .fontWeight(.bold)
                    .padding(.vertical ,15)
                Text(beer.brewers_tips ?? "Brewers tip not available")
                    .fontWeight(.light)
            }.font(.subheadline)

            
            
 
        }.padding(.horizontal ,15)

    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
