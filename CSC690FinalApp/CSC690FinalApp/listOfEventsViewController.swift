//used (Todo App: UserDefaults and a quick intro to coredata video) F21W13E04 - from class to help me on this part
//apple documents

//if i had more time or another person helping me, the user would be able to log in / sign up and then would the user would be able to create an event, in which the pin then be placed onto the map based on where they wanted to create the event


import UIKit

struct Newevent{
    let title: String
}

class listOfEventsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var eventList: [Newevent] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItem = Newevent(title: "Wicked TicTacToe @San Jose McEnery")
        eventList.append(newItem)
        let newItem1 = Newevent(title: "Classic Chess @Santa Clara Convention")
        eventList.append(newItem1)
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    @IBAction func addNewEvent(_ sender: Any) {
        
        
        //in reality the user should log in before they post an event and even press the button
        //"create event"
        
        //i didnt want to bypass either of that but to make it more functional than what i had,
        //i decided to keep the "create event" button so that
        //every time the user presses "Create Event" the item below is created
        
        let newItem = Newevent(title: "You have to log in to add and save an event!")
        eventList.append(newItem)
        
        let lastItemIndex = eventList.count-1
        
        let newItemIndexPath = IndexPath(row: lastItemIndex, section: 0)
        
        tableView.beginUpdates()
        tableView.insertRows(at: [newItemIndexPath], with: .fade)
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = eventList[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        return cell
    }
    
    //trying to add more info when pressed upon
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
