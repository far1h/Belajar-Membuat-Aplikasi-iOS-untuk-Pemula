//
//  HomeView.swift
//  Belajar Membuat Aplikasi iOS untuk Pemula
//
//  Created by Farih Muhammad on 22/05/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = DoaViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading Doa...")
                } else if let error = viewModel.errorMessage {
                    Text("Error: \(error)")
                } else {
                    List(viewModel.doaList.prefix(100)) { doa in
                        NavigationLink(destination: DetailView(doa: doa)) {
                            VStack(alignment: .leading) {
                                Text(doa.doa).font(.headline)
                                if let verse = doa.ayat {
                                    Text("“\(verse)”").font(.subheadline).lineLimit(1)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Doa Harian")
            .onAppear { viewModel.fetchDoa() }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
