import Foundation
import AsyncDisplayKit

class ASStorybookCategoryNodeController: UINavigationController {
    let category: ASStoryBookSubCategory
    
    lazy var closeButton: UIBarButtonItem = {
        return UIBarButtonItem(barButtonSystemItem: .reply,
                               target: self,
                               action: #selector(closeCategoryNode))
    }()
    
    lazy var prevButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "Prev",
                               style: .plain,
                               target: self,
                               action: #selector(moveToPrev))
    }()
    
    lazy var nextButton: UIBarButtonItem = {
        return UIBarButtonItem(title: "Next",
                               style: .plain,
                               target: self,
                               action: #selector(moveToNext))
    }()
    
    init(_ category: ASStoryBookSubCategory) {
        self.category = category
        super.init(nibName: nil, bundle: nil)
        self.delegate = self
        
        switch category.story {
        case .viewControllers(let items):
            guard let viewController = items.first?.value else {
                fatalError("Storybook Fatal Error: Items is Empty")
            }
            self.setViewControllers([viewController], animated: true)
        default:
            fatalError("Storybook Fatal Error: Wrong Category Type")
        }
    }
    
    @objc func closeCategoryNode() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func moveToPrev() {
        self.moveTo(direction: .prev)
    }
    
    @objc func moveToNext() {
        self.moveTo(direction: .next)
    }
    
    enum Direction {
        case prev
        case next
    }
    
    private func moveTo(direction: Direction) {
        guard let presentViewController = self.topViewController else { return }
        
        switch category.story {
        case .viewControllers(let items):
            guard let index = items.map({ $0.value }).index(of: presentViewController) else { return }
            switch direction {
            case .prev:
                let targetIndex = index - 1
                guard targetIndex > -1 else { return }
                let viewController = items.map({ $0.value })[targetIndex]
                viewController.title = items.map({ $0.key })[targetIndex]
                self.setViewControllers([viewController], animated: true)
            case .next:
                let targetIndex = index + 1
                
                guard targetIndex < items.count else { return }
                let viewController = items.map({ $0.value })[targetIndex]
                viewController.title = items.map({ $0.key })[targetIndex]
                self.setViewControllers([viewController], animated: true)
            }
        default:
            return
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ASStorybookCategoryNodeController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController,
                              animated: Bool) {
        guard case .viewControllers(let items) = self.category.story else { return }
        guard let index = items.map({ $0.value }).index(of: viewController) else {
            return
        }
        
        // update prevButton state
        if index == 0 {
            self.prevButton.isEnabled = false
        } else {
            self.prevButton.isEnabled = true
        }
        
        var totalCount: Int = 0
        
        switch category.story {
        case .viewControllers(let items):
            totalCount = items.count
        default:
            break
        }
        
        // update nextButton state
        if totalCount == index + 1 {
            self.nextButton.isEnabled = false
        } else {
            self.nextButton.isEnabled = true
        }
        
        // update bar button items on navigationItem
        viewController.navigationItem
            .setRightBarButtonItems([nextButton, prevButton],
                                    animated: true)
        viewController.navigationItem
            .setLeftBarButtonItems([closeButton],
                                   animated: true)
    }
}
