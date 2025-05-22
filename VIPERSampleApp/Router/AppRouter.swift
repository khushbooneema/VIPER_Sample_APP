//
//  AppRouter.swift
//  TabNavigator
//
//  Created by Khushboo Neema on 5/21/25.
//
//
//  MoviePresenter.swift
//  TabNavigator
//
//  Created by Khushboo Neema on 5/21/25.
//

import SwiftUI

import SwiftUI

/*
 This class is responsible for managing navigation and routing throughout the application. It serves as the central coordinator for navigating between different screens and tabs.
 */

@Observable
class TabRouter {
    
    // Router for home tab navigation stack
    var homeRoute = HomeRouter()
    
    // Router for settings tab navigation stack
    var settingRoute = SettingRouter()
    
    enum Tab: Int {
        case home = 0
        case settings
    }
    
    var selectedTab = Tab.home.rawValue
    
    func navigate(to tab: Tab) {
        selectedTab = tab.rawValue
    }
}

// Manages navigation within the Home tab
@Observable
class HomeRouter {
    var navigationPath = NavigationPath()
    
    // Defines possible navigation routes within the home tab
    enum Route: Hashable {
        case homeDetail(_ movieId: Int)
    }
    
    func navigate(to route: Route) {
        navigationPath.append(route)
    }
}

// Manages navigation within the Settings tab
@Observable
class SettingRouter {
    var navigationPath = NavigationPath()
    
    /// Defines possible navigation routes within the settings tab
    enum Route: Hashable {
        case profile(_ userId: Int)
        case AboutUS
    }
  
    func navigate(to route: Route) {
        navigationPath.append(route)
    }
}
