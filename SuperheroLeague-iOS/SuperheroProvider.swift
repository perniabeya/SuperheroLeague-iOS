//
//  SuperheroProvider.swift
//  SuperheroLeague-iOS
//
//  Created by Mañanas on 22/5/25.
//

import Foundation
class SuperheroProvider {
    static func findSuperheroesByName(query: String){
        {
            
            static let API_KEY = "7252591128153666"
            
            static func findSuperheroesByName(query: String) async -> [Superhero] {
                let url = URL(string: "https://www.superheroapi.com/api.php/\(API_KEY)/search/\(query)")
                
                guard let url = url else {
                    print("Error building URL")
                    return []
                }
                
                do {
                    let (data, response) = try await URLSession.shared.data(from: url)
                    let result = try JSONDecoder().decode(SuperheroResponse.self, from: data)
                    
                    return result.results
                } catch {
                    print(error)
                    return []
                }
            }
    
}

