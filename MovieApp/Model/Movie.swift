//
//  Movie.swift
//  MovieApp
//
//  Created by MahyarShakouri on 9/3/1400 AP.
//

import RealmSwift

class Movie : Object {
    @objc dynamic var title : String = ""
    @objc dynamic var year : Int = 0
    @objc dynamic var numOfSeasons : Int = 0
    
}


