//
//  PickerExample.swift
//  WeSplitApp
//
//  Created by Beliz on 27.07.2023.
//

import SwiftUI

struct PickerExample: View {
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Select a student", selection: $selectedStudent){
                    ForEach(students, id: \.self) { // what identifier makes each student unique-> \.self means the string itself is unique
                        Text($0)
                    }
                }
            }
            .navigationTitle("Hello")
        }
    }
}

struct PickerExample_Previews: PreviewProvider {
    static var previews: some View {
        PickerExample()
    }
}
