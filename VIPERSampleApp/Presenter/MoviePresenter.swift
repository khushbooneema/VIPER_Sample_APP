//
//  MoviePresenter.swift
//  TabNavigator
//
//  Created by Khushboo Neema on 5/21/25.
//

import SwiftUI

/*
 This class is responsible for managing the presentation logic for movie-related views. It serves as an intermediary between the business logic (interactor) and the UI layer.
*/

protocol MoviePresenterProtocol: AnyObject {
    var interpreter: MovieInteractorProtocol { get set }
    var router: HomeRouter { get set }

    var movies: [Movie] { get set }
    func fetchMovies() async
   
    ///updating UI
    func updateMovies(_ movies: [Movie])
    func showError(_ message: String)
    
    //Routing work
    func navigateToMovieDetailPage(for value: HomeRouter.Route)
}

@Observable
class MoviePresenter: MoviePresenterProtocol {
    
    var interpreter: MovieInteractorProtocol
    var router: HomeRouter
    var movies: [Movie] = []
    
    init(_ router: HomeRouter) {
        self.router = router
        self.interpreter = MovieInteractor()
    }
    
    func fetchMovies() async {
        do {
            movies = try await interpreter.fetchMovies()
            updateMovies(movies)
        } catch {
            print("Error at fetching images", error)
        }
    }
    
    // tell UI view to show the updates
    func updateMovies(_ movies: [Movie]) {
        
    }
    
    func showError(_ message: String) {
        
    }
    
    // tell router to navigate to movieDetailPage
    func navigateToMovieDetailPage(for value:HomeRouter.Route) {
        router.navigate(to: value)
        print("navigated to movie detail page")
    }
}
