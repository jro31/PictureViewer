import UIKit

class PictureViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var selectedPicture: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedPicture
        
        if let imageToLoad = selectedPicture {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
