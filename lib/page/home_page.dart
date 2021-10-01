import 'dart:async';

import 'package:fingerprint_auth_example/api/github_api.dart';
import 'package:fingerprint_auth_example/main.dart';
import 'package:fingerprint_auth_example/model/repositories.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const pageSize = 15;
  final PagingController<int, Repo> _pagingController =
      PagingController<int, Repo>(
    firstPageKey: 0,
  );
  bool _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      _pagingController.addPageRequestListener((pageKey) async {
        await repoList(pageKey).timeout(Duration(seconds: 2),
            onTimeout: () {
          throw TimeoutException(
            "server failed to load the items",
            Duration(seconds: 10),
          );
        });
        await Future.delayed(Duration(seconds: 1), () {});
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  //**repoList
  Future<void> repoList(int firstPageKey) async {
    try {
      //touch
      final repoList =
          await Provider.of<GithubAPI>(context, listen: false).getRepos(
        firstPageKey,
        pageSize,
      );

      //get the last key
      int lastKey = firstPageKey+1;

      //check if it is last page
      final isLastPage = repoList.length < pageSize;

      //check for last page
      if (isLastPage) {
        _pagingController.appendLastPage(repoList);
      } else {
        _pagingController.appendPage(repoList, lastKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            _pagingController.refresh();
          },
          child: PagedListView.separated(
            physics: ClampingScrollPhysics(),
            // shrinkWrap: true,
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Repo>(
              itemBuilder: (context, repo, index) => RepoWidget(
                repo: repo,
              ),
              firstPageErrorIndicatorBuilder: (context) => Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.center,
                child: TextButton.icon(
                  icon: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                  onPressed: () => _pagingController.refresh(),
                  label: Text(
                    "retry",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText2.copyWith(
                          fontSize: 22.0,
                        ),
                  ),
                ),
              ),
              firstPageProgressIndicatorBuilder: (context) => Center(
                child: const CircularProgressIndicator(),
              ),
              noItemsFoundIndicatorBuilder: (context) => Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                child: Text(
                  "there are no repo available",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: 22.0,
                      ),
                ),
              ),
              noMoreItemsIndicatorBuilder: (context) => Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "nothing to load",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              newPageProgressIndicatorBuilder: (context) => Center(
                child: const CircularProgressIndicator(),
              ),
              newPageErrorIndicatorBuilder: (context) => GestureDetector(
                onTap: () {
                  _pagingController.refresh();
                },
                child: Container(
                  padding: EdgeInsets.all(14.0),
                  width: double.infinity,
                  // height: 50.0,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //message
                      Text(
                        "something went wrong",
                        style: Theme.of(context).textTheme.bodyText2,
                      ),

                      //icon
                      Icon(
                        Icons.refresh,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            separatorBuilder: (context, i) => Container(
              width: double.infinity,
              height: 20.0,
            ),
          ),
        ),
      );
}

class RepoWidget extends StatelessWidget {
  final Repo repo;

  const RepoWidget({@required this.repo, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // dense: true,
      // leading: Container(
      //   constraints: BoxConstraints.tight(Size.square(50)),
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.circular(50 / 2),
      //     image: DecorationImage(
      //       fit: BoxFit.cover,
      //       image: NetworkImage("${repo.owner.avatarUrl}"),
      //     ),
      //   ),
      // ),
      isThreeLine: true,
      title: RichText(
        text: TextSpan(
          children: [
            //repo name
            TextSpan(
              text: "${repo.repoName}.",
              style: Theme.of(context).textTheme.headline6.copyWith(
                    color: Colors.blue,
                  ),
            ),
            TextSpan(
              text: repo.private ? "private" : "public",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.grey.shade500,
                    fontSize: 14.0,
                  ),
            ),
          ],
        ),
      ),
      subtitle: Text("${repo.repoDescription}"),
      trailing: Column(
        children: [
          //language
          Text("${repo.language}"),
          //branch
          Text("${repo.branch}"),
        ],
      ),
    );
  }
}
