//
//  Constants.swift
//  ChessSwiftUI
//
//  Created by Norbert Szawloga on 29/12/2021.
//
import AVFAudio
import AVFoundation
import Foundation

struct K{
    
    static let br = BrainModule()
    
    static var player: AVAudioPlayer!
    
    static let victorySound = "VictorySound"
    static let crLaugh = "crLaugh"
    static let chessPieceMoved = "chessPieceMoved"
    
    static func playSound(_ sound: String){
        
        let url = Bundle.main.url(forResource: sound, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        
        
        
        
    }
    
    
    
    
    
}




