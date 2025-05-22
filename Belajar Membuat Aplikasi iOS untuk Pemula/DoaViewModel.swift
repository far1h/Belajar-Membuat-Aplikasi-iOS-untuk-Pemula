//
//  DoaViewModel.swift
//  Belajar Membuat Aplikasi iOS untuk Pemula
//
//  Created by Farih Muhammad on 22/05/2025.
//

import Foundation

class DoaViewModel: ObservableObject {
    @Published var doaList: [Doa] = []
    @Published var isLoading = true
    @Published var errorMessage: String?

    private let service = DoaService()

    func fetchDoa() {
        isLoading = true
        errorMessage = nil

        service.fetchDoa { result in
            self.isLoading = false
            switch result {
            case .success(let list):
                self.doaList = list
            case .failure(let error):
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
