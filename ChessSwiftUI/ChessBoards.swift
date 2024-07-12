//
//  ChessBoards.swift
//  ChessSwiftUI
//
//  Created by Norbert Szawloga on 29/12/2021.
//

import SwiftUI

struct ChessBoardWhite: View {
    
    @ObservedObject var chessInfo: BrainModule
    
    
    var body: some View {
        VStack(spacing:0){
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "A1", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "B1", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "C1",  chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D1",  chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E1",  chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "F1",  chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G1",  chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "H1",  chestPieceOp: 1)
            }
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "A2", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B2", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "C2", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D2", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E2", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "F2", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G2", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "H2", chestPieceOp: 1)
                
            }
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "A3", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B3", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "C3", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D3", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E3", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "F3", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G3", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "H3", chestPieceOp: 1)
                
            }
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "A4", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B4", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "C4", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D4", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E4", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "F4", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G4", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "H4", chestPieceOp: 1)
                
            }
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "A5", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B5", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "C5", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D5", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E5", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "F5", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G5", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "H5", chestPieceOp: 1)
                
            }
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "A6", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B6", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "C6", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D6", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E6", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "F6", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G6", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "H6", chestPieceOp: 1)
                
            }
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "A7", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B7", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "C7", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D7", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E7", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "F7", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G7", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "H7", chestPieceOp: 1)
                
            }
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "A8", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B8", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "C8", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D8", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E8", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "F8", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G8", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "H8", chestPieceOp: 1)
                
            }
            
        }
    }
}


struct ChessBoardBlack: View {
    
    @ObservedObject var chessInfo: BrainModule
    
    var body: some View {
        VStack(spacing:0){
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "H8", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G8", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "F8", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E8", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D8", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "C8", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B8", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "A8", chestPieceOp: 1)
                
            }
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "H7", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G7", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "F7", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E7", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D7", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "C7", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B7", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "A7", chestPieceOp: 1)
                
            }
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "H6", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G6", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "F6", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E6", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D6", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "C6", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B6", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "A6", chestPieceOp: 1)
                
            }
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "H5", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G5", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "F5", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E5", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D5", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "C5", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B5", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "A5", chestPieceOp: 1)
            
            }
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "H4", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G4", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "F4", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E4", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D4", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "C4", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B4", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "A4", chestPieceOp: 1)
                
            }
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "H3", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G3", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "F3", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E3", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D3", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "C3", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B3", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "A3",chestPieceOp: 1)
                
            }
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "H2", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G2", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "F2", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E2", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D2", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "C2", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B2", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "A2",  chestPieceOp: 1)
                
            }
            
            HStack(spacing: 0){
                ChessPieceArea(br: chessInfo, id: "H1", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "G1", chestPieceOp: 1 )
                ChessPieceArea(br: chessInfo, id: "F1", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "E1", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "D1", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "C1", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "B1", chestPieceOp: 1)
                ChessPieceArea(br: chessInfo, id: "A1", chestPieceOp: 1)
                
            }
            
            
            
        }
    }
}









struct GameOverScreen: View {
    
    @ObservedObject var chessInfo: BrainModule
    
    init(chessInfo :BrainModule){
        self.chessInfo = chessInfo
        
    }
    
    
    
    var body: some View {
        
        
        VStack(spacing:0){
            
            if chessInfo.wKingDead{
                Text("Black Wins")
                
            }else if chessInfo.bKingDead{
                Text("White Wins")
                
            }
            
            
        }
    }
}




