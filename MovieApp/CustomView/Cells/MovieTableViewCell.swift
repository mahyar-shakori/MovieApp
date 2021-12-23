//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by MahyarShakouri on 9/4/1400 AP.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

   
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seasonsLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    func config(_ movie: Movie){
        self.titleLabel.text = movie.title
        self.seasonsLabel.text = "\(movie.numOfSeasons) Seasons"
        self.yearLabel.text = "\(movie.year)"
    }

}
