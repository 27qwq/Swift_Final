//
//  TableViewController.swift
//  Final_exam_277
//
//  Created by apple on 2019/12/23.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit




class TableViewController: UITableViewController {

    
    let loadWebContentService = LoadWeblink()
    
    var personInform: [Event] = []          // 人事通知
    var personNews: [Event] = []            // 人事新闻
    var publicity: [Event] = []             // 公示公告
    var hiring: [Event] = []                // 招聘信息
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        //print("Try to get value...")
        personInform = loadWebContentService.getevents(type: 0)
        //print("0 ok")
        personNews = loadWebContentService.getevents(type: 1)
        //print("1 ok")
        publicity = loadWebContentService.getevents(type: 2)
        //print("2 ok")
        hiring = loadWebContentService.getevents(type: 3)
        //print("3 ok")
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    /*override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return personInform.count
        }
        if section == 1 {
            return personNews.count
        }
        if section == 2 {
            return publicity.count
        }
        if section == 3 {
            return hiring.count
        }
        return 8
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tabelCell", for: indexPath) as! TableViewCell
        
        // 人事通知
        if (indexPath.section == 0) && (indexPath.row < personInform.count) {
            cell.titleLabel?.text = personInform[indexPath.row].title
            if personInform[indexPath.row].isHot {
                cell.fireLabel?.text = "🔥"
            } else {
                cell.fireLabel?.text = ""
            }
        } else if (indexPath.section == 1) && (indexPath.row < personNews.count) {
            cell.titleLabel?.text = personNews[indexPath.row].title
            if personNews[indexPath.row].isHot {
                cell.fireLabel?.text = "🔥"
            } else {
                cell.fireLabel?.text = ""
            }
        } else if (indexPath.section == 2) && (indexPath.row < publicity.count) {
            cell.titleLabel?.text = publicity[indexPath.row].title
            if publicity[indexPath.row].isHot {
                cell.fireLabel?.text = "🔥"
            } else {
                cell.fireLabel?.text = ""
            }
        } else if (indexPath.section == 3) && (indexPath.row < hiring.count) {
            cell.titleLabel?.text = hiring[indexPath.row].title
            if hiring[indexPath.row].isHot {
                cell.fireLabel?.text = "🔥"
            } else {
                cell.fireLabel?.text = ""
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0 {
            return "人事通知"
        }
        if section == 1 {
            return "人事新闻"
        }
        if section == 2 {
            return "公示公告"
        }
        if section == 3 {
            return "招聘信息"
        }
        return "Section \(section)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetails" {
            let detailViewController = segue.destination
                as! ViewController

            let myIndexPath = self.tableView.indexPathForSelectedRow!
            let row = myIndexPath.row
            let section = myIndexPath.section
            if section == 0 {
                detailViewController.link = "https://hr.nju.edu.cn/" + personInform[row].url
            } else if section == 1 {
                detailViewController.link = "https://hr.nju.edu.cn/" + personNews[row].url
            } else if section == 2 {
                detailViewController.link = "https://hr.nju.edu.cn/" + publicity[row].url
            } else if section == 3 {
                detailViewController.link = "https://hr.nju.edu.cn/" + hiring[row].url
            }
        
        }
    }
        

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    //}
    

}
