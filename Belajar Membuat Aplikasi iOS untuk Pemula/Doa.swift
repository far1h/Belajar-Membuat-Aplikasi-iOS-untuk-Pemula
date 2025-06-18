//
//  Doa.swift
//  Belajar Membuat Aplikasi iOS untuk Pemula
//
//  Created by Farih Muhammad on 22/05/2025.
//

import Foundation

struct Doa: Identifiable, Decodable {
    let id: String
    let doa: String
    let ayat: String?
    let latin: String
    let artinya: String
}
