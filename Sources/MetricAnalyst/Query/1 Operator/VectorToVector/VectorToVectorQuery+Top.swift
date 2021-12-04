
public struct TopVectorToVectorOperator<Rule: AggregationRule>: VectorToVectorOperator {

    public let value: Int
    public let rule: Rule

    public init(value: Int, rule: Rule) {
        self.rule = rule
        self.value = value
    }

}

extension MetricQuery {

    public static func top<
        Query: VectorMetricQuery,
        Rule: AggregationRule
    >(
        _ value: Int,
        _ query: Query,
        rule: Rule
    ) -> VectorToVectorQuery<Query, TopVectorToVectorOperator<Rule>>
        where Self == VectorToVectorQuery<Query, TopVectorToVectorOperator<Rule>> {
        .init(query: query, operator: .init(value: value, rule: rule))
    }

    public static func top<
        Query: VectorMetricQuery
    >(
        _ value: Int,
        _ query: Query
    ) -> VectorToVectorQuery<Query, TopVectorToVectorOperator<DefaultAggregationRule>>
        where Self == VectorToVectorQuery<Query, TopVectorToVectorOperator<DefaultAggregationRule>> {
            .init(query: query, operator: .init(value: value, rule: .init()))
    }

}
