
public struct ExponentiationVectorVectorToVectorOperator<Rule: MatchingRule, Grouping: MatchingGroupingRule>: VectorVectorToVectorOperator {

    public let rule: Rule
    public let grouping: Grouping

    public init(rule: Rule, grouping: Grouping) {
        self.rule = rule
        self.grouping = grouping
    }

}

extension MetricQuery {

    public static func power<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Rule: MatchingRule,
        Grouping: MatchingGroupingRule
    >(
        _ left: Left,
        _ right: Right,
        rule: Rule,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Left, ExponentiationVectorVectorToVectorOperator<Rule, Grouping>, Right>
        where Self == VectorVectorToVectorQuery<Left, ExponentiationVectorVectorToVectorOperator<Rule, Grouping>, Right> {
        .init(left: left, operator: .init(rule: rule, grouping: grouping), right: right)
    }

    public static func power<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Grouping: MatchingGroupingRule
    >(
        _ left: Left,
        _ right: Right,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Left, ExponentiationVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right>
        where Self == VectorVectorToVectorQuery<Left, ExponentiationVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right> {
            .init(left: left, operator: .init(rule: .init(), grouping: grouping), right: right)
    }

    public static func power<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Rule: MatchingRule
    >(
        _ left: Left,
        _ right: Right,
        rule: Rule
    ) -> VectorVectorToVectorQuery<Left, ExponentiationVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right>
        where Self == VectorVectorToVectorQuery<Left, ExponentiationVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right> {
            .init(left: left, operator: .init(rule: rule, grouping: .init()), right: right)
    }

    public static func power<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery
    >(
        _ left: Left,
        _ right: Right
    ) -> VectorVectorToVectorQuery<Left, ExponentiationVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right>
        where Self == VectorVectorToVectorQuery<Left, ExponentiationVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {

        .init(left: left, operator: .init(rule: .init(), grouping: .init()), right: right)
    }

}

extension VectorMetricQuery {

    public func power<
        Right: VectorMetricQuery,
        Rule: MatchingRule,
        Grouping: MatchingGroupingRule
    >(
        _ right: Right,
        rule: Rule,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Self, ExponentiationVectorVectorToVectorOperator<Rule, Grouping>, Right> {
        .init(left: self, operator: .init(rule: rule, grouping: grouping), right: right)
    }

    public func power<
        Right: VectorMetricQuery,
        Rule: MatchingRule
    >(
        _ right: Right,
        rule: Rule
    ) -> VectorVectorToVectorQuery<Self, ExponentiationVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right> {
        .init(left: self, operator: .init(rule: rule, grouping: .init()), right: right)
    }

    public func power<
        Right: VectorMetricQuery,
        Grouping: MatchingGroupingRule
    >(
        _ right: Right,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Self, ExponentiationVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right> {
        .init(left: self, operator: .init(rule: .init(), grouping: grouping), right: right)
    }

    public func power<
        Right: VectorMetricQuery
    >(
        _ right: Right
    ) -> VectorVectorToVectorQuery<Self, ExponentiationVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {
        .init(left: self, operator: .init(rule: .init(), grouping: .init()), right: right)
    }

}

public func ^ <Left: VectorMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorVectorToVectorQuery<Left, ExponentiationVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {
    .init(left: left, operator: .init(rule: .init(), grouping: .init()), right: right)
}
