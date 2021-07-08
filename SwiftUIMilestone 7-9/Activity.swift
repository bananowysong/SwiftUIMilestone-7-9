//
//  Activity.swift
//  SwiftUIMilestone 7-9
//
//  Created by MacBook Pro on 08/07/2021.
//

import Foundation

struct ActivityItem: Identifiable, Codable {
    var title: String
    var description: String
    var counter: Int = 0
    var counterString: String {
        String(counter)
    }
    var id = UUID()
    

}

class Acitivities: ObservableObject {
    @Published var items = [ActivityItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Activities") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([ActivityItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        
        self.items = []
    }
}


