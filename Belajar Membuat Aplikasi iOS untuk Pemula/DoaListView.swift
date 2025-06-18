//
//  DoaListView.swift
//  Belajar Membuat Aplikasi iOS untuk Pemula
//
//  Created by Farih Muhammad on 18/06/2025.
//

import SwiftUI

struct DoaListView: View {
    let title: String
    let doas: [Doa]
    let favorites: [DoaData]
    
    var body: some View {
        NavigationView {
            List(doas.prefix(100)) { doa in
                NavigationLink(destination: DetailView(doa: doa, savedFavorites: favorites)) {
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: "book")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                            .padding(4)
                        VStack(alignment: .leading) {
                            Text(doa.doa).font(.headline)
                            if let verse = doa.ayat {
                                Text("“\(verse)”").font(.subheadline).lineLimit(1)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle(title)
        }
    }
}

struct DoaListView_Previews: PreviewProvider {
    static var previews: some View {
        DoaListView(title: "Sample Doa List", doas: [], favorites: [])
    }
}
