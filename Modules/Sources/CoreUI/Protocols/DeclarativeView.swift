import UIKit

public protocol DeclarativeView {
    associatedtype View: UIView
    
    func fillSuperview(offset: CGFloat) -> View
    func setWidth(_ width: CGFloat) -> View
    func setHeight(_ height: CGFloat) -> View
    func setCornerRadius(_ cornerRadius: CGFloat) -> View
    func setBackgroundColor(_ color: UIColor) -> View
}
