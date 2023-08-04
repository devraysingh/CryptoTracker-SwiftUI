//
//  DetailView.swift
//  CryptoTracker
//
//  Created by ray on 8/1/23.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: Coin?

    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
    
}



struct DetailView: View {
    @StateObject private var vm: DetailViewModel
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    private let spacing: CGFloat = 30
    
    init(coin: Coin) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("")
                    .frame(height: 150)
                
                Text("Overview")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.theme.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                
                LazyVGrid(columns: columns,
                          alignment: .leading,
                          spacing: spacing,
                          pinnedViews: [],
                          content: {
                    ForEach(0..<6) { _ in
                        StatisticView(stat: StatisticModel(title: "Title", value: "Value"))
                        
                    }
                    
                    }
                )
                Text("Aditional Details")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.theme.accent)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Divider()
                LazyVGrid(columns: columns,
                          alignment: .leading,
                          spacing: spacing,
                          pinnedViews: [],
                          content: {
                    ForEach(0..<6) { _ in
                        StatisticView(stat: StatisticModel(title: "Title", value: "Value"))
                        
                    }
                    
                    }
                )
            }.padding()
        }.navigationTitle(vm.coin.name)
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: dev.coin)
        }
    }
}
