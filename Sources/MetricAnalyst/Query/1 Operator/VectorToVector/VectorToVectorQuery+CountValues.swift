
public struct CountValuesVectorToVectorOperator<Rule: AggregationRule>: VectorToVectorOperator {

    public let rule: Rule

    public init(rule: Rule) {
        self.rule = rule
    }

}

extension MetricQuery {

    public static func countValues<
        Query: VectorMetricQuery,
        Rule: AggregationRule
    >(
        _ query: Query,
        rule: Rule
    ) -> VectorToVectorQuery<Query, CountValuesVectorToVectorOperator<Rule>>
        where Self == VectorToVectorQuery<Query, CountValuesVectorToVectorOperator<Rule>> {
        .init(query: query, operator: .init(rule: rule))
    }

    public static func countValues<
        Query: VectorMetricQuery
    >(
        _ query: Query
    ) -> VectorToVectorQuery<Query, CountValuesVectorToVectorOperator<DefaultAggregationRule>>
        where Self == VectorToVectorQuery<Query, CountValuesVectorToVectorOperator<DefaultAggregationRule>> {
            .init(query: query, operator: .init(rule: .init()))
    }

}
