
public struct BottomVectorToVectorOperator<Rule: AggregationRule>: VectorToVectorOperator {

    public let value: Int
    public let rule: Rule

    public init(value: Int, rule: Rule) {
        self.rule = rule
        self.value = value
    }

}

extension MetricQuery {

    public static func bottom<
        Query: VectorMetricQuery,
        Rule: AggregationRule
    >(
        _ value: Int,
        _ query: Query,
        rule: Rule
    ) -> VectorToVectorQuery<Query, BottomVectorToVectorOperator<Rule>>
        where Self == VectorToVectorQuery<Query, BottomVectorToVectorOperator<Rule>> {
            .init(query: query, operator: .init(value: value, rule: rule))
    }

    public static func bottom<
        Query: VectorMetricQuery
    >(
        _ value: Int,
        _ query: Query
    ) -> VectorToVectorQuery<Query, BottomVectorToVectorOperator<DefaultAggregationRule>>
        where Self == VectorToVectorQuery<Query, BottomVectorToVectorOperator<DefaultAggregationRule>> {
            .init(query: query, operator: .init(value: value, rule: .init()))
    }

}
