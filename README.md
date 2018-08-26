<img src="https://github.com/GeekTree0101/ASStoryBook/blob/master/Resource/banner.png">


[![CI Status](https://img.shields.io/travis/Geektree0101/ASStoryBook.svg?style=flat)](https://travis-ci.org/Geektree0101/ASStoryBook)
[![Version](https://img.shields.io/cocoapods/v/ASStoryBook.svg?style=flat)](https://cocoapods.org/pods/ASStoryBook)
[![License](https://img.shields.io/cocoapods/l/ASStoryBook.svg?style=flat)](https://cocoapods.org/pods/ASStoryBook)
[![Platform](https://img.shields.io/cocoapods/p/ASStoryBook.svg?style=flat)](https://cocoapods.org/pods/ASStoryBook)


## Example
- Sample Project: https://github.com/GeekTree0101/ASStoryBook/tree/master/Example/Sample
- Video: https://youtu.be/-TEbhEr3yZY

> ### 1. Create Stroybook
```swift
import Foundation
import ASStoryBook

// 1. Inherit ASStoryBookProtocol
struct SampleStorybook: ASStoryBookProtocol {
    static var generate: ASStoryBookGroupCategory = {
        // 2. create mock UI
        let cCellNode1 = CCellNode.init(desc: "Has Description")
        let cCellNode2 = CCellNode.init(desc: nil)
        
        let cCellNodeCategory =
            ASStoryBookSubCategory("CCellNode",
                                   story: .list(["has desc case": cCellNode1,
                                                 "empty desc case": cCellNode2]))
        
        
        let dCellNode1 = DCellNode.init(.large)
        let dCellNode2 = DCellNode.init(.small)
        
        // 3. create sub category
        let dCellNodeCategory =
            ASStoryBookSubCategory("DCellNode",
                                   story: .list(["large case": dCellNode1,
                                                 "small case": dCellNode2]))
        
        // 4. create group category
        return ASStoryBookGroupCategory("Sample Controller",
                                        categories: [cCellNodeCategory,
                                                     dCellNodeCategory])
    }()
}
```

> ### 2. Create Storybook AppDelegate
```swift
import UIKit
import ASStoryBook

@UIApplicationMain
class SampleStorybookAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // MARK: - Setup attribute
        ASStorybookManager.manager.setupAppname("Sample") // Optional
        // ASStorybookManager.manager.setupEnableHitTestDebug() // Optionnal
        
        // MARK: - Setup Categories
        ASStorybookManager.manager.setupCategories([ExampleStorybook.generate,
                                                    SampleStorybook.generate,
                                                    ProfileStoryBook.generate])
        
        // MARK: - Run
        window = ASStorybookManager.manager.didFinishLaunching()
        
        return true
    }
}
```

## Requirements
here -> https://github.com/GeekTree0101/ASStoryBook/blob/master/ASStoryBook.podspec

## Installation

<img src="https://github.com/GeekTree0101/ASStoryBook/blob/master/Resource/step1.png">
<img src="https://github.com/GeekTree0101/ASStoryBook/blob/master/Resource/step2.png">
<img src="https://github.com/GeekTree0101/ASStoryBook/blob/master/Resource/step3.png">
<img src="https://github.com/GeekTree0101/ASStoryBook/blob/master/Resource/step4.png">
<img src="https://github.com/GeekTree0101/ASStoryBook/blob/master/Resource/step5.png">


```ruby
use_frameworks!

target 'YOUR_PROJECT_TARGET_NAME' do
    ...
end

target 'YOUR_STORY_BOOK_TARGET_NAME' do
    pod 'ASStoryBook', :git => 'https://github.com/GeekTree0101/ASStoryBook.git', :branch => 'master'
end
```

## Author
Geektree0101, h2s1880@gmail.com

## License
ASStoryBook is available under the MIT license. See the LICENSE file for more info.
