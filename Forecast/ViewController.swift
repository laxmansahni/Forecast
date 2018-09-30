//
//  ViewController.swift
//  Forecast
//
//  Created by Laxman Sahni on ३०/९/१८.
//  Copyright © २०१८ Nagarro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
private let apiManager = APIManager()
private var forecastLazy : Forecast?
private var orderLazy : Order?
 let group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Group our requests:
        group.enter()
        getForecast()
        group.enter()
        getOrder()
        //findProductsDiffForecastVsOrder()
        group.notify(queue: .main) {
            self.outofstock() { _ in (self.forecastLazy)
                
            }
        }
    }


}

extension ViewController {
    
    private func getForecast() {
        apiManager.getForecast() { (forecast, error) in
            if let error = error {
                print("Get forecast error: \(error.localizedDescription)")
                return
            }
            guard let forecast = forecast  else { return }
            print("Current Forecast Object:")
            print(forecast)
            DispatchQueue.main.async {
                // Update the UI
                self.forecastLazy = forecast
            }
            self.group.leave()
        }
    }
    
    private func getOrder()  {
        apiManager.getOrder() { (order, error) in
            if let error = error {
                print("Get order error: \(error.localizedDescription)")
                return
            }
            guard let order = order  else { return }
            print("Current Order Object:")
            print(order)
            DispatchQueue.main.async {
                // Update the UI
                self.orderLazy = order
            }
            self.group.leave()
        }
    }
    
    private func outofstock(completion: ([String]) -> Void) {
        let forecastProducts = self.forecastLazy?.data
        let ordersProducts = self.orderLazy?.data
        var lowerforecastProducts = [String]()
        
        if forecastProducts!.product1 < ordersProducts!.product1{
            lowerforecastProducts.append("product1")
        }
        if forecastProducts!.product2 < ordersProducts!.product2{
            lowerforecastProducts.append("product2")
        }
        
        if forecastProducts!.product3 < ordersProducts!.product3{
            lowerforecastProducts.append("product3")
        }
        print(lowerforecastProducts)
        completion(lowerforecastProducts)
    }
}
