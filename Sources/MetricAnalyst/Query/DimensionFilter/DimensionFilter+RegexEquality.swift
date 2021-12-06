
public struct RegexEqualityDimensionFilter: DimensionFilter {

    public let label: String
    public let value: String

    public init(label: String, value: String) {
        self.label = label
        self.value = value
    }

}

extension DimensionFilter where Self == RegexEqualityDimensionFilter {
    public static func regex(label: String, value: String) -> RegexEqualityDimensionFilter {
        .init(label: label, value: value)
    }
}

public func =~(lhs: String, rhs: String) -> RegexEqualityDimensionFilter {
    .init(label: lhs, value: rhs)
}
