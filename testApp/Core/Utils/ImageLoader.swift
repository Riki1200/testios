//
//  ImageLoader.swift
//  testApp
//
//  Created by Romeo Betances on 6/9/22.
//

import Foundation
import SwiftUI

class ImageLoader: ObservableObject { 
    func getImage(urlString:String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                completion(data)
            }
        }
        task.resume()
    }
}
