//
//  ResultsView.swift
//  ChessSwiftUI
//
//  Created by Norbert Szawloga on 30/12/2021.
//

import SwiftUI

struct ResultsView: View {
    let didWin: Bool
    
    var body: some View {
        VStack{
            
            Text(didWin ? "Congratulations You Win!" : "You Loose :(" ).bold().font(Font.custom("AvenirNext-Heavy", size: 30)).multilineTextAlignment(.center)
            
            Text("Click Anywhere To Get To The Welcome Screen")
            
        }.padding()
            .background(Color.green)
            .cornerRadius(30)
        
        
    }
}

struct ResultsView_Previews: PreviewProvider {
    static var previews: some View {
        ResultsView(didWin: true)
    }
}
