
// MARK: - Binary Operators

public protocol PrometheusRepresentableBinaryOperator: BinaryMetricQueryOperator {
    func prometheusRepresentation(_ left: String, _ right: String) -> String
}

extension BinaryOperatorMetricQuery where Self: PrometheusRepresentable, Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {
    public var prometheusRepresentation: String {
        `operator`.prometheusRepresentation(left.prometheusRepresentation, right.prometheusRepresentation)
    }
}

// MARK: - Queries

extension RangeRangeToRangeQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension RangeRangeToScalarQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension RangeRangeToVectorQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension RangeScalarToRangeQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension RangeScalarToScalarQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension RangeScalarToVectorQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension RangeVectorToRangeQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension RangeVectorToScalarQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension RangeVectorToVectorQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension ScalarRangeToRangeQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension ScalarRangeToScalarQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension ScalarRangeToVectorQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension ScalarScalarToRangeQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension ScalarScalarToScalarQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension ScalarScalarToVectorQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension ScalarVectorToRangeQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension ScalarVectorToScalarQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension ScalarVectorToVectorQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension VectorRangeToRangeQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension VectorRangeToScalarQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension VectorRangeToVectorQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension VectorScalarToRangeQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension VectorScalarToScalarQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension VectorScalarToVectorQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension VectorVectorToRangeQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension VectorVectorToScalarQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}
extension VectorVectorToVectorQuery: PrometheusRepresentable where Left: PrometheusRepresentable, Operator: PrometheusRepresentableBinaryOperator, Right: PrometheusRepresentable {}

// MARK: - RangeRangeToRange

// MARK: - RangeRangeToScalar

// MARK: - RangeRangeToVector

// MARK: - RangeScalarToRange

// MARK: - RangeScalarToScalar

// MARK: - RangeScalarToVector

// MARK: - RangeVectorToRange

// MARK: - RangeVectorToScalar

// MARK: - RangeVectorToVector

// MARK: - ScalarRangeToRange

// MARK: - ScalarRangeToScalar

// MARK: - ScalarRangeToVector

// MARK: - ScalarScalarToRange

// MARK: - ScalarScalarToScalar

extension AdditionScalarScalarToScalarOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")+(" + right + ")"
    }
}

extension DivisionScalarScalarToScalarOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")/(" + right + ")"
    }
}

extension ExponentiationScalarScalarToScalarOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")^(" + right + ")"
    }
}

extension EqualScalarScalarToScalarOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")=(" + right + ")"
    }
}

extension GreaterScalarScalarToScalarOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")>(" + right + ")"
    }
}

extension GreaterOrEqualScalarScalarToScalarOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")>=(" + right + ")"
    }
}

extension LessScalarScalarToScalarOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")<(" + right + ")"
    }
}

extension LessOrEqualScalarScalarToScalarOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")<=(" + right + ")"
    }
}

extension ModuloScalarScalarToScalarOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")%(" + right + ")"
    }
}

extension MultiplicationScalarScalarToScalarOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")*(" + right + ")"
    }
}

extension NotEqualScalarScalarToScalarOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")!=(" + right + ")"
    }
}

extension SubtractionScalarScalarToScalarOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")-(" + right + ")"
    }
}

// MARK: - ScalarScalarToVector

// MARK: - ScalarVectorToRange

// MARK: - ScalarVectorToScalar

// MARK: - ScalarVectorToVector

extension AdditionScalarVectorToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")+(" + right + ")"
    }
}

extension DivisionScalarVectorToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")/(" + right + ")"
    }
}

extension EqualScalarVectorToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")=(" + right + ")"
    }
}

extension ExponentiationScalarVectorToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")^(" + right + ")"
    }
}

extension GreaterScalarVectorToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")>(" + right + ")"
    }
}

extension GreaterOrEqualScalarVectorToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")>=(" + right + ")"
    }
}

extension LessScalarVectorToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")<(" + right + ")"
    }
}

extension LessOrEqualScalarVectorToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")<=(" + right + ")"
    }
}

extension ModuloScalarVectorToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")%(" + right + ")"
    }
}

extension MultiplicationScalarVectorToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")*(" + right + ")"
    }
}

extension NotEqualScalarVectorToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")!=(" + right + ")"
    }
}

extension SubtractionScalarVectorToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")-(" + right + ")"
    }
}

// MARK: - VectorRangeToRange

// MARK: - VectorRangeToScalar

// MARK: - VectorRangeToVector

// MARK: - VectorScalarToRange

// MARK: - VectorScalarToScalar

// MARK: - VectorScalarToVector

extension AdditionVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")+(" + right + ")"
    }
}

extension MinimumClampingVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "clamp_min(" + left + "," + right + ")"
    }
}

extension MaximumClampingVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "clamp_max(" + left + "," + right + ")"
    }
}

extension DivisionVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")/(" + right + ")"
    }
}

extension EqualVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")=(" + right + ")"
    }
}

extension ExponentiationVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")^(" + right + ")"
    }
}

extension GreaterVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")>(" + right + ")"
    }
}

extension GreaterOrEqualVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")>=(" + right + ")"
    }
}

extension LessVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")<(" + right + ")"
    }
}

extension LessOrEqualVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")+(" + right + ")"
    }
}

extension ModuloVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")%(" + right + ")"
    }
}

extension MultiplicationVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")*(" + right + ")"
    }
}

extension NotEqualVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")!=(" + right + ")"
    }
}

extension RoundingVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "round(" + left + "," + right + ")"
    }
}

extension SubtractionVectorScalarToVectorOperator: PrometheusRepresentableBinaryOperator {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")-(" + right + ")"
    }
}

// MARK: - VectorVectorToRange

// MARK: - VectorVectorToScalar

// MARK: - VectorVectorToVector

extension AdditionVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")+" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}

extension ComplementVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")unless" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}

extension DivisionVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")/" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}

extension EqualVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")=" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}

extension ExponentiationVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")^" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}

extension GreaterVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")>" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}

extension GreaterOrEqualVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")>=" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}

extension IntersectionVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")and" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}

extension LessVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")<" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}

extension LessOrEqualVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")<=" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}

extension ModuloVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")%" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}

extension MultiplicationVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")*" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}

extension NotEqualVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")!=" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}

extension SubtractionVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")-" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}

extension UnionVectorVectorToVectorOperator: PrometheusRepresentableBinaryOperator where Rule: PrometheusRepresentable, Grouping: PrometheusRepresentable {
    public func prometheusRepresentation(_ left: String, _ right: String) -> String {
        "(" + left + ")or" + rule.prometheusRepresentation + grouping.prometheusRepresentation + "(" + right + ")"
    }
}
