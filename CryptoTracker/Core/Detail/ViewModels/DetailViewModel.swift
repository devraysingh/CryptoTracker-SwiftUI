//
//  DetailViewModel.swift
//  CryptoTracker
//
//  Created by ray on 8/1/23.
//

import Foundation
import Combine


class DetailViewModel: ObservableObject {
    
    private let coinDetailServices: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coinDetailServices = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    private func addSubscribers(){
    
        coinDetailServices.$coinDetails
            .sink { (returnedCoinDetails) in
                print("Recived Coin Detail Data")
            }.store(in: &cancellables)
    }
    
}
