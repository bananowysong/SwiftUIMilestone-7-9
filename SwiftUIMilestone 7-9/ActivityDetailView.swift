//
//  ActivityDetailView.swift
//  SwiftUIMilestone 7-9
//
//  Created by MacBook Pro on 08/07/2021.
//

import SwiftUI

struct ActivityDetailView: View {
    @ObservedObject var activity: ActivityItem
    
    var body: some View {
        NavigationView {
            VStack() {
                Text(activity.title)
                Text(activity.description)
                Text(activity.counterString)
                Stepper("Tasks completed", onIncrement: {
                    self.activity.counter += 1
                }, onDecrement: {
                    self.activity.counter -= 1
                })
            }
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView(activity: ActivityItem(title: "test", description: "test"))
    }
}
