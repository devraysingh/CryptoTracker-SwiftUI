//
//  DetailViewModel.swift
//  CryptoTracker
//
//  Created by ray on 8/1/23.
//

import Foundation
import Combine


class DetailViewModel: ObservableObject {
    
    let coin: Coin
    private let coinDetailServices: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    @Published var overviewStatistics: [StatisticModel] = []
    @Published var additionalStatistics: [StatisticModel] = []
    
    
    

    init(coin: Coin) {
        self.coin = coin
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
