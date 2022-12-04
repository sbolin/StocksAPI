//
//  StocksAPIExec.swift
//  
//
//  Created by Scott Bolin on 12/4/22.
//

import Foundation
import StocksAPI

@main
struct StocksAPIExec {

    private static let stocksAPI = StocksAPI()

    static func main() async {
        do {
            print("\n")
            print("################################################")
            print("Quotes")
            let quotes = try await stocksAPI.fetchQuotes(symbols: "AAPL,MSFT,GOOG,TSLA")
            print(quotes)

            print("\n")
            print("################################################")
            print("Ticker")
            let tickers = try await stocksAPI.searchTickers(query: "Apple")
            print(tickers)

            print("\n")
            print("################################################")
            print("Chart Data")
            if let chart = try await stocksAPI.fetchChartData(symbol: "AAPL", range: .oneDay) {
                print(chart)
            }

        } catch {
            print(error.localizedDescription)
        }
    }
}


/*

         // Quote
         let (data, _) = try! await URLSession.shared.data(from: URL(string: "https://query1.finance.yahoo.com/v7/finance/quote?symbols=AAPL,MSFT,GOOG,TSLA")!)
         let quoteResponse = try! JSONDecoder().decode(QuoteResponse.self, from: data)
         print(quoteResponse)

         // Search Symbol
         let (searchData, _) = try! await URLSession.shared.data(from: URL(string: "https://query1.finance.yahoo.com/v1/finance/search?q=Apple")!)
         let searchResponse = try! JSONDecoder().decode(SearchTickerResponse.self, from: searchData)
         print(searchResponse)

         // Chartdata
         let (chartData, _) = try! await URLSession.shared.data(from: URL(string: "https://query1.finance.yahoo.com/v8/finance/chart/AAPL?range=1d&interval=1m&includeTimestamp=true&indicators=quote")!)
         let chartResponse = try! JSONDecoder().decode(ChartResponse.self, from: chartData)
         print(chartResponse)

*/


// Quotes
// "https://query1.finance.yahoo.com/v7/finance/quote?symbols=AAPL,GOOG,MSFT,TSLA"

// Search
// "https://query1.finance.yahoo.com/v1/finance/search?q=Apple"

// Chart Data
// "https://query1.finance.yahoo.com/v8/finance/chart/AAPL?range=1d&interval=1m&includeTimestamp=true&indicators=quote"
// valid range: "1d","5d","1mo","3mo","6mo","1y","2y","5y","10y","ytd","max"
