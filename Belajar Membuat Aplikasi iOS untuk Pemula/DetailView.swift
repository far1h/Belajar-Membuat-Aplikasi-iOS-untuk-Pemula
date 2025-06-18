//
//  DetailView.swift
//  Belajar Membuat Aplikasi iOS untuk Pemula
//
//  Created by Farih Muhammad on 22/05/2025.
//

import SwiftUI

struct DetailView: View {
    let doa: Doa
    let savedFavorites: [DoaData]
    
    @Environment(\.managedObjectContext) var moc
    
    var isFavorite: Bool {
        savedFavorites.contains(where: { $0.id == doa.id })
    }
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let verse = doa.ayat {
                    Text("“\(verse)”").font(.title3).italic()
                }
                Text("Latin: \(doa.latin)").padding(.top)
                Text("Arti: \(doa.artinya)").padding(.top)
                Button {
                    toggleFavorite()
                } label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundColor(isFavorite ? .red : .gray)
                        .font(.title2)
                }
                
            }
            .padding()
        }
        .navigationTitle(doa.doa)
    }
    
    func toggleFavorite() {
            if isFavorite {
                // Delete all matching
                for item in savedFavorites where item.id == doa.id {
                    moc.delete(item)
                }
            } else {
                let newItem = DoaData(context: moc)
                newItem.id = doa.id
            }

            try? moc.save()
        }

}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleDoa = Doa(id: "1", doa: "Doa Contoh", ayat: "Contoh Ayat", latin: "Contoh Latin", artinya: "Contoh Arti")
        DetailView(doa: sampleDoa, savedFavorites: [])
    }
}

