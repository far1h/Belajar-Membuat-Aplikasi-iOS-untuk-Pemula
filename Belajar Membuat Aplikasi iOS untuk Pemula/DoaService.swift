//
//  DoaService.swift
//  Belajar Membuat Aplikasi iOS untuk Pemula
//
//  Created by Farih Muhammad on 22/05/2025.
//

import Foundation

class DoaService {
    func fetchDoa(completion: @escaping (Result<[Doa], Error>) -> Void) {
        guard let url = URL(string: "https://doa-doa-api-ahmadramadhan.fly.dev/api") else { return }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                DispatchQueue.main.async { completion(.failure(error)) }
                return
            }

            guard let data = data else { return }

            do {
                let doaList = try JSONDecoder().decode([Doa].self, from: data)
                DispatchQueue.main.async { completion(.success(doaList)) }
            } catch {
                DispatchQueue.main.async { completion(.failure(error)) }
            }
        }.resume()
    }
}
