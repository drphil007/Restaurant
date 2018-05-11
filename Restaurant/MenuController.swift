//
//  MenuController.swift
//  Restaurant
//
//  Created by Philine Wairata on 11/05/2018.
//  Copyright © 2018 Philine Wairata. All rights reserved.
//

import Foundation

// Network calls in the same protocol and host.
class MenuController {
    let baseURL = URL(string: "https://resto.mprog.nl/")!


/// Function for the request to categories.
func fetchCategories(completion: @escaping ([String]?) -> Void) {
    let categoryURL = baseURL.appendingPathComponent("categories")
    let task = URLSession.shared.dataTask(with: categoryURL) { (data, response, error) in
        if let data = data,
            let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let categories = jsonDictionary?["categories"] as? [String] {
            completion(categories)
        } else {
            completion(nil)
        }
    }
    task.resume()
}

/// Function for the request to menu.
func fetchMenuItems(categoryName: String, completion: @escaping ([MenuItem]?) -> Void) {
    let initialMenuURL = baseURL.appendingPathComponent("menu")
    var components = URLComponents(url: initialMenuURL, resolvingAgainstBaseURL: true)!
    components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
    let menuURL = components.url!
    let task = URLSession.shared.dataTask(with: menuURL) { (data, response, error) in
        if let data = data,
            let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let menuArray = jsonDictionary?["items"] as? [[String: Any]] {
            let menuItems = menuArray.flatMap { MenuItem(json: $0) }
            completion(menuItems)
        } else {
            completion(nil)
        }
    }
    task.resume()
}

///
//func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
//    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//        if let data = data,
//            let image = UIImage(data: data) {
//            completion(image)
//        } else {
//            completion(nil)
//        }
//    }
//    task.resume()
//}

/// Functionn for the POST to order.
func submitOrder(menuIds: [Int], completion: @escaping (Int?) -> Void) {
    let orderURL = baseURL.appendingPathComponent("order")
    var request = URLRequest(url: orderURL)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let data: [String: [Int]] = ["menuIds": menuIds]
    let jsonData = try? JSONSerialization.data(withJSONObject: data, options: [])
    request.httpBody = jsonData
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        if let data = data,
            let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
            let prepTime = jsonDictionary?["preparation_time"] as? Int {
            completion(prepTime)
        } else {
            completion(nil)
        }
    }
    task.resume()
}

}

