//
//  NewsCell.swift
//  SketchHeader
//
//  Created by Li Pan on 2016-02-16.
//  Copyright © 2016 Li Pan. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    @IBOutlet weak var newsCategoryLabel: UILabel!

    @IBOutlet weak var newsHeadlineLabel: UILabel!
    
    var newsItem: NewsItem? {
        didSet {
            if let item = newsItem {
                newsCategoryLabel.text = item.category.toString()
                newsCategoryLabel.textColor = item.category.toColor()
                newsHeadlineLabel.text = item.summary
            }
            else {
                newsCategoryLabel.text = nil
                newsHeadlineLabel.text = nil
            }
        }
    }
}
