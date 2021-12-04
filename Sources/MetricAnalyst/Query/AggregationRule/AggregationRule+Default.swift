
public struct DefaultAggregationRule: AggregationRule {
    public init() {}
}

extension AggregationRule where Self == DefaultAggregationRule {
    public static var `default`: DefaultAggregationRule {
        .init()
    }
}
