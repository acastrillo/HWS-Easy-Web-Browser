//
//  ViewController.swift
//  HWS Easy Web Browser
//
//  Created by Alex Castrillo on 9/23/19.
//  Copyright © 2019 Alejo Games. All rights reserved.
//

import UIKit
import WebKit

//Challenge: Try changing the initial view controller to a table view like in project 1, where users can choose their website from a list rather than just having the first in the array loaded up front.

class ViewController: UITableViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    var progressView: UIProgressView!
    var selectedWebsite: String?
    var websites = ["apple.com", "hackingwithswift.com", "google.com", "aventri.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Choose your website"
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    
    //TableView functions
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        websites.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = websites[indexPath.item]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let websiteViewController = storyboard?.instantiateViewController(withIdentifier: "WebsitesViewer") as! WebsiteViewController
        let websiteSelected = websites[indexPath.row]
        print("Got my website:" + websiteSelected)
        websiteViewController.myWebsite = websiteSelected
        navigationController?.pushViewController(websiteViewController, animated: true)
        
    }
    // end table functions
}
