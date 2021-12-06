
public struct MultiplicationVectorVectorToVectorOperator<Rule: MatchingRule, Grouping: MatchingGroupingRule>: VectorVectorToVectorOperator {

    public let rule: Rule
    public let grouping: Grouping

    public init(rule: Rule, grouping: Grouping) {
        self.rule = rule
        self.grouping = grouping
    }

}

extension MetricQuery {

    public static func multiply<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Rule: MatchingRule,
        Grouping: MatchingGroupingRule
    >(
        _ left: Left,
        with right: Right,
        rule: Rule,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Left, MultiplicationVectorVectorToVectorOperator<Rule, Grouping>, Right>
        where Self == VectorVectorToVectorQuery<Left, MultiplicationVectorVectorToVectorOperator<Rule, Grouping>, Right> {
        .init(left: left, operator: .init(rule: rule, grouping: grouping), right: right)
    }

    public static func multiply<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Grouping: MatchingGroupingRule
    >(
        _ left: Left,
        with right: Right,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Left, MultiplicationVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right>
        where Self == VectorVectorToVectorQuery<Left, MultiplicationVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right> {
            .init(left: left, operator: .init(rule: .init(), grouping: grouping), right: right)
    }

    public static func multiply<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Rule: MatchingRule
    >(
        _ left: Left,
        with right: Right,
        rule: Rule
    ) -> VectorVectorToVectorQuery<Left, MultiplicationVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right>
        where Self == VectorVectorToVectorQuery<Left, MultiplicationVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right> {
            .init(left: left, operator: .init(rule: rule, grouping: .init()), right: right)
    }

    public static func multiply<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery
    >(
        _ left: Left,
        with right: Right
    ) -> VectorVectorToVectorQuery<Left, MultiplicationVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right>
        where Self == VectorVectorToVectorQuery<Left, MultiplicationVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {

        .init(left: left, operator: .init(rule: .init(), grouping: .init()), right: right)
    }

}

extension VectorMetricQuery {

    public func multiply<
        Right: VectorMetricQuery,
        Rule: MatchingRule,
        Grouping: MatchingGroupingRule
    >(
        with right: Right,
        rule: Rule,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Self, MultiplicationVectorVectorToVectorOperator<Rule, Grouping>, Right> {
        .init(left: self, operator: .init(rule: rule, grouping: grouping), right: right)
    }

    public func multiply<
        Right: VectorMetricQuery,
        Rule: MatchingRule
    >(
        with right: Right,
        rule: Rule
    ) -> VectorVectorToVectorQuery<Self, MultiplicationVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right> {
        .init(left: self, operator: .init(rule: rule, grouping: .init()), right: right)
    }

    public func multiply<
        Right: VectorMetricQuery,
        Grouping: MatchingGroupingRule
    >(
        with right: Right,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Self, MultiplicationVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right> {
        .init(left: self, operator: .init(rule: .init(), grouping: grouping), right: right)
    }

    public func multiply<
        Right: VectorMetricQuery
    >(
        with right: Right
    ) -> VectorVectorToVectorQuery<Self, MultiplicationVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {
        .init(left: self, operator: .init(rule: .init(), grouping: .init()), right: right)
    }

}

public func * <Left: VectorMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorVectorToVectorQuery<Left, MultiplicationVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {
    .init(left: left, operator: .init(rule: .init(), grouping: .init()), right: right)
}
