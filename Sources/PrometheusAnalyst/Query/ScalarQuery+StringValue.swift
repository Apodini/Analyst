
extension ScalarQuery.Kind {

    var stringValue: String {
        switch self {
        case let .rate(range):
            return "rate(" + range.stringValue + ")"
        case let .aggregationOverTime(aggregation, range):
            return aggregation.stringValue(range.stringValue)
        case let .aggregation(aggregation, scalar, rule):
            return aggregation.stringValue(scalar.stringValue, rule: rule)
        case let .delta(range):
            return "delta(" + range.stringValue + ")"
        case let .metric(metric):
            return metric.information.stringValue
        case let .operation(operation, lhs, rhs):
            return lhs.stringValue + " " + operation.stringValue + " " + rhs.stringValue
        }
    }

}

extension ScalarQuery.Operator {

    var stringValue: String {
        switch self {
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .multiply:
            return "*"
        case .divide:
            return "/"
        case .exponentiate:
            return "^"
        }
    }

}

extension ScalarQuery.AggregationOverTime {

    func stringValue(_ content: String) -> String {
        switch self {
        case .average:
            return "avg_over_time(" + content + ")"
        case .min:
            return "min_over_time(" + content + ")"
        case .max:
            return "max_over_time(" + content + ")"
        case .sum:
            return "sum_over_time(" + content + ")"
        case .count:
            return "count_over_time(" + content + ")"
        case .deviation:
            return "stddev_over_time(" + content + ")"
        case .variance:
            return "stdvar_over_time(" + content + ")"
        case let .quantile(value):
            return "quantile_over_time(" + value.description + "," + content + ")"
        }
    }

}

extension ScalarQuery.Aggregation {

    func stringValue(_ content: String, rule: ScalarQuery.AggregationRule?) -> String {
        let ruleString = rule.map { $0.stringValue } ?? ""
        switch self {
        case .average:
            return "avg(" + content + ")" + ruleString
        case .min:
            return "min(" + content + ")" + ruleString
        case .max:
            return "max(" + content + ")" + ruleString
        case .sum:
            return "sum(" + content + ")" + ruleString
        case .count:
            return "count(" + content + ")" + ruleString
        case .deviation:
            return "stddev(" + content + ")" + ruleString
        case .variance:
            return "stdvar(" + content + ")" + ruleString
        case let .bottom(count):
            return "bottomk(" + count.description + "," + content + ")" + ruleString
        case let .top(count):
            return "topk(" + count.description + "," + content + ")" + ruleString
        case let .quantile(value):
            return "quantile(" + value.description + "," + content + ")" + ruleString
        }
    }

}

extension ScalarQuery.AggregationRule {

    var stringValue: String {
        switch self {
        case let .including(keys):
            return " by (" + keys.joined(separator: ", ") + ")"
        case let .excluding(keys):
            return " without (" + keys.joined(separator: ", ") + ")"
        }
    }

}
