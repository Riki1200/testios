//
//  ResultData.swift
//  testApp
//
//  Created by Romeo Betances on 5/9/22.
//

import Foundation


struct Result<T: Decodable> : Decodable {
    
    let results: [Movie]
   
}
