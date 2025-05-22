//
//  AboutView.swift
//  Belajar Membuat Aplikasi iOS untuk Pemula
//
//  Created by Farih Muhammad on 22/05/2025.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            Image("my_photo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .shadow(radius: 10)

            Text("Farih Muhammad")
                .font(.title)
                .bold()

            Text("iOS Developer from Doha, Qatar")
                .font(.subheadline)

            Spacer()
        }
        .padding()
        .navigationTitle("About Me")
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
