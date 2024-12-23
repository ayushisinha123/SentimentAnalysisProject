//
//  ContentView.swift
//  SentimentAnalysis
//
//  Created by Sushant on 22/12/24.
//
import SwiftUI
import NaturalLanguage

struct ContentView: View {
    
    @State private var inputText: String = ""
     private var score: String {
         sentimentAnalyzer(analysingText: inputText)
    }
    
    private func sentimentAnalyzer(analysingText: String) -> String {
        
        
        return sentimentScore(for: analysingText)
    }
    
    let tagger = NLTagger(tagSchemes: [.sentimentScore])
    
    private func sentimentScore(for word: String) -> String {
        tagger.string = word
        let (sentimentScore, _) = tagger.tag(at: word.startIndex, unit: .paragraph, scheme: .sentimentScore)
        return sentimentScore?.rawValue ?? ""
        
    }
    var body: some View {
        VStack {

            Text("Sentiment Analysis")
            
            TextField("Enter Text", text: $inputText)
            
            Text(score)
        }
        .font(.system(size: 20))
        .multilineTextAlignment(.center)
    }
}

#Preview {
    ContentView()
}
