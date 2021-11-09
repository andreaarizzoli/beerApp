//
//  ItemView.swift
//  beerApp
//
//  Created by Andrea Arizzoli on 07/11/21.
//

import SwiftUI
import Kingfisher
import SwiftUIRefresh
import Lottie

struct ListItemView: View {
    
    @State var beer: BeerModel
    
    var body: some View {
        
        NavigationLink (destination: DetailView(beer: beer)){
            HStack {
                KFImage(URL(string: beer.image_url ?? "https://images.punkapi.com/v2/keg.png"))
                    .placeholder{
                        Image("placeholder")
                        Text("Loading")
                            .font(.subheadline) 
                    }
                    .cancelOnDisappear(true)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 75, height: 74)
                    .cornerRadius(20)
                VStack (alignment: .leading, spacing: 2){
                    Text(beer.name ?? "Name not available")
                        .bold()
                    Spacer()
                    Text(beer.tagline ?? "Tagline not available")
                        .font(.subheadline).foregroundColor(.gray)
                }.padding(.vertical)
            }.padding(3)
        }
    }
}

//struct ItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemView()
//    }
//}
