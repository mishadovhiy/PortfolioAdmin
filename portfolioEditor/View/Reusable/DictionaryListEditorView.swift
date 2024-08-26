//
//  DictionaryListEditorView.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 26.08.2024.
//

import SwiftUI

struct DictionaryListEditorView: View {
    @State var dictionary:[String:Any]
    var body: some View {
        VStack {
            VStack {
                ForEach(dictionary.keys.sorted(), id: \.self) { key in
                    let value = dictionary[key]
                    if let string = value as? String {
                        Text(key + ": " + string)
                    } else if let strinArray = value as? [String] {
                        Text(key + ": " + strinArray.joined(separator: ", "))
                        //to collection view
                    } else if let array = value as? [Any] {
                        Text(key + " is Array: \(array.count)")
                    } else {
                        Text("unrecorded type")
                    }
                    
                }
            }
        }
    }
}

