
public struct MinimumVectorToVectorOperator<Rule: AggregationRule>: VectorToVectorOperator {

    public let rule: Rule

    public init(rule: Rule) {
        self.rule = rule
    }

}

extension MetricQuery {

    public static func minimum<
        Query: VectorMetricQuery,
        Rule: AggregationRule
    >(
        _ query: Query,
        rule: Rule
    ) -> VectorToVectorQuery<Query, MinimumVectorToVectorOperator<Rule>>
        where Self == VectorToVectorQuery<Query, MinimumVectorToVectorOperator<Rule>> {
        .init(query: query, operator: .init(rule: rule))
    }

    public static func minimum<
        Query: VectorMetricQuery
    >(
        _ query: Query
    ) -> VectorToVectorQuery<Query, MinimumVectorToVectorOperator<DefaultAggregationRule>>
        where Self == VectorToVectorQuery<Query, MinimumVectorToVectorOperator<DefaultAggregationRule>> {
            .init(query: query, operator: .init(rule: .init()))
    }

}
