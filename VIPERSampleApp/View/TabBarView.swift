//
//  TabBarView.swift
//  TabNavigator
//
//  Created by Khushboo Neema on 5/22/25.
//

import SwiftUI
import Foundation

@main
struct MovieApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
        }
    }
}


struct TabBarView: View {
    @State var tabRouter = TabRouter()
    var body: some View {
        
        TabView(selection: $tabRouter.selectedTab, content: {
            MovieView(presenter: MoviePresenter(tabRouter.homeRoute))
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(TabRouter.Tab.home.rawValue)
            
            SettingsView(settingRoute: $tabRouter.settingRoute)
                .tabItem {
                    Label("Setting", systemImage: "gearshape")
                }
                .tag(TabRouter.Tab.settings.rawValue)
                
        })
    }
}



//settings view
struct SettingsView: View {
    @Binding var settingRoute: SettingRouter
    
    var body: some View {
        Text("Settings")
    }
}
