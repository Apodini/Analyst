
public struct InclusiveAggregationRule: AggregationRule {

    public let labels: [String]

    public init(labels: [String]) {
        self.labels = labels
    }

}

extension AggregationRule where Self == InclusiveAggregationRule {

    public static func by(_ labels: String...) -> InclusiveAggregationRule {
        .init(labels: labels)
    }

    public static func by(_ labels: [String]) -> InclusiveAggregationRule {
        .init(labels: labels)
    }

}
