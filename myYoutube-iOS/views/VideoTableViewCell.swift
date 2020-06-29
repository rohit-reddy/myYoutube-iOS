//
//  VideoTableViewCell.swift
//  myYoutube-iOS
//
//  Created by Rohit Ashok on 28/06/20.
//  Copyright © 2020 Rohit Ashok. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var videos : Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v: Video){
        
        self.videos = v
        //check video
        guard self.videos != nil else {
            return
        }
        //set cell
        self.titleLabel.text = videos?.title
        
        //set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: videos!.published)
        
        guard self.videos!.thumbnail != "" else {
            return
        }
        
        if let cachedData = CacheManager.getVideoCache(self.videos!.thumbnail){
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
        }
        //download thumbnail data
        let url = URL(string: self.videos!.thumbnail)
        
        //get the shared url object
        let session = URLSession.shared
        
        //get data task
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil{
                
                //cache the data in cachemanager
                CacheManager.setVideoCache(url!.absoluteString, data!)
                
                //check the downloaded url matches with this cell url that it displays
                if url?.absoluteString != self.videos!.thumbnail{
                    // video cell has been recycled and no longer matches the thumbnail that is downloaded
                    return
                }
                
                //create image object
                let image = UIImage(data: data!)
                
                //set imageview
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
        }
        //start data task
        dataTask.resume()
    }

}
