//
//  DoaService.swift
//  Belajar Membuat Aplikasi iOS untuk Pemula
//
//  Created by Farih Muhammad on 22/05/2025.
//

import Foundation

class DoaService: ObservableObject {
    
    @Published var doaList: [Doa] = []
    
    func fetchData(){
        if let url = URL(string: "https://doa-doa-api-ahmadramadhan.fly.dev/api") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let decodedData = try decoder.decode([Doa].self, from: safeData)
                            DispatchQueue.main.async {
                                self.doaList = decodedData
                            }
                        } catch {
                            print(error)
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
}
