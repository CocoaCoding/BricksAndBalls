//
//  LevelChooseScene.swift
//  BricksAndBalls
//
//  Created by Holger Hinzberg on 04.06.21.
//

import SwiftUI

struct LevelChooseScene: View {
    
    //let levels  = [1,2,3,4,5]
    private let levelRepository = LevelRepository()
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach(levelRepository.getLevelNumbers(), id:\.self){ level in
                        NavigationLink(
                            destination: GameView(levelNumber: level),
                            label: {
                                Text("\(level)")
                                    .frame(width: 50, height: 50, alignment: .center)
                                    .font(.largeTitle).foregroundColor(.white)
                                    .background(Color.red)
                                    .cornerRadius(5)
                            })
                    }
                }
            }.padding(EdgeInsets(top: 10, leading: 5, bottom: 0, trailing: 5))
            .navigationBarTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .background(Color.black)
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}

struct LevelChooseScene_Previews: PreviewProvider {
    static var previews: some View {
        LevelChooseScene()
    }
}
