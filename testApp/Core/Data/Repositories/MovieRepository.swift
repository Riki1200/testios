//
//  MovieRepository.swift
//  testApp
//
//  Created by Romeo Betances on 5/9/22.
//

import Foundation



final class MovieRepository<T: Decodable> {
    private let remoteData = HTTP()
    private let url = "https://api.themoviedb.org/3/movie/top_rated?api_key=bf091621962bdf5c30339e874a2a0c1a&language=en-US&page=1"
    var data: Result<T>? = nil
    
    
    func getMovies(completion: @escaping (Result<T>) -> Void){
        let urlSession = URLSession.shared
        let parsetUrl = URL(string: url)
        
        let remote = urlSession.dataTask(with: parsetUrl!) { data, response, error in
            if let _ = error {
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            
            if response.statusCode == 200 {
                guard let data = data else { return  }
                
                DispatchQueue.main.async {
                    do {
                        let decodeData = try JSONDecoder().decode(Result<T>.self, from: data)
                        
                        completion(decodeData)
                    
                    } catch let error {
                        print("\(error)")
                    }
                }
                
                
            }
            
        }
        
        remote.resume()
       
    }
}
