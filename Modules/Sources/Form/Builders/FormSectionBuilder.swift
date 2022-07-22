import Foundation

@resultBuilder
public struct FormSectionBuilder {
    public static func buildBlock(_ rows: FormRowBase...) -> [FormRowBase] {
        rows
    }
}
