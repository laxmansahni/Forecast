//
//  APIManager.swift
//  Forecast
//
//  Created by Laxman Sahni on ३०/९/१८.
//  Copyright © २०१८ Nagarro. All rights reserved.
//

import Foundation

class APIManager {
    let stubForecastDataURL = "https://raw.githubusercontent.com/laxmansahni/Forecast/master/Forecast/StubData/Forecast.json"
    let stubOrderDataURL = "https://raw.githubusercontent.com/laxmansahni/Forecast/master/Forecast/StubData/Order.json"
    
    func getForecast(completion: @escaping (_ forecast: Forecast?, _ error: Error?) -> Void) {
        getJSONFromURL(urlString: stubForecastDataURL) { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return completion(nil, error)
            }
            self.createForecastObjectWith(json: data, completion: { (forecast, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completion(nil, error)
                }
                return completion(forecast, nil)
            })
        }
    }
    
    func getOrder(completion: @escaping (_ order: Order?, _ error: Error?) -> Void) {
        getJSONFromURL(urlString: stubOrderDataURL) { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return completion(nil, error)
            }
            self.createOrderObjectWith(json: data, completion: { (order, error) in
                if let error = error {
                    print("Failed to convert data")
                    return completion(nil, error)
                }
                return completion(order, nil)
            })
        }
    }
    
}

extension APIManager {
    private func getJSONFromURL(urlString: String, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            print("Error: Cannot create URL from string")
            return
        }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
            guard error == nil else {
                print("Error calling api. Server error")
                return completion(nil, error)
            }
            guard let responseData = data else {
                print("Data is nil")
                return completion(nil, error)
            }
            completion(responseData, nil)
        }
        task.resume()
    }
    
    private func createForecastObjectWith(json: Data, completion: @escaping (_ data: Forecast?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let forecast = try decoder.decode(Forecast.self, from: json)
            return completion(forecast, nil)
        } catch let error {
            print("Error creating forecast from JSON because: \(error.localizedDescription)")
            return completion(nil, error)
        }
    }
    
    private func createOrderObjectWith(json: Data, completion: @escaping (_ data: Order?, _ error: Error?) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let forecast = try decoder.decode(Order.self, from: json)
            return completion(forecast, nil)
        } catch let error {
            print("Error creating order from JSON because: \(error.localizedDescription)")
            return completion(nil, error)
        }
    }
}

