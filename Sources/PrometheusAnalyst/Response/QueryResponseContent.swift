
struct PrometheusQueryResponseContent: Decodable {

    enum CodingKeys: String, CodingKey {
        case resultType
        case result
    }

    let resultType: String
    let range: [PrometheusRange]?
    let vector: [PrometheusVector]?
    let scalar: PrometheusScalar?
    let string: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        resultType = try container.decode(String.self, forKey: .resultType)

        switch resultType {
        case "matrix":
            range = try container.decode([PrometheusRange].self, forKey: .result)
            vector = nil
            scalar = nil
            string = nil
        case "vector":
            range = nil
            vector = try container.decode([PrometheusVector].self, forKey: .result)
            scalar = nil
            string = nil
        case "scalar":
            range = nil
            vector = nil
            scalar = try container.decode(PrometheusScalar.self, forKey: .result)
            string = nil
        case "string":
            range = nil
            vector = nil
            scalar = nil
            string = try container.decode(String.self, forKey: .result)
        default:
            range = nil
            vector = nil
            scalar = nil
            string = nil
        }
    }

}
