//
//  Forecast.swift
//  Forecast
//
//  Created by Laxman Sahni on ३०/९/१८.
//  Copyright © २०१८ Nagarro. All rights reserved.
//

//   let forecast = try? newJSONDecoder().decode(Forecast.self, from: jsonData)

import Foundation

struct Forecast: Codable {
    let status: String
    let data: DataClass
}

struct DataClass: Codable {
    let product1, product2, product3: Int
}
