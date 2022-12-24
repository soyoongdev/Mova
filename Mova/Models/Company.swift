import Foundation

/// Description
public struct Company: Codable, Equatable {
    /// Description
    public var id: Int
    /// Description
    public var logoPath: String?
    /// Description
    public var name: String?
    /// Description
    public var originCountry: String? // change to enum?
    /// Description
    public var parentCompany: String?
    /// Description
    public var homepage: String?
    /// Description
    public var headquarters: String?
    /// Description
    public var description: String?

    public init(id: Int,
                logoPath: String? = nil,
                name: String? = nil,
                originCountry: String? = nil,
                parentCompany: String? = nil,
                homepage: String? = nil,
                headquarters: String? = nil,
                description: String? = nil) {
        self.id = id
        self.logoPath = logoPath
        self.name = name
        self.originCountry = originCountry
        self.parentCompany = parentCompany
        self.homepage = homepage
        self.headquarters = headquarters
        self.description = description
    }

    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
        case parentCompany = "parent_company"
        case homepage
        case headquarters
        case description
    }
}
