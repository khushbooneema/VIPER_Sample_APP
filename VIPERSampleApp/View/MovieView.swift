//
//  Untitled.swift
//  TabNavigator
//
//  Created by Khushboo Neema on 5/21/25.
//

import SwiftUI

/*
 This SwiftUI view is responsible for displaying movie content to the user. It represents the UI layer in the application's architecture, receiving data from the presenter and rendering it appropriately.
*/

struct MovieView: View {
    @State var presenter: MoviePresenterProtocol
    
    init(presenter: MoviePresenterProtocol) {
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationStack(path: $presenter.router.navigationPath, root: {
            List(presenter.movies, id: \.id, rowContent: { movie in
                Button(movie.name) {
                    presenter.navigateToMovieDetailPage(for: .homeDetail(movie.id))
                }
            })
            .navigationDestination(for: HomeRouter.Route.self, destination: { route in
                if case .homeDetail(_) = route {
                    MovieDetailView()
                }
            })
        })
        .task {
            await fetchMovies()
        }
    }
    
    // MovieViewProtocol
    func fetchMovies() async {
        await presenter.fetchMovies()
        
        print("Movies fetched successfully!", presenter.movies.count)
    }
}

