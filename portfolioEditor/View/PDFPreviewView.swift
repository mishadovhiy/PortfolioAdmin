//
//  PreviewPDFVC.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 24.08.2024.
//

import SwiftUI
import UIKit

struct PDFPreviewView: UIViewControllerRepresentable {
    var pdfContent: NSAttributedString

    func makeUIViewController(context: Context) -> PDFPreviewVC {
        return PDFPreviewVC(pdfContent: pdfContent)
    }

    func updateUIViewController(_ uiViewController: PDFPreviewVC, context: Context) {
        uiViewController.pdfContent = pdfContent
    }
}

extension PDFPreviewView {
    class PDFPreviewVC:UIViewController {
        var pdfContent: NSAttributedString = .init(string: "") {
            didSet {
                pdfLabel?.attributedText = pdfContent
            }
        }
        private var pdfLabel:UILabel? {
            view.subviews.first(where: { $0.layer.name == pdfLabelName }) as? UILabel
        }
        private let pdfLabelName = "pdfContentLabel"
        
        override func loadView() {
            super.loadView()
            loadUI()
        }
        
        init(pdfContent: NSAttributedString) {
            self.pdfContent = pdfContent
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
    }
}

private extension PDFPreviewView.PDFPreviewVC {
    func loadUI() {
        loadPDFLabel()
        updateConstraints()
    }
    
    func loadPDFLabel() {
        if self.pdfLabel != nil {
            return
        }
        let pdfLabel = UILabel()
        pdfLabel.layer.name = pdfLabelName
        view.addSubview(pdfLabel)
        pdfLabel.attributedText = pdfContent
        pdfLabel.numberOfLines = 0
    }
    
    func updateConstraints() {
        guard let pdfLabel,
              let pdfSuperview = pdfLabel.superview
        else {
            if pdfLabel == nil {
                print("pdf label is nil")
            }
            fatalError()
        }
        pdfLabel.translatesAutoresizingMaskIntoConstraints = false
        pdfLabel.leadingAnchor.constraint(equalTo: pdfSuperview.leadingAnchor, constant: 0).isActive = true
        pdfLabel.trailingAnchor.constraint(equalTo: pdfSuperview.trailingAnchor, constant: 0).isActive = true
        pdfLabel.topAnchor.constraint(equalTo: pdfSuperview.topAnchor, constant: 0).isActive = true
        pdfLabel.bottomAnchor.constraint(equalTo: pdfSuperview.bottomAnchor, constant: 0).isActive = true

    }
}
