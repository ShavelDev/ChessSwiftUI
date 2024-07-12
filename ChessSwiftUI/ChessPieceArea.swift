//
//  ChessPieceArea.swift
//  ChessSwiftUI
//
//  Created by Norbert Szawloga on 18/12/2021.
//

import SwiftUI


struct ChessPieceArea: View {
    
    @ObservedObject var br: BrainModule
    
    
    
    let id :String
    var area: String = "selected"
    var areaOp: Double = 0
    var chessPiece: String = "none"
    
    var chestPieceOp: Double
    
    
    
    var body: some View {
        
            
        Button(action: {
            br.areaSelected(id: id)
        }){
            ZStack{
                Image(area)
                    .opacity(br.selectedArea == id ? 1:0)
                    
                
                
                Image(br.chessBoardData.getPiece(from: id))
                    .resizable()
                    .opacity(chestPieceOp)
                    .frame(width: 48, height: 48)
            }
        }
            
            
        
    }
    
    
}



struct ChessPieceArea_Previews: PreviewProvider {
   
    static var previews: some View {
        
        ChessPieceArea(br: BrainModule(), id: "11",  chestPieceOp: 1) .previewLayout(.sizeThatFits)
    }
}

 
