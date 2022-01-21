//
//  ViewController.swift
//  Exchange-MVVM
//
//  Created by Mustafa Gülden on 22.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var eurLabel: UILabel!
    @IBOutlet weak var lakLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var turkishLabel: UILabel!
    
    
    private var exchangeViewModel : ExchangeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getData()
    }
    
    func getData() {
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=9b13da9f1d4fb310cc741972b1967f50")!
                WebService().getCurrencies(url: url) { exchangeRates in
                    if let exchangeRates = exchangeRates {
                        self.exchangeViewModel = ExchangeViewModel(exchange: exchangeRates)
                    }
                }
    }

    @IBAction func getRates(_ sender: Any) {
        let exchange = self.exchangeViewModel.exchange
        if let rates = exchange.rates as? [String: Double]{
            if let cad = rates["CAD"] {
                self.cadLabel.text = "CAD: \(cad)"
            }
            if let eur = rates["EUR"] {
                self.eurLabel.text = "EUR: \(eur)"
            }
            if let lak = rates["LAK"] {
                self.lakLabel.text = "LAK: \(lak)"
            }
            if let jpy = rates["JPY"] {
                self.jpyLabel.text = "JPY: \(jpy)"
            }
            if let usd = rates["USD"] {
                self.usdLabel.text = "USD: \(usd)"
            }
            if let turkishMoney = rates["TRY"] {
                self.turkishLabel.text = "TRY: \(turkishMoney)"
            }
        }
    }
    
   
}

