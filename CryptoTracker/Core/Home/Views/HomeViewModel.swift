//
//  HomeViewModel.swift
//  CryptoTracker
//
//  Created by ray on 7/29/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] (coins) in
                self?.allCoins = coins
            }.store(in: &cancellables)
    }
}

