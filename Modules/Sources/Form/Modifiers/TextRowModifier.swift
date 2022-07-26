import UIKit

public protocol TextRowModifier {
    associatedtype RowType: Row
    
    func setFont(_ font: UIFont) -> RowType
    func setTextColor(_ color: UIColor) -> RowType
    func setTextAlignment(_ alignment: NSTextAlignment) -> RowType
}

