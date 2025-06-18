//
//  HomeView.swift
//  Belajar Membuat Aplikasi iOS untuk Pemula
//
//  Created by Farih Muhammad on 22/05/2025.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var doaService = DoaService()
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: DoaData.entity(),
        sortDescriptors: []
    ) var favorites: FetchedResults<DoaData>
    
    
    var body: some View {
        DoaListView(title: "Doa Harian", doas: doaService.doaList, favorites: Array(favorites))
            .onAppear {
                doaService.fetchData()
            }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
