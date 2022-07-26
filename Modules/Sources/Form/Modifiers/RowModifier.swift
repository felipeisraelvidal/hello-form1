import Foundation

public protocol FormRowModifier {
    associatedtype Row: FormRow
    
    func padding(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) -> Row
    func addAction(_ action: @escaping () -> Void) -> Row
}
