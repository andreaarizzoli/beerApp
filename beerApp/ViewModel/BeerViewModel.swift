//
//  BeerViewModel.swift
//  beerApp
//
//  Created by Andrea Arizzoli on 05/11/21.
//

import Foundation
import Alamofire
import SwiftyJSON


class BeerViewModel :ObservableObject {
    
    @Published var beers : [BeerModel] = []
    @Published var isLoading = true
    @Published var error = false //prevedere errore di caricamento dati

    
    func getBeers(){
        
        //ONLY 1 RANDOM BEER ATM //"https://api.punkapi.com/v2/beers?page=2&per_page=\(count)"
        let endpoint = "https://api.punkapi.com/v2/beers"
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        isLoading = true

        AF.request(endpoint, method: .get, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON {response in
                
            switch response.result {
            
            case .success(let value):
                do {
                    let jsonDecoder = JSONDecoder()
//                        print("Struttura originale del JSON \(String(data: response.data!, encoding: .utf8)!)")
                    let data = try jsonDecoder.decode([BeerModel].self, from: response.data!)
//                        print("Struttura convertita del JSON \(data)")
                    DispatchQueue.main.async {
                        self.beers = data
                        self.isLoading = false
                        self.error = false
                    }
                }
                catch
                {
                    print("Errore nella decodifica: \(error)")
                    self.isLoading = false
                    self.error = true

                    
                }
            case .failure(let error):
                print("Errore nella risposta da server: \(error.localizedDescription)")
                self.isLoading = true
                self.savedData()
            }
        }
    }
    

        //DA ELIMINARE  <---------------
    func savedData() {
        beers = [
        BeerModel(id: 1, name: "Peroni", tagline: "-", first_brewed: "-", description: "sldfkasòk", image_url: "fdlòksafjd"),
        BeerModel(id: 2, name: "Nastro Azzurro", tagline: "-", first_brewed: "-", description: "sldfkasòk", image_url: "fdlòksafjd"),
        BeerModel(id: 3, name: "Moretti", tagline: "-", first_brewed: "-", description: "sldfkasòk", image_url: "fdlòksafjd")
        ]
        print("List of beers: \(beers)")
        print("total beer \(beers.count)")
    }
    
}
