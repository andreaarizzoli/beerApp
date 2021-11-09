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
    @Published var status = "loading"
    private let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Beers.plist")
    
    init() {
        getBeers()
    }


    //MARK: - FETCH DATA
    
    func getBeers(){
        let endpoint = "https://api.punkapi.com/v2/beers"
        let headers: HTTPHeaders = ["Content-Type": "application/json"]
        self.status = "loading"

        AF.request(endpoint, method: .get, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON {response in
            switch response.result {
                case .success(_):
                    do {
                        let jsonDecoder = JSONDecoder()
//                        print("Struttura originale del JSON \(String(data: response.data!, encoding: .utf8)!)")
                        let data = try jsonDecoder.decode([BeerModel].self, from: response.data!)
//                        print("Struttura convertita del JSON \(data)")
                        self.beers = data
//                        self.fakeData()
                        self.status = "loaded"
                        self.saveData()
                    }
                    catch
                    {
                        print("Error decoding item array: \(error)")
                        self.status = "error"
                    }
                case .failure(let error):
                    print("Server error: \(error.localizedDescription)")
                    self.loadData()
            }
        }
    }
    

    //MARK: - FAKE DATA FOR TESTS
    
    func fakeData() {
        beers = [
            BeerModel(id: 1, name: nil, tagline: nil, first_brewed: nil, description: nil, image_url: nil, abv: nil, ibu: nil, srm: nil, food_pairing: nil, brewers_tips: nil)
        ]
    }
    
    
    //MARK: - SAVE DATA
    
    func saveData() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(self.beers)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
    }
    
    
    //MARK: - LOAD DATA
    
    func loadData() {
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do{
                self.beers = try decoder.decode([BeerModel].self, from: data)
                self.status = "loaded"
            }catch {
                print("Error decoding item array, \(error)")
            }
        } else {
            print("No data saved in local!")
            self.status = "error"
        }
    }
}
