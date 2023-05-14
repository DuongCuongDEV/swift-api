//
//  ViewControllerPlayVideo.swift
//  MyMovie
//
//  Created by Dương Văn Cường on 14/05/2023.
//

import UIKit
import YoutubeKit

class ViewControllerPlayVideo: UIViewController {

    private var player: YTSwiftyPlayer!
    var idVideo: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        player = YTSwiftyPlayer(frame: CGRect(x: 0, y: 0, width: 650, height: 450), playerVars: [
            .playsInline(true),
            .videoID(idVideo),
            .loopVideo(true),
            .showRelatedVideo(true)
        ])
        
        player.autoplay = true
        
        view = player
        player.loadPlayer()
        
        let request = VideoListRequest(part: [.id , .snippet, .contentDetails], filter: .chart)
        
        YoutubeAPI.shared.send(request) { result in
            switch result{
            case .success(let responce):
                print(responce)
            case .failure(let error):
                print(error)
            }
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
