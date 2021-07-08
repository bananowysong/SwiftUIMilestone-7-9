//
//  Activity.swift
//  SwiftUIMilestone 7-9
//
//  Created by MacBook Pro on 08/07/2021.
//

import Foundation

class ActivityItem: Identifiable, ObservableObject {
    var title: String
    var description: String
    @Published var counter: Int = 0
    var counterString: String {
        String(counter)
    }
    var id = UUID()
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
    }
}

class Acitivities: ObservableObject {
    @Published var items = [ActivityItem]()
    
    init() {
        self.items = []
    }
}


