//
//  ActivityDetailView.swift
//  SwiftUIMilestone 7-9
//
//  Created by MacBook Pro on 08/07/2021.
//

import SwiftUI

struct ActivityDetailView: View {
    @State var activity: ActivityItem
    @ObservedObject var activities: Acitivities
    
    var body: some View {
        NavigationView {
            VStack() {
                Text(activity.title)
                Text(activity.description)
                Text(activity.counterString)
                Stepper("Tasks completed", onIncrement: {
                    self.activity.counter += 1
                    if let firstIndex = self.activities.items.firstIndex(where: { item in item.id == self.activity.id }) {
                        self.activities.items[firstIndex] = self.activity
                    } else {
                        fatalError()
                    }
                }, onDecrement: {
                    self.activity.counter -= 1
                    if let firstIndex = self.activities.items.firstIndex(where: { item in item.id == self.activity.id }) {
                        self.activities.items[firstIndex] = self.activity
                    } else {
                        fatalError()
                    }
                })
            }
        }
    }
}

//struct ActivityDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ActivityDetailView(activity: ActivityItem(title: "test", description: "test"))
//    }
//}
