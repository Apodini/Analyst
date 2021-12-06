
public struct StandardDeviationVectorToVectorOperator<Rule: AggregationRule>: VectorToVectorOperator {

    public let rule: Rule

    public init(rule: Rule) {
        self.rule = rule
    }

}

extension MetricQuery {

    public static func standardDeviation<
        Query: VectorMetricQuery,
        Rule: AggregationRule
    >(
        _ query: Query,
        rule: Rule
    ) -> VectorToVectorQuery<Query, StandardDeviationVectorToVectorOperator<Rule>>
        where Self == VectorToVectorQuery<Query, StandardDeviationVectorToVectorOperator<Rule>> {
        .init(query: query, operator: .init(rule: rule))
    }

    public static func standardDeviation<
        Query: VectorMetricQuery
    >(
        _ query: Query
    ) -> VectorToVectorQuery<Query, StandardDeviationVectorToVectorOperator<DefaultAggregationRule>>
        where Self == VectorToVectorQuery<Query, StandardDeviationVectorToVectorOperator<DefaultAggregationRule>> {
            .init(query: query, operator: .init(rule: .init()))
    }

}
