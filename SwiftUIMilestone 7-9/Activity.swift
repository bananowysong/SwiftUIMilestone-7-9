//
//  Activity.swift
//  SwiftUIMilestone 7-9
//
//  Created by MacBook Pro on 08/07/2021.
//

import Foundation

struct ActivityItem: Identifiable {
    var title: String
    var description: String
    var counter: Int = 0
    var counterString: String {
        String(counter)
    }
    var id = UUID()
    

}

class Acitivities: ObservableObject {
    @Published var items = [ActivityItem]()
    
    init() {
        self.items = []
    }
}


