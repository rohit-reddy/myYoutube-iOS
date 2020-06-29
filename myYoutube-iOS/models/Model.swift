//
//  Model.swift
//  myYoutube-iOS
//
//  Created by Rohit Ashok on 21/06/20.
//  Copyright © 2020 Rohit Ashok. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    
    func videosFetched(_ videos: [Video])
}

class Model{
    
    var delegate : ModelDelegate?
    
    func getVideos(){
        //create a URL object
        let url = URL(string: Constants.API_URL)
        
        guard url != nil else{
            return
        }
        
        //Get a URLSession object
        let session = URLSession.shared
        
        //Get a data task from URLSession object
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            //check if any error
            if error != nil || data == nil{
                return
            }
            
            // parse data
            do{
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                // return the result to the delegate class
                if response.items != nil{
                    
                    DispatchQueue.main.async {
                          self.delegate?.videosFetched(response.items!)
                    }
                  
                }
                
                dump(response)
            }catch{
                
            }
            
        }
        
        //kick off the task
        dataTask.resume()
    }
}
