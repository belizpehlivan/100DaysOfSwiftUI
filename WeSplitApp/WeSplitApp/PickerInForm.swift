//
//  PickerInForm.swift
//  WeSplitApp
//
//  Created by Beliz on 28.07.2023.
//

import SwiftUI

struct PickerInForm: View {
    enum Flavor: String, CaseIterable, Identifiable {
        case chocolate, vanilla, strawberry
        var id: Self { self }
    }


    @State private var selectedFlavor: Flavor = .chocolate
    
    var body: some View {
        NavigationView {
            List {
                Picker("Flavor", selection: $selectedFlavor) {
                    Text("Chocolate").tag(Flavor.chocolate)
                    Text("Vanilla").tag(Flavor.vanilla)
                    Text("Strawberry").tag(Flavor.strawberry)
                }
            }
        }
    }
}

struct PickerInForm_Previews: PreviewProvider {
    static var previews: some View {
        PickerInForm()
    }
}
