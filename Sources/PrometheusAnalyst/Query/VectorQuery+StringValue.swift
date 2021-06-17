
extension VectorQuery.Kind {

    var stringValue: String {
        switch self {
        case let .metric(model):
            return model.information.stringValue
        case let .offset(vector, offset):
            return vector.stringValue + " offset " + offset.stringValue
        case let .aggregation(aggregation, vector, step, total):
            return aggregation.stringValue(vector.stringValue, step: step, total: total)
        }
    }

}

extension VectorQuery.Aggregation {

    func stringValue(_ content: String, step: Interval, total: Interval) -> String {
        let content = content + "[" + total.stringValue + ":" + step.stringValue + "]"
        switch self {
        case .average:
            return "avg(" + content + ")"
        case .min:
            return "min(" + content + ")"
        case .max:
            return "max(" + content + ")"
        case .sum:
            return "sum(" + content + ")"
        case .count:
            return "count_over_time(" + content + ")"
        case let .quantile(value):
            return "quantile_over_time(" + value.description + "," + content + ")"
        case .deviation:
            return "stddev_over_time(" + content + ")"
        case .variance:
            return "stdvar_over_time(" + content + ")"
        }
    }

}
