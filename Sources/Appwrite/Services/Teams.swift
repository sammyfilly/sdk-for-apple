import AsyncHTTPClient
import Foundation
import NIO
import JSONCodable
import AppwriteModels

/// The Teams service allows you to group users of your project and to enable them to share read and write access to your project resources
open class Teams: Service {

    ///
    /// List Teams
    ///
    /// Get a list of all the teams in which the current user is a member. You can
    /// use the parameters to filter your results.
    ///
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func list<T>(
        queries: [String]? = nil,
        search: String? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.TeamList<T> {
        let api_path: String = "/teams"

        let params: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.TeamList<T> = { response in
            return AppwriteModels.TeamList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// List Teams
    ///
    /// Get a list of all the teams in which the current user is a member. You can
    /// use the parameters to filter your results.
    ///
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func list(
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.TeamList<[String: AnyCodable]> {
        return try await list(
            queries: queries,
            search: search,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Create Team
    ///
    /// Create a new team. The user who creates the team will automatically be
    /// assigned as the owner of the team. Only the users with the owner role can
    /// invite new members, add new owners and delete or update the team.
    ///
    /// @param String teamId
    /// @param String name
    /// @param [String] roles
    /// @throws Exception
    /// @return array
    ///
    open func create<T>(
        teamId: String,
        name: String,
        roles: [String]? = nil,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Team<T> {
        let api_path: String = "/teams"

        let params: [String: Any?] = [
            "teamId": teamId,
            "name": name,
            "roles": roles
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Team<T> = { response in
            return AppwriteModels.Team.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Team
    ///
    /// Create a new team. The user who creates the team will automatically be
    /// assigned as the owner of the team. Only the users with the owner role can
    /// invite new members, add new owners and delete or update the team.
    ///
    /// @param String teamId
    /// @param String name
    /// @param [String] roles
    /// @throws Exception
    /// @return array
    ///
    open func create(
        teamId: String,
        name: String,
        roles: [String]? = nil
    ) async throws -> AppwriteModels.Team<[String: AnyCodable]> {
        return try await create(
            teamId: teamId,
            name: name,
            roles: roles,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Get Team
    ///
    /// Get a team by its ID. All team members have read access for this resource.
    ///
    /// @param String teamId
    /// @throws Exception
    /// @return array
    ///
    open func get<T>(
        teamId: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Team<T> {
        let api_path: String = "/teams/{teamId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Team<T> = { response in
            return AppwriteModels.Team.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Team
    ///
    /// Get a team by its ID. All team members have read access for this resource.
    ///
    /// @param String teamId
    /// @throws Exception
    /// @return array
    ///
    open func get(
        teamId: String
    ) async throws -> AppwriteModels.Team<[String: AnyCodable]> {
        return try await get(
            teamId: teamId,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update Name
    ///
    /// Update the team's name by its unique ID.
    ///
    /// @param String teamId
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func updateName<T>(
        teamId: String,
        name: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Team<T> {
        let api_path: String = "/teams/{teamId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let params: [String: Any?] = [
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Team<T> = { response in
            return AppwriteModels.Team.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Name
    ///
    /// Update the team's name by its unique ID.
    ///
    /// @param String teamId
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func updateName(
        teamId: String,
        name: String
    ) async throws -> AppwriteModels.Team<[String: AnyCodable]> {
        return try await updateName(
            teamId: teamId,
            name: name,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Delete Team
    ///
    /// Delete a team using its ID. Only team members with the owner role can
    /// delete the team.
    ///
    /// @param String teamId
    /// @throws Exception
    /// @return array
    ///
    open func delete(
        teamId: String
    ) async throws -> Any {
        let api_path: String = "/teams/{teamId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: api_path,
            headers: headers,
            params: params        )
    }

    ///
    /// List Team Memberships
    ///
    /// Use this endpoint to list a team's members using the team's ID. All team
    /// members have read access to this endpoint.
    ///
    /// @param String teamId
    /// @param [String] queries
    /// @param String search
    /// @throws Exception
    /// @return array
    ///
    open func listMemberships(
        teamId: String,
        queries: [String]? = nil,
        search: String? = nil
    ) async throws -> AppwriteModels.MembershipList {
        let api_path: String = "/teams/{teamId}/memberships"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let params: [String: Any?] = [
            "queries": queries,
            "search": search
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.MembershipList = { response in
            return AppwriteModels.MembershipList.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Create Team Membership
    ///
    /// Invite a new member to join your team. Provide an ID for existing users, or
    /// invite unregistered users using an email or phone number. If initiated from
    /// a Client SDK, Appwrite will send an email or sms with a link to join the
    /// team to the invited user, and an account will be created for them if one
    /// doesn't exist. If initiated from a Server SDK, the new member will be added
    /// automatically to the team.
    /// 
    /// You only need to provide one of a user ID, email, or phone number. Appwrite
    /// will prioritize accepting the user ID > email > phone number if you provide
    /// more than one of these parameters.
    /// 
    /// Use the `url` parameter to redirect the user from the invitation email to
    /// your app. After the user is redirected, use the [Update Team Membership
    /// Status](/docs/client/teams#teamsUpdateMembershipStatus) endpoint to allow
    /// the user to accept the invitation to the team. 
    /// 
    /// Please note that to avoid a [Redirect
    /// Attack](https://github.com/OWASP/CheatSheetSeries/blob/master/cheatsheets/Unvalidated_Redirects_and_Forwards_Cheat_Sheet.md)
    /// Appwrite will accept the only redirect URLs under the domains you have
    /// added as a platform on the Appwrite Console.
    /// 
    ///
    /// @param String teamId
    /// @param [String] roles
    /// @param String url
    /// @param String email
    /// @param String userId
    /// @param String phone
    /// @param String name
    /// @throws Exception
    /// @return array
    ///
    open func createMembership(
        teamId: String,
        roles: [String],
        url: String,
        email: String? = nil,
        userId: String? = nil,
        phone: String? = nil,
        name: String? = nil
    ) async throws -> AppwriteModels.Membership {
        let api_path: String = "/teams/{teamId}/memberships"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let params: [String: Any?] = [
            "email": email,
            "userId": userId,
            "phone": phone,
            "roles": roles,
            "url": url,
            "name": name
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "POST",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Team Membership
    ///
    /// Get a team member by the membership unique id. All team members have read
    /// access for this resource.
    ///
    /// @param String teamId
    /// @param String membershipId
    /// @throws Exception
    /// @return array
    ///
    open func getMembership(
        teamId: String,
        membershipId: String
    ) async throws -> AppwriteModels.Membership {
        let api_path: String = "/teams/{teamId}/memberships/{membershipId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Membership
    ///
    /// Modify the roles of a team member. Only team members with the owner role
    /// have access to this endpoint. Learn more about [roles and
    /// permissions](/docs/permissions).
    /// 
    ///
    /// @param String teamId
    /// @param String membershipId
    /// @param [String] roles
    /// @throws Exception
    /// @return array
    ///
    open func updateMembership(
        teamId: String,
        membershipId: String,
        roles: [String]
    ) async throws -> AppwriteModels.Membership {
        let api_path: String = "/teams/{teamId}/memberships/{membershipId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

        let params: [String: Any?] = [
            "roles": roles
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Delete Team Membership
    ///
    /// This endpoint allows a user to leave a team or for a team owner to delete
    /// the membership of any other team member. You can also use this endpoint to
    /// delete a user membership even if it is not accepted.
    ///
    /// @param String teamId
    /// @param String membershipId
    /// @throws Exception
    /// @return array
    ///
    open func deleteMembership(
        teamId: String,
        membershipId: String
    ) async throws -> Any {
        let api_path: String = "/teams/{teamId}/memberships/{membershipId}"
            .replacingOccurrences(of: "{teamId}", with: teamId)
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        return try await client.call(
            method: "DELETE",
            path: api_path,
            headers: headers,
            params: params        )
    }

    ///
    /// Update Team Membership Status
    ///
    /// Use this endpoint to allow a user to accept an invitation to join a team
    /// after being redirected back to your app from the invitation email received
    /// by the user.
    /// 
    /// If the request is successful, a session for the user is automatically
    /// created.
    /// 
    ///
    /// @param String teamId
    /// @param String membershipId
    /// @param String userId
    /// @param String secret
    /// @throws Exception
    /// @return array
    ///
    open func updateMembershipStatus(
        teamId: String,
        membershipId: String,
        userId: String,
        secret: String
    ) async throws -> AppwriteModels.Membership {
        let api_path: String = "/teams/{teamId}/memberships/{membershipId}/status"
            .replacingOccurrences(of: "{teamId}", with: teamId)
            .replacingOccurrences(of: "{membershipId}", with: membershipId)

        let params: [String: Any?] = [
            "userId": userId,
            "secret": secret
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Membership = { response in
            return AppwriteModels.Membership.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PATCH",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Team Preferences
    ///
    /// Get the team's shared preferences by its unique ID. If a preference doesn't
    /// need to be shared by all team members, prefer storing them in [user
    /// preferences](/docs/client/account#accountGetPrefs).
    ///
    /// @param String teamId
    /// @throws Exception
    /// @return array
    ///
    open func getPrefs<T>(
        teamId: String,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Preferences<T> {
        let api_path: String = "/teams/{teamId}/prefs"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let params: [String: Any] = [:]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Preferences<T> = { response in
            return AppwriteModels.Preferences.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "GET",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Get Team Preferences
    ///
    /// Get the team's shared preferences by its unique ID. If a preference doesn't
    /// need to be shared by all team members, prefer storing them in [user
    /// preferences](/docs/client/account#accountGetPrefs).
    ///
    /// @param String teamId
    /// @throws Exception
    /// @return array
    ///
    open func getPrefs(
        teamId: String
    ) async throws -> AppwriteModels.Preferences<[String: AnyCodable]> {
        return try await getPrefs(
            teamId: teamId,
            nestedType: [String: AnyCodable].self
        )
    }

    ///
    /// Update Preferences
    ///
    /// Update the team's preferences by its unique ID. The object you pass is
    /// stored as is and replaces any previous value. The maximum allowed prefs
    /// size is 64kB and throws an error if exceeded.
    ///
    /// @param String teamId
    /// @param Any prefs
    /// @throws Exception
    /// @return array
    ///
    open func updatePrefs<T>(
        teamId: String,
        prefs: Any,
        nestedType: T.Type
    ) async throws -> AppwriteModels.Preferences<T> {
        let api_path: String = "/teams/{teamId}/prefs"
            .replacingOccurrences(of: "{teamId}", with: teamId)

        let params: [String: Any?] = [
            "prefs": prefs
        ]

        let headers: [String: String] = [
            "content-type": "application/json"
        ]

        let converter: (Any) -> AppwriteModels.Preferences<T> = { response in
            return AppwriteModels.Preferences.from(map: response as! [String: Any])
        }

        return try await client.call(
            method: "PUT",
            path: api_path,
            headers: headers,
            params: params,
            converter: converter
        )
    }

    ///
    /// Update Preferences
    ///
    /// Update the team's preferences by its unique ID. The object you pass is
    /// stored as is and replaces any previous value. The maximum allowed prefs
    /// size is 64kB and throws an error if exceeded.
    ///
    /// @param String teamId
    /// @param Any prefs
    /// @throws Exception
    /// @return array
    ///
    open func updatePrefs(
        teamId: String,
        prefs: Any
    ) async throws -> AppwriteModels.Preferences<[String: AnyCodable]> {
        return try await updatePrefs(
            teamId: teamId,
            prefs: prefs,
            nestedType: [String: AnyCodable].self
        )
    }


}