//
//  ArrayEditorView.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 27.08.2024.
//

import SwiftUI

struct ArrayEditorView: View {
    @Binding var array:[String]
    @State var selectedIndex:Int? = nil
    
    var body: some View {
        VStack {
            NavigationLink("string", isActive: .init(get: {
                selectedIndex != nil
            }, set: {
                if !$0 {
                    selectedIndex = nil
                }
            })) {
                TextEditorView(editingText: .init(get: {
                    array[selectedIndex ?? 0]
                }, set: { newString in
                    array[selectedIndex ?? 0] = newString
                }))
            }
            .hidden()
            
            let collumns = Array(1..<5).compactMap({ _ in
                GridItem(.flexible(minimum: 50, maximum: 200), spacing: 5)
            })
            LazyVGrid(columns: collumns) {
                ForEach(0..<array.count, id: \.self) { i in
                    let item = array[i]
                    Text(item)
                        .onTapGesture {
                            selectedIndex = i
                        }
                }
            }
        }
    }
}

