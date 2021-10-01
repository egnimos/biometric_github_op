import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class Repo {
  final int id;
  final Owner owner;
  final String repoName;
  final String repoFullName;
  final bool private;
  final String repoDescription;
  final String language;
  final String createdAt;
  final String branch;

  Repo({
    @required this.id,
    @required this.owner,
    @required this.repoName,
    @required this.repoFullName,
    @required this.private,
    @required this.repoDescription,
    @required this.language,
    @required this.createdAt,
    @required this.branch,
  });

  factory Repo.fromJson(Map<String, dynamic> data) => Repo(
        id: data["id"],
        owner: Owner.fromJson(data["owner"]),
        repoName: data["name"],
        repoFullName: data["full_name"],
        private: data["private"],
        repoDescription: data["description"],
        language: data["language"],
        createdAt: data["created_at"],
        branch: data["default_branch"],
      );
}

class Owner {
  final int id;
  final String avatarUrl;
  final String loginName;

  Owner({
    @required this.id,
    @required this.avatarUrl,
    @required this.loginName,
  });

  factory Owner.fromJson(Map<String, dynamic> data) => Owner(
        id: data["id"],
        avatarUrl: data["avatar_url"],
        loginName: data["login"],
      );
}


  // {
  //   "id": 3070104,
  //   "node_id": "MDEwOlJlcG9zaXRvcnkzMDcwMTA0",
  //   "name": "abs.io",
  //   "full_name": "JakeWharton/abs.io",
  //   "private": false,
  //   "owner": {
  //     "login": "JakeWharton",
  //     "id": 66577,
  //     "node_id": "MDQ6VXNlcjY2NTc3",
  //     "avatar_url": "https://avatars.githubusercontent.com/u/66577?v=4",
  //     "gravatar_id": "",
  //     "url": "https://api.github.com/users/JakeWharton",
  //     "html_url": "https://github.com/JakeWharton",
  //     "followers_url": "https://api.github.com/users/JakeWharton/followers",
  //     "following_url": "https://api.github.com/users/JakeWharton/following{/other_user}",
  //     "gists_url": "https://api.github.com/users/JakeWharton/gists{/gist_id}",
  //     "starred_url": "https://api.github.com/users/JakeWharton/starred{/owner}{/repo}",
  //     "subscriptions_url": "https://api.github.com/users/JakeWharton/subscriptions",
  //     "organizations_url": "https://api.github.com/users/JakeWharton/orgs",
  //     "repos_url": "https://api.github.com/users/JakeWharton/repos",
  //     "events_url": "https://api.github.com/users/JakeWharton/events{/privacy}",
  //     "received_events_url": "https://api.github.com/users/JakeWharton/received_events",
  //     "type": "User",
  //     "site_admin": false
  //   },
  //   "html_url": "https://github.com/JakeWharton/abs.io",
  //   "description": "Simple URL shortener for ActionBarSherlock using node.js and express.",
  //   "fork": false,
  //   "url": "https://api.github.com/repos/JakeWharton/abs.io",
  //   "forks_url": "https://api.github.com/repos/JakeWharton/abs.io/forks",
  //   "keys_url": "https://api.github.com/repos/JakeWharton/abs.io/keys{/key_id}",
  //   "collaborators_url": "https://api.github.com/repos/JakeWharton/abs.io/collaborators{/collaborator}",
  //   "teams_url": "https://api.github.com/repos/JakeWharton/abs.io/teams",
  //   "hooks_url": "https://api.github.com/repos/JakeWharton/abs.io/hooks",
  //   "issue_events_url": "https://api.github.com/repos/JakeWharton/abs.io/issues/events{/number}",
  //   "events_url": "https://api.github.com/repos/JakeWharton/abs.io/events",
  //   "assignees_url": "https://api.github.com/repos/JakeWharton/abs.io/assignees{/user}",
  //   "branches_url": "https://api.github.com/repos/JakeWharton/abs.io/branches{/branch}",
  //   "tags_url": "https://api.github.com/repos/JakeWharton/abs.io/tags",
  //   "blobs_url": "https://api.github.com/repos/JakeWharton/abs.io/git/blobs{/sha}",
  //   "git_tags_url": "https://api.github.com/repos/JakeWharton/abs.io/git/tags{/sha}",
  //   "git_refs_url": "https://api.github.com/repos/JakeWharton/abs.io/git/refs{/sha}",
  //   "trees_url": "https://api.github.com/repos/JakeWharton/abs.io/git/trees{/sha}",
  //   "statuses_url": "https://api.github.com/repos/JakeWharton/abs.io/statuses/{sha}",
  //   "languages_url": "https://api.github.com/repos/JakeWharton/abs.io/languages",
  //   "stargazers_url": "https://api.github.com/repos/JakeWharton/abs.io/stargazers",
  //   "contributors_url": "https://api.github.com/repos/JakeWharton/abs.io/contributors",
  //   "subscribers_url": "https://api.github.com/repos/JakeWharton/abs.io/subscribers",
  //   "subscription_url": "https://api.github.com/repos/JakeWharton/abs.io/subscription",
  //   "commits_url": "https://api.github.com/repos/JakeWharton/abs.io/commits{/sha}",
  //   "git_commits_url": "https://api.github.com/repos/JakeWharton/abs.io/git/commits{/sha}",
  //   "comments_url": "https://api.github.com/repos/JakeWharton/abs.io/comments{/number}",
  //   "issue_comment_url": "https://api.github.com/repos/JakeWharton/abs.io/issues/comments{/number}",
  //   "contents_url": "https://api.github.com/repos/JakeWharton/abs.io/contents/{+path}",
  //   "compare_url": "https://api.github.com/repos/JakeWharton/abs.io/compare/{base}...{head}",
  //   "merges_url": "https://api.github.com/repos/JakeWharton/abs.io/merges",
  //   "archive_url": "https://api.github.com/repos/JakeWharton/abs.io/{archive_format}{/ref}",
  //   "downloads_url": "https://api.github.com/repos/JakeWharton/abs.io/downloads",
  //   "issues_url": "https://api.github.com/repos/JakeWharton/abs.io/issues{/number}",
  //   "pulls_url": "https://api.github.com/repos/JakeWharton/abs.io/pulls{/number}",
  //   "milestones_url": "https://api.github.com/repos/JakeWharton/abs.io/milestones{/number}",
  //   "notifications_url": "https://api.github.com/repos/JakeWharton/abs.io/notifications{?since,all,participating}",
  //   "labels_url": "https://api.github.com/repos/JakeWharton/abs.io/labels{/name}",
  //   "releases_url": "https://api.github.com/repos/JakeWharton/abs.io/releases{/id}",
  //   "deployments_url": "https://api.github.com/repos/JakeWharton/abs.io/deployments",
  //   "created_at": "2011-12-29T18:02:34Z",
  //   "updated_at": "2021-05-28T07:14:19Z",
  //   "pushed_at": "2011-12-29T18:02:44Z",
  //   "git_url": "git://github.com/JakeWharton/abs.io.git",
  //   "ssh_url": "git@github.com:JakeWharton/abs.io.git",
  //   "clone_url": "https://github.com/JakeWharton/abs.io.git",
  //   "svn_url": "https://github.com/JakeWharton/abs.io",
  //   "homepage": "http://abs.io",
  //   "size": 108,
  //   "stargazers_count": 9,
  //   "watchers_count": 9,
  //   "language": "JavaScript",
  //   "has_issues": true,
  //   "has_projects": true,
  //   "has_downloads": true,
  //   "has_wiki": false,
  //   "has_pages": false,
  //   "forks_count": 1,
  //   "mirror_url": null,
  //   "archived": true,
  //   "disabled": false,
  //   "open_issues_count": 0,
  //   "license": null,
  //   "allow_forking": true,
  //   "forks": 1,
  //   "open_issues": 0,
  //   "watchers": 9,
  //   "default_branch": "master"
  // },