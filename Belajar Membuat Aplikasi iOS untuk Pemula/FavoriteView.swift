//
//  FavoriteView.swift
//  Belajar Membuat Aplikasi iOS untuk Pemula
//
//  Created by Farih Muhammad on 18/06/2025.
//

import SwiftUI
import CoreData

struct FavoriteView: View {
    @ObservedObject var doaService = DoaService()
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        entity: DoaData.entity(),
        sortDescriptors: []
    ) var favorites: FetchedResults<DoaData>

    var filteredDoa: [Doa] {
        doaService.doaList.filter { doa in
            favorites.contains(where: { $0.id == doa.id })
        }
    }

    var body: some View {
        DoaListView(title: "Favorite Doa", doas: filteredDoa, favorites: Array(favorites))
            .onAppear {
                doaService.fetchData()
            }
    }
}


struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
