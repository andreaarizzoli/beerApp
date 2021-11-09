//
//  BeerModel.swift
//  beerApp
//
//  Created by Andrea Arizzoli on 05/11/21.
//

import Foundation

struct BeerModel: Hashable, Codable {
    let id: Int
    var name: String!
    var tagline: String!
    var first_brewed: String!
    var description: String!
    var image_url: String!
    var abv: Float!
    var ibu: Float!
    var srm: Float!
    var food_pairing: [String]!
    var brewers_tips: String!
    
    
    
}


// ADD ingredienti

