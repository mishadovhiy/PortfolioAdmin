//
//  PDFGeneratorView.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 25.08.2024.
//

import SwiftUI

struct PDFPresenterView: View {
    @State var viewModel:PDFPresenterViewModel
    init(pdfInput: PDFInput) {
        self.viewModel = .init(pdfInput: pdfInput)
    }
    var body: some View {
        VStack {
            topContent
            HStack(spacing:30) {
                workExperience
                    .frame(width: viewModel.biggerPageWidth)
                skills
            }
            Spacer()
        }
        .onAppear(perform: {
            print(viewModel.content?.projectList, " gtrsfeda")
            print(viewModel.content?.skills, " gterfwd")
        })
        .padding(30)
    }
    
    var topContent: some View {
        VStack {
            pdfTitle
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(viewModel.containerColor)
                Text(viewModel.content?.about ?? "")
                    .padding(2)
            }
        }
    }
    
    var workExperience: some View {
        VStack {
            Text("work experience")
            ForEach(viewModel.content?.workExperience ?? [], id: \.companyName) { item in
                VStack {
                    HStack {
                        Text(item.companyName + "-")
                            .font(viewModel.regularFont)
                            .bold()
                        Text(item.workTitle)
                            .font(viewModel.regularFont)
                    }
                    HStack {
                        Text(item.dateFrom + "-" + item.dateTo + " / ")
                            .font(viewModel.extraSmallFont)
                        Text(item.workType + " / " + item.managementType)
                            .font(viewModel.extraSmallFont)
                    }
                    if let projectURL = item.projectURLList.first {
                        Text(projectURL)
                            .font(viewModel.extraSmallFont)
                    }
                    Text(item.descriptionText)
                        .font(viewModel.extraSmallFont)

                    Text(item.skillList)
                        .font(viewModel.extraSmallFont)
                }
            }
        }
    }
    
    var skills: some View {
        VStack {
            Text("Technical Skills")
        }
    }
    
    var pdfTitle: some View {
        HStack {
            Text("Misha Dovhiy")
                .font(viewModel.regularFont)
            Spacer()
            Text(viewModel.content?.title ?? "")
                .font(viewModel.regularFont)
            Spacer()
            VStack(alignment:.trailing) {
                Text("Kyiv, Ukraine")
                    .font(viewModel.regularFont)
                Text("English - Upper intermediate")
                    .font(viewModel.regularFont)
            }
        }
    }
}

