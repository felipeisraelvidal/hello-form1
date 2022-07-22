import UIKit

extension UIFont {
    func with(traits: UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont {
        return with(traits: .traitBold)
    }
    
    func italic() -> UIFont {
        return with(traits: .traitItalic)
    }
}
