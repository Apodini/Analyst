
public struct StandardVarianceVectorToVectorOperator<Rule: AggregationRule>: VectorToVectorOperator {

    public let rule: Rule

    public init(rule: Rule) {
        self.rule = rule
    }

}

extension MetricQuery {

    public static func standardVariance<
        Query: VectorMetricQuery,
        Rule: AggregationRule
    >(
        _ query: Query,
        rule: Rule
    ) -> VectorToVectorQuery<Query, StandardVarianceVectorToVectorOperator<Rule>>
        where Self == VectorToVectorQuery<Query, StandardVarianceVectorToVectorOperator<Rule>> {
        .init(query: query, operator: .init(rule: rule))
    }

    public static func standardVariance<
        Query: VectorMetricQuery
    >(
        _ query: Query
    ) -> VectorToVectorQuery<Query, StandardVarianceVectorToVectorOperator<DefaultAggregationRule>>
        where Self == VectorToVectorQuery<Query, StandardVarianceVectorToVectorOperator<DefaultAggregationRule>> {
            .init(query: query, operator: .init(rule: .init()))
    }

}
