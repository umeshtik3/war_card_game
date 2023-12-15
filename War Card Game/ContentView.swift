//
//  ContentView.swift
//  War Card Game
//
//  Created by Umesh tikhe on 05/12/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var playerCard = "back"
    @State var cpuCard = "back"
    var body: some View {
        ZStack{
            Image("background-plain")
            
            VStack(spacing:60){
                Image("logo")
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                HStack(spacing:60){
                    Image(playerCard)
                    Image(cpuCard)
                }
                Button{
                   deal()
                }label: {
                    Image("button")
                }
                HStack(spacing: 150){
                    VStack{
                        Text("Player")
                        Text("\(playerScore)")
                    }
                    VStack{
                        Text("CPU")
                        Text("\(cpuScore)")
                    }
                }.font(.title).foregroundColor(.white).padding()
            }
        }
        
    }
    func generateRandomNumber() -> Int {
        let lowerBound = 2
        let upperBound = 14
        
        let randomNumber = Int(arc4random_uniform(UInt32(upperBound - lowerBound + 1))) + lowerBound
        return randomNumber
    }
    func deal(){
        
        let playerDeal = Int.random(in: 2...14)
        let cpuDeal = Int.random(in: 2...14)
        playerCard = "card" + String(playerDeal)
        
        cpuCard = "card" + String(cpuDeal)
      
    
        if(playerDeal > cpuDeal){
            playerScore += 1
        }else{
            cpuScore += 1
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
