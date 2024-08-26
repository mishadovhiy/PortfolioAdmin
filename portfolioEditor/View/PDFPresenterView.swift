//
//  PDFGeneratorView.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 25.08.2024.
//

import SwiftUI
struct PDFGeneratorViewModel {
    
}
struct PDFPresenterView: View {
    let pdfInput:PDFInput
    
    var body: some View {
        VStack {
            topContent
            HStack(spacing:30) {
                workExperience
                    .frame(width: pdfInput.pageWidth * 0.7)
                skills
            }
        }
        .onAppear(perform: {
            print(pdfInput.content?.projectList, " gtrsfeda")
            print(pdfInput.content?.skills, " gterfwd")
        })
        .padding(30)
    }
    
    var topContent: some View {
        VStack {
            pdfTitle
            Spacer()
        }
    }
    
    var workExperience: some View {
        Text("work")
    }
    
    var skills: some View {
        Text("skills")
    }
    
    var pdfTitle: some View {
        HStack {
            Text("iOS Developer")
            Text("Misha Dovhiy")
            Spacer()
        }
    }
}

