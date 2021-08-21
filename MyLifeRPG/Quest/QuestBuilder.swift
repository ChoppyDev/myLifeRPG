//
//  QuestBuilder.swift
//  MyLifeRPG
//
//  Created by Nicolas Klein on 20/08/2021.
//

import Foundation


struct Quest {

    let id : String
    var name : String
    var xp: Int64 // i dont think its the good method but for the moment its ok
    var time: UnitDuration // verify
    var category: QuestCategory
}
