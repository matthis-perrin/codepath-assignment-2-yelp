//
//  YelpSearch.swift
//  Yelp
//
//  Created by Matthis Perrin on 2/14/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit


enum YelpSortMode: Int {
    case BestMatched = 0, Distance, HighestRated
}

class YelpSearch: NSObject, CustomDebugStringConvertible {
    var term: String?
    var sort: YelpSortMode = .BestMatched
    var categories: [String] = []
    var deals: Bool = false
    var radius: Float?
    
    init(term: String?, sort: YelpSortMode, categories: [String], deals: Bool, radius: Float?) {
        super.init()
        self.term = term
        self.sort = sort
        self.categories = categories
        self.deals = deals
        self.radius = radius
    }
    
    convenience override init() {
        self.init(term: nil, sort: .BestMatched, categories: [], deals: false, radius: nil)
    }
    
    override var description: String {
        return "term: \(term ?? "")" +
        "\nsort: \(sort)" +
        "\ncategories: \(categories.joinWithSeparator(", "))" +
        "\ndeals: \(deals ? "true" : "false")" +
        "\nradius: \(radius)"
    }
}
