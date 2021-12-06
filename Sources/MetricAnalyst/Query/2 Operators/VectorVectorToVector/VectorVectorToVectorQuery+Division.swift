
public struct DivisionVectorVectorToVectorOperator<Rule: MatchingRule, Grouping: MatchingGroupingRule>: VectorVectorToVectorOperator {

    public let rule: Rule
    public let grouping: Grouping

    public init(rule: Rule, grouping: Grouping) {
        self.rule = rule
        self.grouping = grouping
    }

}

extension MetricQuery {

    public static func divide<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Rule: MatchingRule,
        Grouping: MatchingGroupingRule
    >(
        _ left: Left,
        by right: Right,
        rule: Rule,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Left, DivisionVectorVectorToVectorOperator<Rule, Grouping>, Right>
        where Self == VectorVectorToVectorQuery<Left, DivisionVectorVectorToVectorOperator<Rule, Grouping>, Right> {
        .init(left: left, operator: .init(rule: rule, grouping: grouping), right: right)
    }

    public static func divide<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Grouping: MatchingGroupingRule
    >(
        _ left: Left,
        by right: Right,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Left, DivisionVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right>
        where Self == VectorVectorToVectorQuery<Left, DivisionVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right> {
            .init(left: left, operator: .init(rule: .init(), grouping: grouping), right: right)
    }

    public static func divide<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Rule: MatchingRule
    >(
        _ left: Left,
        by right: Right,
        rule: Rule
    ) -> VectorVectorToVectorQuery<Left, DivisionVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right>
        where Self == VectorVectorToVectorQuery<Left, DivisionVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right> {
            .init(left: left, operator: .init(rule: rule, grouping: .init()), right: right)
    }

    public static func divide<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery
    >(
        _ left: Left,
        by right: Right
    ) -> VectorVectorToVectorQuery<Left, DivisionVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right>
        where Self == VectorVectorToVectorQuery<Left, DivisionVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {

        .init(left: left, operator: .init(rule: .init(), grouping: .init()), right: right)
    }

}

extension VectorMetricQuery {

    public func divide<
        Right: VectorMetricQuery,
        Rule: MatchingRule,
        Grouping: MatchingGroupingRule
    >(
        by right: Right,
        rule: Rule,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Self, DivisionVectorVectorToVectorOperator<Rule, Grouping>, Right> {
        .init(left: self, operator: .init(rule: rule, grouping: grouping), right: right)
    }

    public func divide<
        Right: VectorMetricQuery,
        Rule: MatchingRule
    >(
        by right: Right,
        rule: Rule
    ) -> VectorVectorToVectorQuery<Self, DivisionVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right> {
        .init(left: self, operator: .init(rule: rule, grouping: .init()), right: right)
    }

    public func divide<
        Right: VectorMetricQuery,
        Grouping: MatchingGroupingRule
    >(
        by right: Right,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Self, DivisionVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right> {
        .init(left: self, operator: .init(rule: .init(), grouping: grouping), right: right)
    }

    public func divide<
        Right: VectorMetricQuery
    >(
        by right: Right
    ) -> VectorVectorToVectorQuery<Self, DivisionVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {
        .init(left: self, operator: .init(rule: .init(), grouping: .init()), right: right)
    }

}

public func / <Left: VectorMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorVectorToVectorQuery<Left, DivisionVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {
    .init(left: left, operator: .init(rule: .init(), grouping: .init()), right: right)
}
