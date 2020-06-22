import UIKit

final class AdvertisementVC: UIPageViewController {
    
    private var advPages = [UIViewController]()
    
    
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let adv1 = AdvertisementItemVC(advImageName: "adv1")
        self.advPages.append(adv1)
        
        let adv2 = AdvertisementItemVC(advImageName: "adv1")
        self.advPages.append(adv2)

        super.dataSource = self
        super.setViewControllers([adv1], direction: .forward, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for subView in super.view.subviews {
            if let scroll = subView as? UIScrollView {
                scroll.frame = super.view.bounds
            }
        }
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
}

extension AdvertisementVC: UIPageViewControllerDataSource {
    func presentationCount(for pageViewController: UIPageViewController) -> Int { self.advPages.count }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int { 0 }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let curIdx = self.advPages.firstIndex(of: viewController) {
            let beforeIdx = curIdx - 1
            if beforeIdx >= 0 {
                return self.advPages[beforeIdx]
            }
        }
        
        return nil
    }
    
    func pageViewController(_ pageVIewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let curIdx = self.advPages.firstIndex(of: viewController) {
            let afterIdx = curIdx + 1
            if afterIdx < self.advPages.count {
                return self.advPages[afterIdx]
            }
        }
        
        return nil
    }
}
