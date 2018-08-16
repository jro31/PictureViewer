import UIKit

class ViewController: UICollectionViewController {
    
    var pictures = [String]()
    var numberOfPictures = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select image:"
        
        let fileManager = FileManager.default
        let picturePath = Bundle.main.resourcePath!
        let picture = try! fileManager.contentsOfDirectory(atPath: picturePath)
        
        for eachPicture in picture {
            if eachPicture.hasPrefix("nssl") {
                pictures.append(eachPicture)
            }
        }
        numberOfPictures = pictures.count
        print(numberOfPictures)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfPictures
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Picture", for: indexPath) as! PictureCell
        
        cell.pictureTitle.text = pictures[indexPath.row]
        
        let imageToLoad = pictures[indexPath.row]
        cell.imageView.image = UIImage(named: imageToLoad)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "BigPicture") as? PictureViewController {
            viewController.selectedPicture = pictures[indexPath.row]
            navigationController?.pushViewController(viewController, animated: true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

