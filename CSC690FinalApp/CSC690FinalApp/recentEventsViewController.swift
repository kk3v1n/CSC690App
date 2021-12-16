//used (Todo App: UserDefaults and a quick intro to coredata video) F21W13E04 - from class to help me on this part
// also used stackedoverflow and apple documents

import UIKit

struct Pastevents{
    let title: String
}


class recentEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    var pastEventList: [Pastevents] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //past events, hardcoded to show that there were events held in the "past"
        let newItem = Pastevents(title: "Crazy Connect 4, Ended 2 days ago")
        pastEventList.append(newItem)
        let newItem1 = Pastevents(title: "Wild 2048, Ended 4 days ago")
        pastEventList.append(newItem1)
        let newItem2 = Pastevents(title: "Craze Checkers, Ended 5 days ago")
        pastEventList.append(newItem2)
        let newItem3 = Pastevents(title: "Chill Chess, Ended 8 days ago")
        pastEventList.append(newItem3)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pastEventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = pastEventList[indexPath.row]
        cell.textLabel?.text = item.title
        return cell
    }
    
    //trying to add more info when pressed upon
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
