
public struct SumVectorToVectorOperator<Rule: AggregationRule>: VectorToVectorOperator {

    public let rule: Rule

    public init(rule: Rule) {
        self.rule = rule
    }

}

extension MetricQuery {

    public static func sum<
        Query: VectorMetricQuery,
        Rule: AggregationRule
    >(
        _ query: Query,
        rule: Rule
    ) -> VectorToVectorQuery<Query, SumVectorToVectorOperator<Rule>>
        where Self == VectorToVectorQuery<Query, SumVectorToVectorOperator<Rule>> {
        .init(query: query, operator: .init(rule: rule))
    }

    public static func sum<
        Query: VectorMetricQuery
    >(
        _ query: Query
    ) -> VectorToVectorQuery<Query, SumVectorToVectorOperator<DefaultAggregationRule>>
        where Self == VectorToVectorQuery<Query, SumVectorToVectorOperator<DefaultAggregationRule>> {
            .init(query: query, operator: .init(rule: .init()))
    }

}
