//
//  SearchTickerResponse.swift
//  
//
//  Created by Scott Bolin on 12/7/22.
//

import Foundation

public struct SearchTickerResponse: Decodable {

    public let data:  [Ticker]?
    public let error: ErrorResponse?

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
