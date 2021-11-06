//
//  BeerModel.swift
//  beerApp
//
//  Created by Andrea Arizzoli on 05/11/21.
//

import Foundation

struct BeerModel: Hashable, Codable {
    let id : Int
    var name : String
    var tagline : String
    var first_brewed : String
    var description : String
    var image_url : String
}
