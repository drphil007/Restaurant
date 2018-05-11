//
//  MenuItem.swift
//  Restaurant
//
//  Created by Philine Wairata on 11/05/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import Foundation


/// Properties of items within struct correspond to the keys listed in each dictionary from the API.

struct MenuItem: Codable {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var category: String
    var imageURL: URL

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case category
        case imageURL = "image_url"
    }

}

struct MenuItems: Codable {
    let items: [MenuItem]
}

