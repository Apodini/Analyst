
public struct IntersectionVectorVectorToVectorOperator<Rule: MatchingRule, Grouping: MatchingGroupingRule>: VectorVectorToVectorOperator {

    public let rule: Rule
    public let grouping: Grouping

    public init(rule: Rule, grouping: Grouping) {
        self.rule = rule
        self.grouping = grouping
    }

}

extension MetricQuery {

    public static func and<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Rule: MatchingRule,
        Grouping: MatchingGroupingRule
    >(
        _ left: Left,
        _ right: Right,
        rule: Rule,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Left, IntersectionVectorVectorToVectorOperator<Rule, Grouping>, Right>
        where Self == VectorVectorToVectorQuery<Left, IntersectionVectorVectorToVectorOperator<Rule, Grouping>, Right> {
        .init(left: left, operator: .init(rule: rule, grouping: grouping), right: right)
    }

    public static func and<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Grouping: MatchingGroupingRule
    >(
        _ left: Left,
        _ right: Right,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Left, IntersectionVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right>
        where Self == VectorVectorToVectorQuery<Left, IntersectionVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right> {
            .init(left: left, operator: .init(rule: .init(), grouping: grouping), right: right)
    }

    public static func and<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery,
        Rule: MatchingRule
    >(
        _ left: Left,
        _ right: Right,
        rule: Rule
    ) -> VectorVectorToVectorQuery<Left, IntersectionVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right>
        where Self == VectorVectorToVectorQuery<Left, IntersectionVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right> {
            .init(left: left, operator: .init(rule: rule, grouping: .init()), right: right)
    }

    public static func and<
        Left: VectorMetricQuery,
        Right: VectorMetricQuery
    >(
        _ left: Left,
        _ right: Right
    ) -> VectorVectorToVectorQuery<Left, IntersectionVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right>
        where Self == VectorVectorToVectorQuery<Left, IntersectionVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {

        .init(left: left, operator: .init(rule: .init(), grouping: .init()), right: right)
    }

}

extension VectorMetricQuery {

    public func and<
        Right: VectorMetricQuery,
        Rule: MatchingRule,
        Grouping: MatchingGroupingRule
    >(
        _ right: Right,
        rule: Rule,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Self, IntersectionVectorVectorToVectorOperator<Rule, Grouping>, Right> {
        .init(left: self, operator: .init(rule: rule, grouping: grouping), right: right)
    }

    public func and<
        Right: VectorMetricQuery,
        Rule: MatchingRule
    >(
        _ right: Right,
        rule: Rule
    ) -> VectorVectorToVectorQuery<Self, IntersectionVectorVectorToVectorOperator<Rule, DefaultMatchingGroupingRule>, Right> {
        .init(left: self, operator: .init(rule: rule, grouping: .init()), right: right)
    }

    public func and<
        Right: VectorMetricQuery,
        Grouping: MatchingGroupingRule
    >(
        _ right: Right,
        grouping: Grouping
    ) -> VectorVectorToVectorQuery<Self, IntersectionVectorVectorToVectorOperator<DefaultMatchingRule, Grouping>, Right> {
        .init(left: self, operator: .init(rule: .init(), grouping: grouping), right: right)
    }

    public func and<
        Right: VectorMetricQuery
    >(
        _ right: Right
    ) -> VectorVectorToVectorQuery<Self, IntersectionVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {
        .init(left: self, operator: .init(rule: .init(), grouping: .init()), right: right)
    }

}

public func && <Left: VectorMetricQuery, Right: VectorMetricQuery>(
    _ left: Left,
    _ right: Right
) -> VectorVectorToVectorQuery<Left, IntersectionVectorVectorToVectorOperator<DefaultMatchingRule, DefaultMatchingGroupingRule>, Right> {
    .init(left: left, operator: .init(rule: .init(), grouping: .init()), right: right)
}
