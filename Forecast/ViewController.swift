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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getForecast()
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
        }
    }
    
}
