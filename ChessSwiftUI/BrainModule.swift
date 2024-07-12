//
//  BrainModule.swift
//  ChessSwiftUI
//
//  Created by Norbert Szawloga on 18/12/2021.
//
import Firebase
import Foundation
import AVFoundation

class BrainModule: ObservableObject{
    
    let db = Firestore.firestore()
    @Published var isWhite:Bool
    
    @Published var wKingDead: Bool = false
    @Published var bKingDead: Bool = false
    
    
    // area with a chessPiece meant to move
    @Published var selectedArea: String = ""
    //area the player wants to move chesspiece to
    var destinationArea: String = ""
    
    
    
    init(){
        print("Brain Module Init")
        self.isWhite = true
        updateDetected()
    }
    
    
    
    @Published var chessBoardData = ChessModel(
        whitesTurn: true,
        A1: "b_queen", B1: "b_pawn", C1: "b_queen", D1: "b_pawn", E1: "b_queen", F1: "b_pawn", G1: "b_queen", H1: "b_pawn",
        A2: "b_queen", B2: "b_pawn", C2: "b_queen", D2: "b_pawn", E2: "b_queen", F2: "b_pawn", G2: "b_queen", H2: "b_pawn",
        A3: "b_queen", B3: "b_pawn", C3: "b_queen", D3: "b_pawn", E3: "b_queen", F3: "b_pawn", G3: "b_queen", H3: "b_pawn",
        A4: "b_queen", B4: "b_pawn", C4: "b_queen", D4: "b_pawn", E4: "b_queen", F4: "b_pawn", G4: "b_queen", H4: "b_pawn",
        A5: "b_queen", B5: "b_pawn", C5: "b_queen", D5: "b_pawn", E5: "b_queen", F5: "b_pawn", G5: "b_queen", H5: "b_pawn",
        A6: "b_queen", B6: "b_pawn", C6: "b_queen", D6: "b_pawn", E6: "b_queen", F6: "b_pawn", G6: "b_queen", H6: "b_pawn",
        A7: "b_queen", B7: "b_pawn", C7: "b_queen", D7: "b_pawn", E7: "b_queen", F7: "b_pawn", G7: "b_queen", H7: "b_pawn",
        A8: "b_queen", B8: "b_pawn", C8: "b_queen", D8: "b_pawn", E8: "b_queen", F8: "b_pawn", G8: "b_queen", H8: "b_pawn")
    
    // function called when an area is clicked
    func areaSelected(id chosenArea: String){
        
        //compares your turn to your color
        if isWhite == chessBoardData.whitesTurn{
            
            /*
            if selectedArea == "" && chessBoardData.getPiece(from: chosenArea) != "none" && chessPieceIsWhite(chessPiece: chessBoardData.getPiece(from: chosenArea)) == isWhite{
                selectedArea = chosenArea
                print(selectedArea)
            }else if destinationArea == "" && selectedArea == chosenArea{
                selectedArea = ""
                
            }else if selectedArea != ""{
                destinationArea = chosenArea
            }
            */
            
            if isWhite == chessPieceIsWhite(chessPiece: chessBoardData.getPiece(from: chosenArea)) && chessBoardData.getPiece(from: chosenArea) != "none" && chosenArea != selectedArea{
                selectedArea = chosenArea
                print(chosenArea)
            }else if chosenArea == selectedArea {
                selectedArea = ""
            }
            else if selectedArea != ""{
                destinationArea = chosenArea
            }
            
            
            print("clicked: \(chosenArea), selected: \(selectedArea), destination: \(destinationArea)")
            
            
            if destinationArea != "" && isPossible( chessPiece: chessBoardData.getPiece(from: selectedArea), chessPieceDes: chessBoardData.getPiece(from: destinationArea)){
                
                chessBoardData.setCoordinatesValue(from: destinationArea, to: chessBoardData.getPiece(from: selectedArea))
                chessBoardData.setCoordinatesValue(from: selectedArea, to: "none")
                
                selectedArea = ""
                destinationArea = ""
                
                if chessBoardData.whitesTurn {
                    chessBoardData.whitesTurn = false
                }else{
                    chessBoardData.whitesTurn = true
                }
                
                db.collection("Test").document("ChessBoard").setData(chessBoardData.getDictionary()){
                    (error) in
                    if let e = error {
                        print("an error has occured \(e)")
                    }else{
                        print("Data saved succesfuly")
                    }
                }
                
            }else{
                destinationArea = ""
                
            }
        }
    }
    
    func isPossible( chessPiece: String, chessPieceDes: String) -> Bool {
        
        if chessPieceIsWhite(chessPiece: chessPieceDes) == chessPieceIsWhite(chessPiece: chessPiece) && chessPieceDes != "none"{
            return false
        }
        
        
        
        let chessPieceType = chessPiece.dropFirst(2)
        
        let startingCoordinates = convertIDtoCoordinates(id: selectedArea)
        let destinationCoordinates = convertIDtoCoordinates(id: destinationArea)
        
        
        
        switch chessPieceType{
        case "knight":
            
            let accesibleAreas = [(startingCoordinates.x - 1, startingCoordinates.y + 2), (startingCoordinates.x + 1, startingCoordinates.y + 2), (startingCoordinates.x + 2, startingCoordinates.y + 1),(startingCoordinates.x + 2, startingCoordinates.y - 1), (startingCoordinates.x + 1, startingCoordinates.y - 2), (startingCoordinates.x - 1, startingCoordinates.y - 2),
                                  (startingCoordinates.x - 2, startingCoordinates.y - 1), (startingCoordinates.x - 2, startingCoordinates.y + 1)]
            
            for coor in accesibleAreas{
                if destinationCoordinates == coor{
                    
                    return true
                }
                
            }
            return false
            
        case "rook":
            
            let min: Int
            let max: Int
            
            //went up
            if startingCoordinates.x ==  destinationCoordinates.x && startingCoordinates.y != destinationCoordinates.y  {
                
                
                
                if startingCoordinates.y < destinationCoordinates.y{
                    min = startingCoordinates.y
                    max = destinationCoordinates.y
                }else{
                    min = destinationCoordinates.y
                    max = startingCoordinates.y
                }
                
                for number in (min+1)..<max{
                    if chessBoardData.getPiece(from: convertCoordinatestoID(xCor: startingCoordinates.x, yCor: number)) != "none"{
                        return false
                    }
                }
                
                return true
                
                
            }else if startingCoordinates.y ==  destinationCoordinates.y && startingCoordinates.x != destinationCoordinates.x{
                
                if startingCoordinates.x < destinationCoordinates.x{
                    min = startingCoordinates.x
                    max = destinationCoordinates.x
                }else{
                    min = destinationCoordinates.x
                    max = startingCoordinates.x
                }
                
                for number in (min+1)..<max{
                    if chessBoardData.getPiece(from: convertCoordinatestoID(xCor: number, yCor: startingCoordinates.y)) != "none"{
                        return false
                    }
                }
                
                return true
                
            }
            
            
            
            return false
            
        case "bishop":
            
            let minX:Int
            let maxX:Int
            let minY:Int
            let maxY:Int
            
            
            if startingCoordinates.x < destinationCoordinates.x{
                minX = startingCoordinates.x
                maxX = destinationCoordinates.x
            }else{
                minX = destinationCoordinates.x
                maxX = startingCoordinates.x
            }
            
            if startingCoordinates.y < destinationCoordinates.y{
                minY = startingCoordinates.y
                maxY = destinationCoordinates.y
            }else{
                minY = destinationCoordinates.y
                maxY = startingCoordinates.y
            }
            
            
            
            if maxX - minX == maxY - minY{
                let xFactor = startingCoordinates.x < destinationCoordinates.x ? 1:-1
                let yFactor = startingCoordinates.y < destinationCoordinates.y ? 1:-1
                
                //the number of tiles between the start and destination
                for num in 1..<(maxX-minX){
                    print("\(convertCoordinatestoID(xCor: (startingCoordinates.x+xFactor*num), yCor: (startingCoordinates.y+yFactor*num)))checking")
                    if chessBoardData.getPiece(from: convertCoordinatestoID(xCor: startingCoordinates.x+xFactor*num, yCor: startingCoordinates.y+yFactor*num)) != "none"{
                        
                        return false
                    }
                }
                return true
            }else{
                print("not diagnoal")
                return false
                
            }
            
            
        case "queen":
            
            //went vertically
            if startingCoordinates.x ==  destinationCoordinates.x && startingCoordinates.y != destinationCoordinates.y  {
                
                let min: Int
                let max: Int
                
                if startingCoordinates.y < destinationCoordinates.y{
                    min = startingCoordinates.y
                    max = destinationCoordinates.y
                }else{
                    min = destinationCoordinates.y
                    max = startingCoordinates.y
                }
                
                for number in (min+1)..<max{
                    if chessBoardData.getPiece(from: convertCoordinatestoID(xCor: startingCoordinates.x, yCor: number)) != "none"{
                        return false
                    }
                }
                
                return true
                
                //went horizontally
            }else if startingCoordinates.y ==  destinationCoordinates.y && startingCoordinates.x != destinationCoordinates.x{
                
                let min: Int
                let max: Int
                
                if startingCoordinates.x < destinationCoordinates.x{
                    min = startingCoordinates.x
                    max = destinationCoordinates.x
                }else{
                    min = destinationCoordinates.x
                    max = startingCoordinates.x
                }
                
                for number in (min+1)..<max{
                    if chessBoardData.getPiece(from: convertCoordinatestoID(xCor: number, yCor: startingCoordinates.y)) != "none"{
                        return false
                    }
                }
                
                return true
                
            }
            
            let minX:Int
            let maxX:Int
            let minY:Int
            let maxY:Int
            
            if startingCoordinates.x < destinationCoordinates.x{
                minX = startingCoordinates.x
                maxX = destinationCoordinates.x
            }else{
                minX = destinationCoordinates.x
                maxX = startingCoordinates.x
            }
            
            if startingCoordinates.y < destinationCoordinates.y{
                minY = startingCoordinates.y
                maxY = destinationCoordinates.y
            }else{
                minY = destinationCoordinates.y
                maxY = startingCoordinates.y
            }
            
            //if diagnoal
            if maxX - minX == maxY - minY{
                
                
                let xFactor = startingCoordinates.x < destinationCoordinates.x ? 1:-1
                let yFactor = startingCoordinates.y < destinationCoordinates.y ? 1:-1
                
                //the number of tiles between the start and destination
                for num in 1..<(maxX-minX){
                    print("\(convertCoordinatestoID(xCor: (startingCoordinates.x+xFactor*num), yCor: (startingCoordinates.y+yFactor*num)))checking")
                    if chessBoardData.getPiece(from: convertCoordinatestoID(xCor: startingCoordinates.x+xFactor*num, yCor: startingCoordinates.y+yFactor*num)) != "none"{
                        
                        return false
                    }
                }
                return true
            }else{
                print("not diagnoal")
                return false
                
            }
            
        case "pawn":
            
            
            
            if destinationCoordinates.x == startingCoordinates.x{
                
                if isWhite{
                    
                    if startingCoordinates.y == 7 && chessBoardData.getPiece(from: convertCoordinatestoID(xCor: startingCoordinates.x, yCor: 6)) == "none" && chessBoardData.getPiece(from: convertCoordinatestoID(xCor: startingCoordinates.x, yCor: 5)) == "none" && destinationCoordinates.y == 5{
                        print("pawn moved 2 tiles")
                        return true
                    }else if(destinationCoordinates.y - startingCoordinates.y == -1 && chessBoardData.getPiece(from: destinationArea) == "none"){
                        print("pawn moved")
                         return true
                     }
                     
                 }else{
                     
                     if startingCoordinates.y == 2 && chessBoardData.getPiece(from: convertCoordinatestoID(xCor: startingCoordinates.x, yCor: 3)) == "none" && chessBoardData.getPiece(from: convertCoordinatestoID(xCor: startingCoordinates.x, yCor: 4)) == "none" && destinationCoordinates.y == 4{
                         return true
                     }else if(destinationCoordinates.y - startingCoordinates.y == 1 && chessBoardData.getPiece(from: destinationArea) == "none" ){
                         return true
                     }
                     
                 }
                 
             }else if abs(destinationCoordinates.x - startingCoordinates.x) == 1{
                 
                 if isWhite && destinationCoordinates.y - startingCoordinates.y == -1 && chessBoardData.getPiece(from: destinationArea) != "none"  {
                     return true
                 }else if isWhite == false && destinationCoordinates.y - startingCoordinates.y == 1 && chessBoardData.getPiece(from: destinationArea) != "none" {
                     return true
                 }

             }
             
             return false
             
         case "king":
             
                if abs(startingCoordinates.x-destinationCoordinates.x) <= 1 && abs(startingCoordinates.y - destinationCoordinates.y) <= 1{
                    return true
                }else{
                    return false
                }
             
         default:
             
             print("Chess Piece Not Recognized")
         }
          
         print("moved")
         return true
     }
     
    
    
     
     //dont use if piece equals to "none"
      func chessPieceIsWhite(chessPiece: String) -> Bool{
         if chessPiece.prefix(1) == "w"{
             return true
         }
         else if chessPiece.prefix(1) == "b"{
             return false
         }
         
         else{
             return false
         }
         
     }
      
     
      func convertCoordinatestoID(xCor: Int, yCor: Int) -> String{
         
          let y = String(yCor)
         
         switch xCor{
         case 1:
             return "A\(y)"
         case 2:
             return "B\(y)"
         case 3:
             return "C\(y)"
         case 4:
             return "D\(y)"
         case 5:
             return "E\(y)"
         case 6:
             return "F\(y)"
         case 7:
             return "G\(y)"
         case 8:
             return "H\(y)"
             
         default:
             print("Error in decoding X, Y values to Coordinates, x: \(xCor), y: \(yCor)")
             return "A1"
         }
     }
    
    func convertIDtoCoordinates(id: String) -> (x: Int, y: Int){
       
       let y = Int(id.suffix(1)) ?? 1
       
       switch id.prefix(1){
       case "A":
           return (1,y)
       case "B":
           return (2,y)
       case "C":
           return (3,y)
       case "D":
           return (4,y)
       case "E":
           return (5,y)
       case "F":
           return (6,y)
       case "G":
           return (7,y)
       case "H":
           return (8,y)
           
       default:
           print("Error in decoding ID to X, Y values x: \(id.prefix(1)) ")
           return (1,1)
       }
   }
    
    
    func setChestboardToDefault(){
        let p = ChessModel(
            whitesTurn: true,
            A1: "b_rook", B1: "b_knight", C1: "b_bishop", D1: "b_queen", E1: "b_king", F1: "b_bishop", G1: "b_knight", H1: "b_rook",
            A2: "b_pawn", B2: "b_pawn", C2: "b_pawn", D2: "b_pawn", E2: "b_pawn", F2: "b_pawn", G2: "b_pawn", H2: "b_pawn",
            A3: "none", B3: "none", C3: "none", D3: "none", E3: "none", F3: "none", G3: "none", H3: "none",
            A4: "none", B4: "none", C4: "none", D4: "none", E4: "none", F4: "none", G4: "none", H4: "none",
            A5: "none", B5: "none", C5: "none", D5: "none", E5: "none", F5: "none", G5: "none", H5: "none",
            A6: "none", B6: "none", C6: "none", D6: "none", E6: "none", F6: "none", G6: "none", H6: "none",
            A7: "w_pawn", B7: "w_pawn", C7: "w_pawn", D7: "w_pawn", E7: "w_pawn", F7: "w_pawn", G7: "w_pawn", H7: "w_pawn",
            A8: "w_rook", B8: "w_knight", C8: "w_bishop", D8: "w_queen", E8: "w_king", F8: "w_bishop", G8: "w_knight", H8: "w_rook")
        
        
        wKingDead = false
        bKingDead = false
        
        db.collection("Test").document("ChessBoard").setData( p.getDictionary()){
            (error) in
            if let e = error {
                print("an error has occured \(e)")
            }else{
                print("Succesfullysaved data")
            }
        }
        
        
        
        
    }
    
    func updateDetected(){
        
        db.collection("Test").document("ChessBoard").addSnapshotListener{ querySnapshot, error in
            
            print("Update detected")
            if let snapshotDocument = querySnapshot {
                if let data = snapshotDocument.data(){
                    
                    
                    
                    self.chessBoardData = self.fireBaseObjectConverter(from: data)
                    
                    var bKingAlive = false
                    var wKingAlive = false
                    
                    for i in 1...8{
                        for j in 1...8{
                            if self.chessBoardData.getPiece(from: self.convertCoordinatestoID(xCor: i, yCor: j)) == "w_king"{
                            
                                wKingAlive = true
                                
                            }else if self.chessBoardData.getPiece(from: self.convertCoordinatestoID(xCor: i, yCor: j)) == "b_king"{
                                
                                bKingAlive = true
                                
                            }
                        }
                    }
                    print("king status changed")
                    if bKingAlive == false || wKingAlive == false {
                        if bKingAlive == false{
                            self.bKingDead = true
                        }else if wKingAlive == false{
                            self.wKingDead = true
                        }
                       // K.playSound(K.victorySound)
                    }
                    else{
                        print("played sound from :\(self.isWhite)")
                        K.playSound(K.chessPieceMoved)
                    }
                    
                    
                    
                    
                }
                
            }
            
        }
    }
    
    func fireBaseObjectConverter(from data: [String: Any])->ChessModel{
        
        let p = ChessModel(whitesTurn: data["whitesTurn"] as! Bool ,
                           A1: data["A1"] as! String, B1: data["B1"] as! String, C1: data["C1"] as! String, D1: data["D1"] as! String, E1: data["E1"] as! String, F1: data["F1"] as! String, G1: data["G1"] as! String, H1: data["H1"] as! String,
                           A2: data["A2"] as! String, B2: data["B2"] as! String, C2: data["C2"] as! String, D2: data["D2"] as! String, E2: data["E2"] as! String, F2: data["F2"] as! String, G2: data["G2"] as! String, H2: data["H2"] as! String,
                           A3: data["A3"] as! String, B3: data["B3"] as! String, C3: data["C3"] as! String, D3: data["D3"] as! String, E3: data["E3"] as! String, F3: data["F3"] as! String, G3: data["G3"] as! String, H3: data["H3"] as! String,
                           A4: data["A4"] as! String, B4: data["B4"] as! String, C4: data["C4"] as! String, D4: data["D4"] as! String, E4: data["E4"] as! String, F4: data["F4"] as! String, G4: data["G4"] as! String, H4: data["H4"] as! String,
                           A5: data["A5"] as! String, B5: data["B5"] as! String, C5: data["C5"] as! String, D5: data["D5"] as! String, E5: data["E5"] as! String, F5: data["F5"] as! String, G5: data["G5"] as! String, H5: data["H5"] as! String,
                           A6: data["A6"] as! String, B6: data["B6"] as! String, C6: data["C6"] as! String, D6: data["D6"] as! String, E6: data["E6"] as! String, F6: data["F6"] as! String, G6: data["G6"] as! String, H6: data["H6"] as! String,
                           A7: data["A7"] as! String, B7: data["B7"] as! String, C7: data["C7"] as! String, D7: data["D7"] as! String, E7: data["E7"] as! String, F7: data["F7"] as! String, G7: data["G7"] as! String, H7: data["H7"] as! String,
                           A8: data["A8"] as! String, B8: data["B8"] as! String, C8: data["C8"] as! String, D8: data["D8"] as! String, E8: data["E8"] as! String, F8: data["F8"] as! String, G8: data["G8"] as! String, H8: data["H8"] as! String)
        
        
        return p
    }
    
    
    
    
    
}

struct ChessModel{
    
    var whitesTurn: Bool
    
    var A1: String
    var B1: String
    var C1: String
    var D1: String
    var E1: String
    var F1: String
    var G1: String
    var H1: String
    
    var A2: String
    var B2: String
    var C2: String
    var D2: String
    var E2: String
    var F2: String
    var G2: String
    var H2: String
    
    var A3: String
    var B3: String
    var C3: String
    var D3: String
    var E3: String
    var F3: String
    var G3: String
    var H3: String
    
    var A4: String
    var B4: String
    var C4: String
    var D4: String
    var E4: String
    var F4: String
    var G4: String
    var H4: String
    
    var A5: String
    var B5: String
    var C5: String
    var D5: String
    var E5: String
    var F5: String
    var G5: String
    var H5: String
    
    var A6: String
    var B6: String
    var C6: String
    var D6: String
    var E6: String
    var F6: String
    var G6: String
    var H6: String

    var A7: String
    var B7: String
    var C7: String
    var D7: String
    var E7: String
    var F7: String
    var G7: String
    var H7: String
    
    var A8: String
    var B8: String
    var C8: String
    var D8: String
    var E8: String
    var F8: String
    var G8: String
    var H8: String
    
    func getDictionary() -> [String : Any]{
        let dictionary = [
            "whitesTurn": whitesTurn,
            "A1" : A1, "B1": B1, "C1": C1, "D1": D1, "E1": E1, "F1": F1, "G1":G1, "H1": H1,
            "A2" : A2, "B2": B2, "C2": C2, "D2": D2, "E2": E2, "F2": F2, "G2":G2, "H2": H2,
            "A3" : A3, "B3": B3, "C3": C3, "D3": D3, "E3": E3, "F3": F3, "G3":G3, "H3": H3,
            "A4" : A4, "B4": B4, "C4": C4, "D4": D4, "E4": E4, "F4": F4, "G4":G4, "H4": H4,
            "A5" : A5, "B5": B5, "C5": C5, "D5": D5, "E5": E5, "F5": F5, "G5":G5, "H5": H5,
            "A6" : A6, "B6": B6, "C6": C6, "D6": D6, "E6": E6, "F6": F6, "G6":G6, "H6": H6,
            "A7" : A7, "B7": B7, "C7": C7, "D7": D7, "E7": E7, "F7": F7, "G7":G7, "H7": H7,
            "A8" : A8, "B8": B8, "C8": C8, "D8": D8, "E8": E8, "F8": F8, "G8":G8, "H8": H8] as [String: Any]
        return dictionary
    }
    
    mutating func setCoordinatesValue(from id: String, to value:String){
        switch id{
        case "A1":
            A1=value
        case "B1":
            B1=value
        case "C1":
            C1=value
        case "D1":
            D1 = value
        case "E1":
             E1 = value
        case "F1":
             F1 = value
        case "G1":
             G1 = value
        case "H1":
             H1 = value
            
        case "A2":
             A2 = value
        case "B2":
             B2 = value
        case "C2":
             C2 = value
        case "D2":
             D2 = value
        case "E2":
             E2 = value
        case "F2":
             F2 = value
        case "G2":
             G2 = value
        case "H2":
             H2 = value
            
        case "A3":
             A3 = value
        case "B3":
             B3 = value
        case "C3":
             C3 = value
        case "D3":
             D3 = value
        case "E3":
             E3 = value
        case "F3":
             F3 = value
        case "G3":
             G3 = value
        case "H3":
             H3 = value
        
        case "A4":
             A4 = value
        case "B4":
             B4 = value
        case "C4":
             C4 = value
        case "D4":
             D4 = value
        case "E4":
             E4 = value
        case "F4":
             F4 = value
        case "G4":
             G4 = value
        case "H4":
             H4 = value
            
        case "A5":
             A5 = value
        case "B5":
             B5 = value
        case "C5":
             C5 = value
        case "D5":
             D5 = value
        case "E5":
             E5 = value
        case "F5":
             F5 = value
        case "G5":
             G5 = value
        case "H5":
             H5 = value
            
        case "A6":
             A6 = value
        case "B6":
             B6 = value
        case "C6":
             C6 = value
        case "D6":
             D6 = value
        case "E6":
             E6 = value
        case "F6":
             F6 = value
        case "G6":
             G6 = value
        case "H6":
             H6 = value
            
       case "A7":
             A7 = value
        case "B7":
             B7 = value
        case "C7":
             C7 = value
        case "D7":
             D7 = value
        case "E7":
             E7 = value
        case "F7":
             F7 = value
        case "G7":
             G7 = value
        case "H7":
             H7 = value
            
        case "A8":
             A8 = value
        case "B8":
             B8 = value
        case "C8":
             C8 = value
        case "D8":
             D8 = value
        case "E8":
             E8 = value
        case "F8":
             F8 = value
        case "G8":
             G8 = value
        case "H8":
             H8 = value
            
            
            
            
            
            
            
        default:
            print("error when changing a value \(value)")
            
            
        }
    }
    
    //used to assign Image to a correct chesspiece
    func getPiece(from id: String) -> String{
        
        switch id{
        case "A1":
            return A1
        case "B1":
            return B1
        case "C1":
            return C1
        case "D1":
            return D1
        case "E1":
            return E1
        case "F1":
            return F1
        case "G1":
            return G1
        case "H1":
            return H1
            
        case "A2":
            return A2
        case "B2":
            return B2
        case "C2":
            return C2
        case "D2":
            return D2
        case "E2":
            return E2
        case "F2":
            return F2
        case "G2":
            return G2
        case "H2":
            return H2
            
        case "A3":
            return A3
        case "B3":
            return B3
        case "C3":
            return C3
        case "D3":
            return D3
        case "E3":
            return E3
        case "F3":
            return F3
        case "G3":
            return G3
        case "H3":
            return H3
        
        case "A4":
            return A4
        case "B4":
            return B4
        case "C4":
            return C4
        case "D4":
            return D4
        case "E4":
            return E4
        case "F4":
            return F4
        case "G4":
            return G4
        case "H4":
            return H4
            
        case "A5":
            return A5
        case "B5":
            return B5
        case "C5":
            return C5
        case "D5":
            return D5
        case "E5":
            return E5
        case "F5":
            return F5
        case "G5":
            return G5
        case "H5":
            return H5
            
        case "A6":
            return A6
        case "B6":
            return B6
        case "C6":
            return C6
        case "D6":
            return D6
        case "E6":
            return E6
        case "F6":
            return F6
        case "G6":
            return G6
        case "H6":
            return H6
            
       case "A7":
            return A7
        case "B7":
            return B7
        case "C7":
            return C7
        case "D7":
            return D7
        case "E7":
            return E7
        case "F7":
            return F7
        case "G7":
            return G7
        case "H7":
            return H7
            
        case "A8":
            return A8
        case "B8":
            return B8
        case "C8":
            return C8
        case "D8":
            return D8
        case "E8":
            return E8
        case "F8":
            return F8
        case "G8":
            return G8
        case "H8":
            return H8
            
            
            
            
            
            
            
        default:
            print("error when accesing a piece id:\(id)")
            return "48x48transparentTest"
            
        }
        
    }
    
}
