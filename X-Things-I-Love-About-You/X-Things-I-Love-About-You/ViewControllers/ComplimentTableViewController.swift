//
//  ComplimentTableViewController.swift
//  X-Things-I-Love-About-You
//
//  Created by Thomas Kellough on 1/24/21.
//

import UIKit

class ComplimentTableViewController: UITableViewController {

    let compliments = AllCompliments().compliments
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let compliment = compliments[indexPath.row]
        
        let image = UIImage(named: compliment.image)
        cell.imageView?.image = image
        cell.imageView?.contentMode = .scaleAspectFill
        
        cell.textLabel?.text = compliment.title
        
        let itemSize = CGSize.init(width: 75, height: 75)
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.main.scale);
        let imageRect = CGRect.init(origin: CGPoint.zero, size: itemSize)
        cell.imageView?.image!.draw(in: imageRect)
        cell.imageView?.image! = UIGraphicsGetImageFromCurrentImageContext()!;
        UIGraphicsEndImageContext();
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        compliments.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "ComplimentViewController") as? ComplimentViewController {
            vc.selectedDay = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        }
    }

}
