import UIKit

final class AdvertisementItemVC: UIViewController {
    
    private let advImageView: UIImageView
    
    
    init(advImageName: String) {
        self.advImageView = UIImageView(image: UIImage(named: advImageName))
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.view.addSubview(self.advImageView)
    }

    override func viewDidLayoutSubviews() {
        self.advImageView.frame = super.view.bounds
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}
