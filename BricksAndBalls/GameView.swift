//  ContentView.swift
//  BricksAndBalls
//  Created by Holger Hinzberg on 21.04.21.

import SwiftUI
import SpriteKit

struct GameView: View {
    
    let levelNumber : Int
    @StateObject private var gameScene = GameSKScene()
    @StateObject private var scoreScene = ScoreSKScene()
    @StateObject private var accelerometerScene = AccelerometerSKScene()
    
    var body: some View {
        
        VStack (spacing: 0) {
            GeometryReader { geo in
                SpriteView(scene: GetScoreScene(size: geo.size))
            }.frame(height: 30)

            GeometryReader { geo in
                SpriteView(scene: GetGameScene(size: geo.size))
               }

            GeometryReader { geo in
                SpriteView(scene: GetAccelerometerScene(size: geo.size))
               }.frame(height: 30)

        }
        .ignoresSafeArea()
        .navigationBarTitle("")
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
    }
    
    func GetGameScene( size : CGSize) -> GameSKScene
    {
        self.gameScene.levelNumber = self.levelNumber
        self.gameScene.externalSize = size
        return self.gameScene;
    }
    
    func GetScoreScene(size : CGSize) -> ScoreSKScene
    {
        self.scoreScene.externalSize = size
        self.scoreScene.showBottom = false
        return self.scoreScene;
    }
    
    func GetAccelerometerScene(size : CGSize) -> AccelerometerSKScene
    {
        self.accelerometerScene.externalSize = size
        self.accelerometerScene.showTop = false
        return self.accelerometerScene;
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(levelNumber: 1)
    }
}
