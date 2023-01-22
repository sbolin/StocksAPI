//
//  Ticker.swift
//  
//
//  Created by Scott Bolin on 12/5/22.
//

import Foundation

public struct SearchTickersResponse: Decodable {

    public let error: ErrorResponse?
    public let data: [Ticker]?

    enum CodingKeys: CodingKey {
        case count
        case quotes
        case finance
    }

    enum FinanceKeys: CodingKey {
        case error
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try? container.decodeIfPresent([Ticker].self, forKey: .quotes)
        error = try? container.nestedContainer(keyedBy: FinanceKeys.self, forKey: .finance)
            .decodeIfPresent(ErrorResponse.self, forKey: .error)
    }
}

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
