//
//  WelcomeScreen.swift
//  ChessSwiftUI
//
//  Created by Norbert Szawloga on 29/12/2021.
//

import SwiftUI

struct WelcomeScreen: View {
    
    
   
    @State var showGameView = false
    
    var body: some View {
        
        
        
        NavigationView{
            
            ZStack{
                Image("CasinoBackground").ignoresSafeArea()
                VStack(spacing: 75){
                    
                    NavigationLink(destination:GameView(br: K.br),isActive: $showGameView , label: {
                        HStack{
                         
                            Text("Join to").bold().foregroundColor(Color.white)
                            Image("w_king").resizable().frame(width: 80, height: 80)
                        }.frame(width: 280, height: 75).background(Color.green).cornerRadius(20)
                            .onTapGesture {
                                K.br.isWhite = true
                                K.br.setChestboardToDefault()
                                self.showGameView = true
                            }
                        
                    })
                        
                    NavigationLink(destination: GameView(br: K.br), label: {
                        HStack{
                            Text("Join to").bold().foregroundColor(Color.white)
                            Image("b_king").resizable().frame(width: 80, height: 80)
                        }.frame(width: 280, height: 75).background(Color.green).cornerRadius(20).onTapGesture {
                            K.br.isWhite = false
                            K.br.setChestboardToDefault()
                            self.showGameView = true
                        }
                        
                    })
                    
                    
                }
                
            }
        }
    }
    
}


struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
