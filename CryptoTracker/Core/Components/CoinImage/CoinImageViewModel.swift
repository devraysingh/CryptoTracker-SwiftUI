//
//  CoinImageViewModel.swift
//  CryptoTracker
//
//  Created by ray on 7/30/23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = true
    
    private let coin: Coin
    private let dataService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        self.addSubscribers()
        self.isLoading = true
    }
    
    private func addSubscribers() {
        dataService.$image.sink { [weak self] (_) in
            self?.isLoading = false
        } receiveValue: { [weak self]  (returnImage) in
            self?.image = returnImage
            
        }.store(in: &cancellables)
        
    }
}
