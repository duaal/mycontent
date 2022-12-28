//
//  todo.swift
//  my content
//
//  Created by duaa mohammed on 22/12/2022.
//

import SwiftUI

enum Priority: String, Identifiable, CaseIterable {
    
    var id: UUID {
        return UUID()
    }
    
    case tiktok = "TikTok"
    case youtube = "YouTube"
    case other = "Other"
}

extension Priority {
    
    var title: String {
        switch self {
            case .tiktok:
                return "TikTok"
            case .youtube:
                return "YouTube"
            case .other:
                return "Other"
        }
    }
}
struct todo: View {
    @State private var title: String = ""
    @State private var selectedPriority: Priority = .other
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: false)]) private var allTasks: FetchedResults<Task>
    
    private func saveTask() {
        
        do {
            let task = Task(context: viewContext)
            task.title = title
            task.priority = selectedPriority.rawValue
            task.dateCreated = Date()
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    private func styleForPriority(_ value: String) -> Color {
        let priority = Priority(rawValue: value)
        
        switch priority {
            case .tiktok:
                return Color.blue
            case .youtube:
                return Color.red
            case .other:
                return Color.black
            default:
                return Color.gray
        }
    }
    
    private func updateTask(_ task: Task) {
        
        task.isFavorite = !task.isFavorite
        
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = allTasks[index]
            viewContext.delete(task)
            
            do {
                try viewContext.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    var body: some View {
       NavigationView() {
            VStack {
                TextField("Enter title", text: $title)
                    .textFieldStyle(.roundedBorder)
                Picker("Priority", selection: $selectedPriority) {
                    ForEach(Priority.allCases) { priority in
                        Text(priority.title).tag(priority)
                    }
                }.pickerStyle(.segmented)
                
                NavigationLink {
                    Main().navigationBarBackButtonHidden(true)
                                            .onAppear{
                                            saveTask()
                                            }
                    
                } label: {
                    Text("Save")
                        .padding(10)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))

                }

                
                //{
//                   saveTask()
//               //// NavigationLink("save" , destination: Calenderui())
//
//                }

                
                List {
                    
                    ForEach(allTasks) { task in
                        HStack {
                            Circle()
                                .fill(styleForPriority(task.priority!))
                                .frame(width: 15, height: 15)
                            Spacer().frame(width: 20)
                            Text(task.title ?? "")
                            Spacer()
                            Image(systemName: task.isFavorite ? "heart.fill": "heart")
                                .foregroundColor(.red)
                                .onTapGesture {
                                    updateTask(task)
                                }
                        }
                    }.onDelete(perform: deleteTask)
                    
                }
            
          
                
                Spacer()
            }
            .padding()
            .navigationTitle("Add Tasks")
        }    }
}

struct todo_Previews: PreviewProvider {
    static var previews: some View {
        todo()
    }
}
