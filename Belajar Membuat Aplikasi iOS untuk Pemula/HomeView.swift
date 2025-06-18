//
//  HomeView.swift
//  Belajar Membuat Aplikasi iOS untuk Pemula
//
//  Created by Farih Muhammad on 22/05/2025.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var doaService = DoaService()
    
    var body: some View {
        NavigationView {
            List(doaService.doaList.prefix(100)) { doa in
                NavigationLink(destination: DetailView(doa: doa)) {
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
            .navigationTitle("Doa Harian")
            .onAppear { doaService.fetchData() }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
