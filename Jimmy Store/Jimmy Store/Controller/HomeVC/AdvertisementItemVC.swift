import UIKit

final class AdvertisementItemVC: UIViewController {
    private var advImageView: UIImageView!
    private let advImageName: String
    
    
    init(advImageName: String) {
        self.advImageName = advImageName
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imgView = UIImageView()
        imgView.isUserInteractionEnabled = true
        imgView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTapped(_:))))
        imgView.image = UIImage(named: self.advImageName)
        self.advImageView = imgView
        
        super.view.addSubview(self.advImageView)
    }

    override func viewDidLayoutSubviews() {
        self.advImageView.frame = super.view.bounds
    }
    
    
    @objc private func imageTapped(_ recognizer: UITapGestureRecognizer) {
        if let url = URL(string: "https://www.apple.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}
