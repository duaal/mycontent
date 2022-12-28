//
//  DynamicFilteredView.swift
//  my content
//
//  Created by duaa mohammed on 15/12/2022.

import SwiftUI
import CoreData

struct DynamicFilteredView<Content: View, T>: View where T: NSManagedObject {
@FetchRequest var request: FetchedResults<T>
let content: (T)->Content
init (dateToFilter: Date, @ViewBuilder content: @escaping (T)->Content) {
// Intializing Request With NSPredicate
_request = FetchRequest(entity: T.entity(), sortDescriptors: [], predicate: nil)
self.content = content
}
var body: some View {
Group{
if request.isEmpty{
    Text("No tasks found !!!").font(.system(size: 16)).fontWeight(.light).offset(y: 100)
}
    else{
        ForEach(request, id: \.objectID) {object in
            self.content(object)
        }}
}
}
}
