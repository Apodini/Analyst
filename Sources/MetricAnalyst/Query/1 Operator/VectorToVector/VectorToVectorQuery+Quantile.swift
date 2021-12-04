
public struct QuantileVectorToVectorOperator<Rule: AggregationRule>: VectorToVectorOperator {

    public let value: Double
    public let rule: Rule

    public init(value: Double, rule: Rule) {
        self.rule = rule
        self.value = value
    }

}

extension MetricQuery {

    public static func quantile<
        Query: VectorMetricQuery,
        Rule: AggregationRule
    >(
        _ value: Double,
        _ query: Query,
        rule: Rule
    ) -> VectorToVectorQuery<Query, QuantileVectorToVectorOperator<Rule>>
        where Self == VectorToVectorQuery<Query, QuantileVectorToVectorOperator<Rule>> {
        .init(query: query, operator: .init(value: value, rule: rule))
    }

    public static func quantile<
        Query: VectorMetricQuery
    >(
        _ value: Double,
        _ query: Query
    ) -> VectorToVectorQuery<Query, QuantileVectorToVectorOperator<DefaultAggregationRule>>
        where Self == VectorToVectorQuery<Query, QuantileVectorToVectorOperator<DefaultAggregationRule>> {
        .init(query: query, operator: .init(value: value, rule: .init()))
    }

}
