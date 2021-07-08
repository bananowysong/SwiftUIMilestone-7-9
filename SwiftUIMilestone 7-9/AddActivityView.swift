//
//  SwiftUIView.swift
//  SwiftUIMilestone 7-9
//
//  Created by MacBook Pro on 08/07/2021.
//

import SwiftUI

struct AddActivityView: View {
    @ObservedObject var activities: Acitivities
    @State private var title = ""
    @State private var description = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Title of the activity", text: $title)
                TextField("Description", text: $description)
            }.navigationBarTitle(Text("Add new Activity"))
                .navigationBarItems(trailing:
                                        Button(action: {
                    guard !title.isEmpty else { return }
                    var item = ActivityItem(title: self.title, description: self.description)
                    self.activities.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                })
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        AddActivityView(activities: Acitivities())
    }
}
