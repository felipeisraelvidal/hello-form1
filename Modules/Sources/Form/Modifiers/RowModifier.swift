import UIKit

public protocol FormRowModifier {
    associatedtype Row: FormRow
    
    func padding(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) -> Row
    func setBackgroundColor(_ color: UIColor) -> Row
    func setTintColor(_ color: UIColor) -> Row
    func setAccessoryType(_ accessoryType: UITableViewCell.AccessoryType) -> Row
    func setSelectionStyle(_ selectionStyle: UITableViewCell.SelectionStyle) -> Row
    func setDeselectWhenSelect(_ flag: Bool) -> Row
    func addAction(_ action: @escaping () -> Void) -> Row
}
