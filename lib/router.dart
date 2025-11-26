import 'package:capstone/screen/archive_screen.dart';
import 'package:capstone/screen/plan/plan_search_screen.dart';
import 'package:capstone/screen/plan_screen.dart';
import 'package:capstone/screen/setting_screen.dart';
import 'package:capstone/screen/social/social_challenge_screen.dart';
import 'package:capstone/screen/social/social_search_screen.dart';
import 'package:capstone/screen/social_screen.dart';
import 'package:capstone/screen/todo_screen.dart';
import 'package:capstone/search/archive_search.dart';
import 'package:capstone/search/todo_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:capstone/capstone_bottom_navigation_bar.dart';

final GlobalKey<NavigatorState> _todoNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _planNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _archiveNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _socialNavigatorKey =
    GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _settingNavigatorKey =
    GlobalKey<NavigatorState>();

final _router = GoRouter(
  initialLocation: '/todo',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return CapstoneBottomNavigationBar(
          index: navigationShell.currentIndex,
          navigationShell: navigationShell,
          onDestinationSelected: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _todoNavigatorKey,
          routes: [
            GoRoute(
              path: '/todo',
              builder: (context, state) => TodoScreen(searchPath: '/search'),
              routes: [
                GoRoute(
                  path: 'search',
                  builder: (context, state) => TodoSearch(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _planNavigatorKey,
          routes: [
            GoRoute(
              path: '/plan',
              builder: (context, state) => PlanScreen(searchPath: '/search'),
              routes: [
                GoRoute(
                  path: 'search',
                  builder: (context, state) => PlanSearchScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _archiveNavigatorKey,
          routes: [
            GoRoute(
              path: '/archive',
              builder: (context, state) => ArchiveScreen(
                searchPath: '/search',
              ),
              routes: [
                GoRoute(path: 'search', builder: (context, state) => ArchiveSearch(),)
              ]
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _socialNavigatorKey,
          routes: [
            GoRoute(
              path: '/social',
              builder: (context, state) => SocialScreen(
                searchPath: '/search',
                challengePath: '/challenge',
              ),
              routes: [
                GoRoute(
                  path: 'search',
                  builder: (context, state) => SocialSearchScreen(),
                ),
                GoRoute(
                  path: 'challenge',
                  builder: (context, state) => SocialChallengeScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _settingNavigatorKey,
          routes: [
            GoRoute(
              path: '/setting',
              builder: (context, state) => SettingScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

GoRouter get router => _router;