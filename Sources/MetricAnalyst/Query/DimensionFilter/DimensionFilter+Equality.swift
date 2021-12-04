
public struct EqualityDimensionFilter: DimensionFilter {

    public let label: String
    public let value: String

    public init(label: String, value: String) {
        self.label = label
        self.value = value
    }

}

extension DimensionFilter where Self == EqualityDimensionFilter {
    public static func equal(label: String, value: String) -> EqualityDimensionFilter {
        .init(label: label, value: value)
    }
}

public func ==(lhs: String, rhs: String) -> EqualityDimensionFilter {
    .init(label: lhs, value: rhs)
}
