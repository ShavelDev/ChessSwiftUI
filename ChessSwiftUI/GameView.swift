//
//  ContentView.swift
//  ChessSwiftUI
//
//  Created by Norbert Szawloga on 17/12/2021.
//
import Combine
import SwiftUI
import SwiftyGif






struct GameView: View {
    
    
    @State var goBack: Bool = false
    @ObservedObject var br: BrainModule
    
    // var needed to go back to previous screen
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    
    init(br: BrainModule){
        
        
        self.br = br
        self.br.setChestboardToDefault()
        print("GameView initialized")
        
    }
    
    
    
    
    
    var body: some View {
        
        
        ZStack {
            
            NavigationLink(destination: WelcomeScreen(), isActive: $goBack){EmptyView()}
            
            Image("CasinoBackground").ignoresSafeArea()
            
            VStack{
                
                Spacer()
                HStack{
                    Button(action: {
                        br.setChestboardToDefault()
                    }){
                        Image("48x48transparentTest")
                    }
                    
                    
                    
                    
                }
                HStack{
                    Text("Turn:").bold().foregroundColor( Color.white)
                    Image(br.chessBoardData.whitesTurn ? "w_king":"b_king")
                }
                
                
                ZStack{
                    Image("ChessBoard").resizable().aspectRatio(contentMode: .fit).frame(width: 384, height: 384)
                    
                    
                    
                    if br.isWhite{
                        ChessBoardWhite(chessInfo: br)
                        
                    }else{
                        ChessBoardBlack(chessInfo: br)
                    }
                    
                    
                    
                }
                Spacer()
                
            }
            

            if br.wKingDead || br.bKingDead{
                
               
                
                GeometryReader{gr in
                    
                    
                    
                    if br.wKingDead == br.isWhite || br.bKingDead != br.isWhite{
                        let _ = K.playSound(K.crLaugh)
                        ResultsView(didWin: false).position(x: (gr.size.width-20)/2, y: gr.size.height/2)
                        
                    }else{
                        let _ = K.playSound(K.victorySound)
                        ResultsView(didWin: true).position(x: (gr.size.width-20)/2, y: gr.size.height/2)
                    }
                    
                    
                    
                    
                    
                    
                }.background(
                    
                    Color.black.opacity(0.65)
                        .edgesIgnoringSafeArea(.all)
                    //go back to previous screen
                        .onTapGesture {
                            
                            withAnimation{
                                br.bKingDead = false
                                br.wKingDead = false
                                
                                self.mode.wrappedValue.dismiss()
                                
                            }
                        }
                    
                )
            }

        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(br: BrainModule())
        
    }
}




