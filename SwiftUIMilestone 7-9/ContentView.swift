//
//  ContentView.swift
//  SwiftUIMilestone 7-9
//
//  Created by MacBook Pro on 08/07/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = Acitivities()
    @State private var showAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { item in
                    HStack {
                        NavigationLink(destination: ActivityDetailView(activity: item)) {
                            Text(item.title)
                            Spacer()
                            Text(String(item.counterString))
                        }
                    }
                }
            }.navigationTitle(Text("GoalKeeper"))
            .navigationBarItems(trailing:
                Button(action: {
                self.showAddActivity.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
        }.sheet(isPresented: $showAddActivity) {
            AddActivityView(activities: self.activities)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


