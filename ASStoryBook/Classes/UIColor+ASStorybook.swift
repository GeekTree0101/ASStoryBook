import Foundation
import UIKit

extension UIColor {
    static let storybook: UIColor = {
        return UIColor(red: 77 / 255,
                       green: 96 / 255,
                       blue: 125 / 255,
                       alpha: 1.0)
    }()
    
    static var randomColor: UIColor {
        let storybookSampleColorList: [UIColor] = [.storybookSampleRed,
                                                   .storybookSampleBlue,
                                                   .storybookSampleGreen,
                                                   .storybookSampleOrange,
                                                   .storybookSampleYellow,
                                                   .storybookSamplePink,
                                                   .storybookSamplePurple,
                                                   .storybookSampleSkyblue]
        let randIndex: Int = Int(arc4random_uniform(UInt32(storybookSampleColorList.count)))
        return storybookSampleColorList[randIndex]
    }
    
    static var storybookSampleRed: UIColor {
        return UIColor.init(red: 237.0 / 255.0,
                            green: 67.0 / 255.0,
                            blue: 67.0 / 255.0,
                            alpha: 1.0)
    }
    
    static var storybookSampleBlue: UIColor {
        return UIColor.init(red: 32.0 / 255.0,
                            green: 119.0 / 255.0,
                            blue: 153.0 / 255.0,
                            alpha: 1.0)
    }
    
    static var storybookSampleGreen: UIColor {
        return UIColor.init(red: 48.0 / 255.0,
                            green: 136.0 / 255.0,
                            blue: 102.0 / 255.0,
                            alpha: 1.0)
    }
    
    static var storybookSampleOrange: UIColor {
        return UIColor.init(red: 249.0 / 255.0,
                            green: 176.0 / 255.0,
                            blue: 146.0 / 255.0,
                            alpha: 1.0)
    }
    
    static var storybookSampleYellow: UIColor {
        return UIColor.init(red: 249.0 / 255.0,
                            green: 230.0 / 255.0,
                            blue: 146.0 / 255.0,
                            alpha: 1.0)
    }
    
    static var storybookSamplePurple: UIColor {
        return UIColor.init(red: 179.0 / 255.0,
                            green: 74.0 / 255.0,
                            blue: 214.0 / 255.0,
                            alpha: 1.0)
    }
    
    static var storybookSamplePink: UIColor {
        return UIColor.init(red: 179.0 / 255.0,
                            green: 74.0 / 255.0,
                            blue: 214.0 / 255.0,
                            alpha: 1.0)
    }
    
    static var storybookSampleSkyblue: UIColor {
        return UIColor.init(red: 130.0 / 255.0,
                            green: 218.0 / 255.0,
                            blue: 224.0 / 255.0,
                            alpha: 1.0)
    }
}
