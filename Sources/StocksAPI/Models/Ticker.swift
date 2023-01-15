//
//  Ticker.swift
//  
//
//  Created by Scott Bolin on 12/5/22.
//

import Foundation

public struct Ticker: Codable, Identifiable, Hashable, Equatable {
    public let id = UUID()

    public let symbol: String
    public let quoteType: String?
    public let shortName: String?
    public let longName: String?
    public let sector: String?
    public let industry: String?
    public let exchDisp: String?

    public init(symbol: String, quoteType: String? = nil, shortName: String? = nil, longName: String? = nil, sector: String? = nil, industry: String? = nil, exchDisp: String? = nil) {
        self.symbol = symbol
        self.quoteType = quoteType
        self.shortName = shortName
        self.longName = longName
        self.sector = sector
        self.industry = industry
        self.exchDisp = exchDisp
    }
}
