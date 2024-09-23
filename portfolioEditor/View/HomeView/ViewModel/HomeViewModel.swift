//
//  ContentViewModel.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 13.08.2024.
//

import Foundation

struct HomeViewModel {
    let pdfBackgroundAlphaComponent:CGFloat = 0.3
   // var pdfOutput:PDFInput = .init(pageWidth: 0, content: nil)
    var pdfContent:NSAttributedString = .init()
    var pdfModel = PDFModel()
    var testDictionary:[String:Any]?
    var exportPresenting:Bool {
        get {
            exportData != nil
        }
        set {
            if !newValue {
                exportData = nil
            }
        }
    }
    var output:PDFModel.PDFOutput?
    var exportData:Data?
    
    /// temporary test
    mutating func setContentFromBundle() {
        pdfContent = pdfModel.previewPDF().resultString
        guard let url = Bundle.main.url(forResource: "content", withExtension: "json") else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            if let content = PortfolioContent.configure(data) {
                self.pdfModel.content = content
             //   pdfOutput = .init(pageWidth: pdfModel.input.pageWidth, content: content)
                self.output = pdfModel.previewPDF()
                pdfContent = self.output?.resultString ?? .init(string: "")
                self.testDictionary = try content.dictionary()
            }
        } catch {
            print(error, " rgrfed")
            return
        }
    }
    
    mutating func viewAppeared(completion:@escaping(_ response:PortfolioContent?)->()) {
      //  setContentFromBundle()
        Task {
            APIManager().loadContent { response in
                print(response, " tyhftgdfsd")
                completion(response)
            }
        }
    }
    
    mutating func contentLoaded(_ response:PortfolioContent?) {
        self.pdfModel.content = response
     //   pdfOutput = .init(pageWidth: pdfModel.input.pageWidth, content: content)
        self.output = pdfModel.previewPDF()
        pdfContent = self.output?.resultString ?? .init(string: "")
        do {
            self.testDictionary = try response.dictionary()
        } catch {
            print("error unparcing to dictionary")
        }
    }
    
    mutating func exportPdfPressed() {
        //exportPresenting = true
        if let data = pdfModel.exportPDF() {
            self.exportData = data
        }
    }
    
    var uploadingContent = false
    mutating func uploadContent(completion:@escaping()->()) {
        do {
            uploadingContent = true
            let jsonData = try JSONSerialization.data(withJSONObject: testDictionary!, options: [])

            let response = PortfolioContent.configure(jsonData)
            
            if response?.about ?? "" == "" {
                fatalError()
            }
            pdfModel.content = response

            if let content = pdfModel.content {
                let api = APIManager()
                api.updateContent(content: content) {
                    completion()
                }
            }
        } catch {
            print("error converting dict to data")
            return
        }
       
    }
}
