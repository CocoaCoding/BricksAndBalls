//  GameEnviroment.swift
//  BricksAndBalls
//  Created by Holger Hinzberg on 17.05.21.

import Foundation

// The Observer protocol declares the update method, used by subjects.
protocol GameEnviromentObserver: AnyObject {

    func update(subject: GameEnviroment)
}

public class GameEnviroment
{
    // @var array List of subscribers. In real life, the list of subscribers
    // can be stored more comprehensively (categorized by event type, etc.).
    private lazy var observers = [GameEnviromentObserver]()

    /// The subscription management methods.
    func attach(_ observer: GameEnviromentObserver) {
        print("Subject: Attached an observer.\n")
        observers.append(observer)
    }

    func detach(_ observer: GameEnviromentObserver) {
        if let idx = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: idx)
            print("Subject: Detached an observer.\n")
        }
    }

    /// Trigger an update in each subscriber.
    func notify() {
        //print("Subject: Notifying observers...\n")
        observers.forEach({ $0.update(subject: self)})
    }
    
    public var currentGameScore:Int {
        didSet {notify() }}
    public var currentLevelNumber:Int  {
        didSet {notify() }}
    public var currentLives:Int  {
        didSet {notify() }}
    public var defaultStartLives:Int  {
        didSet {notify() }}
    
    init()
    {
        self.currentGameScore = 0
        self.currentLevelNumber = 1
        self.defaultStartLives = 4
        self.currentLives = 4
    }
    
    func addCurrentGameScore(value:Int)
    {
        self.currentGameScore += value
        if self.currentGameScore < 0
        {
            self.currentGameScore = 0
        }
    }
    
}

