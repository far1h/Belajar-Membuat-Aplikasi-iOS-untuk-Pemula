//
//  DataController.swift
//  Belajar Membuat Aplikasi iOS untuk Pemula
//
//  Created by Farih Muhammad on 18/06/2025.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    var container = NSPersistentContainer(name: "Model")
    
    init(){
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print(error)
            }
        }
    }
}

