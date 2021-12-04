
// MARK: - Unary Operators

public protocol PrometheusRepresentableUnaryOperator: UnaryMetricQueryOperator {
    func prometheusRepresentation(_ content: String) -> String
}

extension UnaryOperatorMetricQuery where Self: PrometheusRepresentable, Query: PrometheusRepresentable, Operator: PrometheusRepresentableUnaryOperator {
    public var prometheusRepresentation: String {
        `operator`.prometheusRepresentation(query.prometheusRepresentation)
    }
}

// MARK: - Queries

extension RangeToRangeQuery: PrometheusRepresentable where Query: PrometheusRepresentable, Operator: PrometheusRepresentableUnaryOperator {}
extension RangeToScalarQuery: PrometheusRepresentable where Query: PrometheusRepresentable, Operator: PrometheusRepresentableUnaryOperator {}
extension RangeToVectorQuery: PrometheusRepresentable where Query: PrometheusRepresentable, Operator: PrometheusRepresentableUnaryOperator {}
extension ScalarToRangeQuery: PrometheusRepresentable where Query: PrometheusRepresentable, Operator: PrometheusRepresentableUnaryOperator {}
extension ScalarToScalarQuery: PrometheusRepresentable where Query: PrometheusRepresentable, Operator: PrometheusRepresentableUnaryOperator {}
extension ScalarToVectorQuery: PrometheusRepresentable where Query: PrometheusRepresentable, Operator: PrometheusRepresentableUnaryOperator {}
extension VectorToRangeQuery: PrometheusRepresentable where Query: PrometheusRepresentable, Operator: PrometheusRepresentableUnaryOperator {}
extension VectorToScalarQuery: PrometheusRepresentable where Query: PrometheusRepresentable, Operator: PrometheusRepresentableUnaryOperator {}
extension VectorToVectorQuery: PrometheusRepresentable where Query: PrometheusRepresentable, Operator: PrometheusRepresentableUnaryOperator {}

// MARK: - RangeToRange

extension OffsetRangeToRangeOperator: PrometheusRepresentableUnaryOperator where Interval: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "(" + content + ") offset " + interval.prometheusRepresentation
    }
}

// MARK: - RangeToScalar

// MARK: - RangeToVector

extension AverageOverTimeRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "avg_over_time(" + content + ")"
    }
}

extension ChangesRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "changes(" + content + ")"
    }
}

extension CountOverTimeRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "count_over_time(" + content + ")"
    }
}

extension DeltaRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "delta(" + content + ")"
    }
}

extension DerivativeRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "deriv(" + content + ")"
    }
}

extension IDeltaRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "idelta(" + content + ")"
    }
}

extension LastOverTimeRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "last_over_time(" + content + ")"
    }
}

extension MaximumOverTimeRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "max_over_time(" + content + ")"
    }
}

extension MinimumOverTimeRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "min_over_time(" + content + ")"
    }
}

extension PresentOverTimeRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "present_over_time(" + content + ")"
    }
}

extension QuantileOverTimeRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "quantile_over_time(" + value.description + "," + content + ")"
    }
}

extension RateRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "rate(" + content + ")"
    }
}

extension ResetsRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "resets(" + content + ")"
    }
}

extension StandardDeviationOverTimeRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "stddev_over_time(" + content + ")"
    }
}

extension StandardVarianceOverTimeRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "stdvar_over_time(" + content + ")"
    }
}

extension SumOverTimeRangeToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "sum_over_time(" + content + ")"
    }
}

// MARK: - ScalarToRange

// MARK: - ScalarToScalar

// MARK: - ScalarToVector

extension CastScalarToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "vector(" + content + ")"
    }
}

// MARK: - VectorToRange

extension IntervalVectorToRangeOperator: PrometheusRepresentableUnaryOperator where Interval: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        content + "[" + interval.prometheusRepresentation + "]"
    }
}

extension OpenSubqueryVectorToRangeOperator: PrometheusRepresentableUnaryOperator where Duration: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "(" + content + ")[" + duration.prometheusRepresentation + ":]"
    }
}

extension SubqueryVectorToRangeOperator: PrometheusRepresentableUnaryOperator where Duration: PrometheusRepresentable, Step: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "(" + content + ")[" + duration.prometheusRepresentation + ":" + step.prometheusRepresentation + "]"
    }
}

// MARK: - VectorToScalar

extension CastVectorToScalarOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "scalar(" + content + ")"
    }
}

// MARK: - VectorToVector

extension AbsoluteValueVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "abs(" + content + ")"
    }
}

extension AcosVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "acos(" + content + ")"
    }
}

extension AcoshVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "acosh(" + content + ")"
    }
}

extension AsinVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "asin(" + content + ")"
    }
}

extension AsinhVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "asinh(" + content + ")"
    }
}

extension AtanVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "atan(" + content + ")"
    }
}

extension AtanhVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "atanh(" + content + ")"
    }
}

extension AverageVectorToVectorOperator: PrometheusRepresentableUnaryOperator where Rule: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "avg(" + content + ")" + rule.prometheusRepresentation
    }
}

extension Base2LogarithmVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "log2(" + content + ")"
    }
}

extension Base10LogarithmVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "log10(" + content + ")"
    }
}

extension BottomVectorToVectorOperator: PrometheusRepresentableUnaryOperator where Rule: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "bottomk(" + value.description + "," + content + ")" + rule.prometheusRepresentation
    }
}

extension CeilingVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "ceil(" + content + ")"
    }
}

extension CosVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "cos(" + content + ")"
    }
}

extension CoshVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "cosh(" + content + ")"
    }
}

extension CountVectorToVectorOperator: PrometheusRepresentableUnaryOperator where Rule: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "count(" + content + ")" + rule.prometheusRepresentation
    }
}

extension CountValuesVectorToVectorOperator: PrometheusRepresentableUnaryOperator where Rule: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "count_values(" + content + ")" + rule.prometheusRepresentation
    }
}

extension DegreeVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "deg(" + content + ")"
    }
}

extension ExponentialVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "exp(" + content + ")"
    }
}

extension FloorVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "floor(" + content + ")"
    }
}

extension GroupVectorToVectorOperator: PrometheusRepresentableUnaryOperator where Rule: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "group(" + content + ")" + rule.prometheusRepresentation
    }
}

extension MaximumVectorToVectorOperator: PrometheusRepresentableUnaryOperator where Rule: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "max(" + content + ")" + rule.prometheusRepresentation
    }
}

extension MinimumVectorToVectorOperator: PrometheusRepresentableUnaryOperator where Rule: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "min(" + content + ")" + rule.prometheusRepresentation
    }
}

extension NaturalLogarithmVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "ln(" + content + ")"
    }
}

extension OffsetVectorToVectorOperator: PrometheusRepresentableUnaryOperator where Interval: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "(" + content + ") offset " + interval.prometheusRepresentation
    }
}

extension QuantileVectorToVectorOperator: PrometheusRepresentableUnaryOperator where Rule: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "quantile(" + value.description + "," + content + ")" + rule.prometheusRepresentation
    }
}

extension RadianVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "rad(" + content + ")"
    }
}

extension SignVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "sgn(" + content + ")"
    }
}

extension SinVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "sin(" + content + ")"
    }
}

extension SinhVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "sinh(" + content + ")"
    }
}

extension SortAscendingVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "sort(" + content + ")"
    }
}

extension SortDescendingVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "sort_desc(" + content + ")"
    }
}

extension SquareRootVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "sqrt(" + content + ")"
    }
}

extension StandardDeviationVectorToVectorOperator: PrometheusRepresentableUnaryOperator where Rule: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "stddev(" + content + ")" + rule.prometheusRepresentation
    }
}

extension StandardVarianceVectorToVectorOperator: PrometheusRepresentableUnaryOperator where Rule: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "stdvar(" + content + ")" + rule.prometheusRepresentation
    }
}

extension SumVectorToVectorOperator: PrometheusRepresentableUnaryOperator where Rule: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "sum(" + content + ")" + rule.prometheusRepresentation
    }
}

extension TanVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "tan(" + content + ")"
    }
}

extension TanhVectorToVectorOperator: PrometheusRepresentableUnaryOperator {
    public func prometheusRepresentation(_ content: String) -> String {
        "tanh(" + content + ")"
    }
}

extension TopVectorToVectorOperator: PrometheusRepresentableUnaryOperator where Rule: PrometheusRepresentable {
    public func prometheusRepresentation(_ content: String) -> String {
        "topk(" + value.description + "," + content + ")" + rule.prometheusRepresentation
    }
}
