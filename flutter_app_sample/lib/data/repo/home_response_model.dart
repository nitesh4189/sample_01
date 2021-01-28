// To parse this JSON data, do
//
//     final homeResponse = homeResponseFromMap(jsonString);

import 'dart:convert';

List<HomeResponse> homeResponseFromMap(String str) => List<HomeResponse>.from(
    json.decode(str).map((x) => HomeResponse.fromMap(x)));

String homeResponseToMap(List<HomeResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class HomeResponse {
  HomeResponse({
    this.login,
    this.id,
    this.nodeId,
    this.url,
    this.reposUrl,
    this.eventsUrl,
    this.hooksUrl,
    this.issuesUrl,
    this.membersUrl,
    this.publicMembersUrl,
    this.avatarUrl,
    this.description,
  });

  String login;
  int id;
  String nodeId;
  String url;
  String reposUrl;
  String eventsUrl;
  String hooksUrl;
  String issuesUrl;
  String membersUrl;
  String publicMembersUrl;
  String avatarUrl;
  String description;

  factory HomeResponse.fromMap(Map<String, dynamic> json) => HomeResponse(
        login: json["login"] == null ? null : json["login"],
        id: json["id"] == null ? null : json["id"],
        nodeId: json["node_id"] == null ? null : json["node_id"],
        url: json["url"] == null ? null : json["url"],
        reposUrl: json["repos_url"] == null ? null : json["repos_url"],
        eventsUrl: json["events_url"] == null ? null : json["events_url"],
        hooksUrl: json["hooks_url"] == null ? null : json["hooks_url"],
        issuesUrl: json["issues_url"] == null ? null : json["issues_url"],
        membersUrl: json["members_url"] == null ? null : json["members_url"],
        publicMembersUrl: json["public_members_url"] == null
            ? null
            : json["public_members_url"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toMap() => {
        "login": login == null ? null : login,
        "id": id == null ? null : id,
        "node_id": nodeId == null ? null : nodeId,
        "url": url == null ? null : url,
        "repos_url": reposUrl == null ? null : reposUrl,
        "events_url": eventsUrl == null ? null : eventsUrl,
        "hooks_url": hooksUrl == null ? null : hooksUrl,
        "issues_url": issuesUrl == null ? null : issuesUrl,
        "members_url": membersUrl == null ? null : membersUrl,
        "public_members_url":
            publicMembersUrl == null ? null : publicMembersUrl,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "description": description == null ? null : description,
      };
}
