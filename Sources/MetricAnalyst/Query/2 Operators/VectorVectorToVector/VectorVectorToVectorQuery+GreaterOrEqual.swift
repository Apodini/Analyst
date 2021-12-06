
public struct GreaterOrEqualVectorVectorToVectorOperator<Rule: MatchingRule, Grouping: MatchingGroupingRule>: VectorVectorToVectorOperator {

    public let rule: Rule
    public let grouping: Grouping

    public init(rule: Rule, grouping: Grouping) {
        self.rule = rule
        self.grouping = grouping
    }

}

extension MetricQuery {

    public static func greaterOrEqual<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Rule: MatchingRule,
        Grouping: MatchingGroupingRule
    >(
        _ left: Left,
        to right: Right,
        rule: Rule,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Left, GreaterOrEqualVectorVectorToVectorOperator<Rule, Grouping>, Right>
        where Self == VectorVectorToVectorQuery<Left, GreaterOrEqualVectorVectorToVectorOperator<Rule, Grouping>, Right> {
        .init(left: left, operator: .init(rule: rule, grouping: grouping), right: right)
    }

    public static func greaterOrEqual<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Grouping: MatchingGroupingRule
    >(
        _ left: Left,
        to right: Right,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Left, GreaterOrEqualVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right>
        where Self == VectorVectorToVectorQuery<Left, GreaterOrEqualVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right> {
            .init(left: left, operator: .init(rule: .init(), grouping: grouping), right: right)
    }

    public static func greaterOrEqual<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Rule: MatchingRule
    >(
        _ left: Left,
        to right: Right,
        rule: Rule
    ) -> VectorVectorToVectorQuery<Left, GreaterOrEqualVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right>
        where Self == VectorVectorToVectorQuery<Left, GreaterOrEqualVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right> {
            .init(left: left, operator: .init(rule: rule, grouping: .init()), right: right)
    }

    public static func greaterOrEqual<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery
    >(
        _ left: Left,
        to right: Right
    ) -> VectorVectorToVectorQuery<Left, GreaterOrEqualVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right>
        where Self == VectorVectorToVectorQuery<Left, GreaterOrEqualVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {

        .init(left: left, operator: .init(rule: .init(), grouping: .init()), right: right)
    }

}

extension VectorMetricQuery {

    public func greaterOrEqual<
        Right: VectorMetricQuery,
        Rule: MatchingRule,
        Grouping: MatchingGroupingRule
    >(
        to right: Right,
        rule: Rule,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Self, GreaterOrEqualVectorVectorToVectorOperator<Rule, Grouping>, Right> {
        .init(left: self, operator: .init(rule: rule, grouping: grouping), right: right)
    }

    public func greaterOrEqual<
        Right: VectorMetricQuery,
        Rule: MatchingRule
    >(
        to right: Right,
        rule: Rule
    ) -> VectorVectorToVectorQuery<Self, GreaterOrEqualVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right> {
        .init(left: self, operator: .init(rule: rule, grouping: .init()), right: right)
    }

    public func greaterOrEqual<
        Right: VectorMetricQuery,
        Grouping: MatchingGroupingRule
    >(
        to right: Right,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Self, GreaterOrEqualVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right> {
        .init(left: self, operator: .init(rule: .init(), grouping: grouping), right: right)
    }

    public func greaterOrEqual<
        Right: VectorMetricQuery
    >(
        to right: Right
    ) -> VectorVectorToVectorQuery<Self, GreaterOrEqualVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {
        .init(left: self, operator: .init(rule: .init(), grouping: .init()), right: right)
    }

}

public func >= <Left: VectorMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorVectorToVectorQuery<Left, GreaterOrEqualVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {
    .init(left: left, operator: .init(rule: .init(), grouping: .init()), right: right)
}
