
public struct ExclusiveAggregationRule: AggregationRule {

    public let labels: [String]

    public init(labels: [String]) {
        self.labels = labels
    }

}

extension AggregationRule where Self == ExclusiveAggregationRule {

    public static func without(_ labels: String...) -> ExclusiveAggregationRule {
        .init(labels: labels)
    }

    public static func without(_ labels: [String]) -> ExclusiveAggregationRule {
        .init(labels: labels)
    }

}
