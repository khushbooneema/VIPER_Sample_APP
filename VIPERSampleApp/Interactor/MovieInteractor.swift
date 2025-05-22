//
//  MovieInteractor.swift
//  TabNavigator
//
//  Created by Khushboo Neema on 5/21/25.
//

import Foundation

/*
 This class is responsible for implementing the business logic related to movie data. It acts as a mediator between the data layer(repositories, API service) and presentation logic
 */
protocol MovieInteractorProtocol {
    func fetchMovies() async throws -> [Movie]
    func fetchMoviesDetails(_ id: Int) async throws
}

class MovieInteractor: MovieInteractorProtocol {
    
    func fetchMovies() async throws -> [Movie] {
        //Read the data stored in the json file
        
        guard let filename = Bundle.main.url(forResource: "movieData", withExtension: ".json") else { return [] }
        let data = try Data(contentsOf: filename)
        let decoder = JSONDecoder()
        let movies: [Movie] = try decoder.decode([Movie].self, from: data)
       
        return movies
    }
    
    func fetchMoviesDetails(_ id: Int) async throws { }
}
