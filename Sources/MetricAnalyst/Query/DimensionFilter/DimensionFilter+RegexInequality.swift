
public struct RegexInequalityDimensionFilter: DimensionFilter {

    public let label: String
    public let value: String

    public init(label: String, value: String) {
        self.label = label
        self.value = value
    }

}

extension DimensionFilter where Self == RegexInequalityDimensionFilter {
    public static func notRegex(label: String, value: String) -> RegexInequalityDimensionFilter {
        .init(label: label, value: value)
    }
}

public func !~(lhs: String, rhs: String) -> RegexInequalityDimensionFilter {
    .init(label: lhs, value: rhs)
}
