//
//  DictionaryListEditorView.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 26.08.2024.
//

import SwiftUI

struct DictionaryListEditorView: View {
    @Binding var dictionary:[String:Any]
    @State var dictionaryPresenter:[String:Any] = [:]
    @State var pressedDictionaryKey:String? = nil
    @State var pressedStringKey:String? = nil
    @State var pressedArrayKey:String? = nil
    @State var dictionaryID:UUID = .init()

    var body: some View {
        VStack {
            navigationLinks
            VStack(alignment:.leading) {
                ForEach(dictionaryPresenter.keys.sorted(), id: \.self) { key in
                    let value = dictionaryPresenter[key]
                    VStack(alignment:.leading) {
                        if let string = value as? String {
                            Text(key + ": " + string)
                                .onTapGesture {
                                    pressedStringKey = key
                                }
                        } else if let strinArray = value as? [String] {
                            Text(key + " (string array): " + strinArray.joined(separator: ", "))
                                .onTapGesture {
                                    self.pressedArrayKey = key
                                }
                            //to collection view
                        } else if let array = value as? [Any] {
                            Text(key + " is Array: \(array.count)")
                                .onTapGesture {
                                    self.pressedDictionaryKey = key
                                }
                        } else if let dict = value as? [String:Any] {
                            Text(key + " is dictionary: \(dict.count) keys")
                        } else {
                            Text("unrecorded type \(key)")
                        }
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                }
            }
        }
        .onAppear {
            dictionaryPresenter = dictionary
        }
        .onChange(of: dictionaryID) { newValue in
            print("dictionarychanged")
            dictionaryPresenter = dictionary
        }
        
    }
    
    var navigationLinks:some View {
        VStack {
            NavigationLink("dictionary", isActive: isAdditionalDictPresenting) {
                DictionaryListEditorView(dictionary:.init(get: {
                    dictionary[pressedDictionaryKey ?? ""] as? [String:Any] ?? [:]
                }, set: { newDict in
                    print("dictionarychangeBinding")
                    dictionary.updateValue(newDict, forKey: pressedDictionaryKey!)
                    dictionaryID = .init()
                }))
            }
            .hidden()
            NavigationLink("string", isActive: isStringPresenting) {
                TextEditorView(editingText: .init(get: {
                    dictionary[pressedStringKey ?? ""] as? String ?? ""
                }, set: { newString in
                    print("dictionarychangeStringBinding")
                    dictionary.updateValue(newString, forKey: pressedStringKey!)
                    dictionaryID = .init()
                }))
            }
            .hidden()
            NavigationLink("string array", isActive: isArrayPresenting) {
                ArrayEditorView(array: .init(get: {
                    dictionary[pressedArrayKey ?? ""] as? [String] ?? []
                }, set: { newArray in
                    dictionary.updateValue(newArray, forKey: pressedArrayKey ?? "")
                    dictionaryID = .init()
                }))
            }
            .hidden()
        }
    }
}

extension DictionaryListEditorView {
    var isAdditionalDictPresenting:Binding<Bool> {
        .init {
            pressedDictionaryKey != nil
        } set: {
            if !$0 {
                pressedDictionaryKey = nil
            }
        }
    }
    
    var isStringPresenting:Binding<Bool> {
        .init {
            pressedStringKey != nil
        } set: {
            if !$0 {
                pressedStringKey = nil
            }
        }
    }
    
    var isArrayPresenting:Binding<Bool> {
        .init {
            pressedArrayKey != nil
        } set: {
            if !$0 {
                pressedArrayKey = nil
            }
        }
    }
}
