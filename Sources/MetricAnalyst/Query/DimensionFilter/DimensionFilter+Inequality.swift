
public struct InequalityDimensionFilter: DimensionFilter {

    public let label: String
    public let value: String

    public init(label: String, value: String) {
        self.label = label
        self.value = value
    }

}

extension DimensionFilter where Self == InequalityDimensionFilter {
    public static func notEqual(label: String, value: String) -> InequalityDimensionFilter {
        .init(label: label, value: value)
    }
}

public func !=(lhs: String, rhs: String) -> InequalityDimensionFilter {
    .init(label: lhs, value: rhs)
}
