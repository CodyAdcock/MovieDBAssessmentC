//
//  SwiftMovieTableViewCell.swift
//  MovieDBAssessment
//
//  Created by Cody on 9/14/18.
//  Copyright © 2018 Cody Adcock. All rights reserved.
//

import UIKit

class SwiftMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    @objc var movie: CRAMovie?{
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        guard let movie = movie else {return}
        
        titleLabel.text = movie.title
        ratingLabel.text = "\(movie.rating)"
        summaryLabel.text = movie.summary
    }
}
