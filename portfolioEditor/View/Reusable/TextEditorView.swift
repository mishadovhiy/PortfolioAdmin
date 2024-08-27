//
//  TextEditorView.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 27.08.2024.
//

import SwiftUI

struct TextEditorView: View {
    @Binding var editingText:String
    var textFieldTitle:String = ""
    var navigationTitle:String = ""
    
    var body: some View {
        TextEditor(text: $editingText)
         //   .navigationTitle(navigationTitle)
    }
}
