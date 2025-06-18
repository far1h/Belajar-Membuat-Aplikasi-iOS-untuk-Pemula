//
//  DetailView.swift
//  Belajar Membuat Aplikasi iOS untuk Pemula
//
//  Created by Farih Muhammad on 22/05/2025.
//

import SwiftUI

struct DetailView: View {
    let doa: Doa

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let verse = doa.ayat {
                    Text("“\(verse)”").font(.title3).italic().multilineTextAlignment(.center)
                }
                Text("Latin: \(doa.latin)").padding(.top)
                Text("Arti: \(doa.artinya)").padding(.top)

                Spacer()
            }
            .padding()
        }
        .navigationTitle(doa.doa)
    }
}

