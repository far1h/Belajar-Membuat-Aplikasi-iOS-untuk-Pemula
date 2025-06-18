//
//  Belajar_Membuat_Aplikasi_iOS_untuk_PemulaApp.swift
//  Belajar Membuat Aplikasi iOS untuk Pemula
//
//  Created by Farih Muhammad on 22/05/2025.
//

import SwiftUI

@main
struct Belajar_Membuat_Aplikasi_iOS_untuk_PemulaApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                FavoriteView()
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                    }

                AboutView()
                    .tabItem {
                        Label("About", systemImage: "person.circle")
                    }
            }
            .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
