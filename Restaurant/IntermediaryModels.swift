//
//  IntermediaryModels.Swift
//  Restaurant
//
//  Created by Philine Wairata on 12/05/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreperationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preperation_time"
    }
}

