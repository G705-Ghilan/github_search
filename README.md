# github_search

a simple flutter app to search in github for repositories, users

## app file structure
lib folder:
```
lib:
│   injection.dart
│   main.dart
│
└───src
    ├───features
    │   ├───repositories_search
    │   │   │   repositoreis_search.dart
    │   │   │
    │   │   ├───bloc
    │   │   │       repositories_search_bloc.dart
    │   │   │       repositories_search_event.dart
    │   │   │       repositories_search_state.dart
    │   │   │
    │   │   └───widgets
    │   │           repository_dialog.dart
    │   │           search_resutl_item_widget.dart
    │   │           search_resutl_list.dart
    │   │
    │   ├───users_search
    │   │   │   users_search.dart
    │   │   │
    │   │   ├───bloc
    │   │   │       users_search_bloc.dart
    │   │   │       users_search_event.dart
    │   │   │       users_search_state.dart
    │   │   │
    │   │   └───widgets
    │   │           github_user_item.dart
    │   │           users_listview.dart
    │   │
    │   └───welcome
    │       │   welcome.dart
    │       │
    │       ├───data
    │       │   │   data.dart
    │       │   │
    │       │   └───models
    │       │           page_content.dart
    │       │
    │       └───widgets
    │               page_view_item.dart
    │
    └───shared
        │   routes.dart
        │
        ├───extensions
        │       context.dart
        │
        └───widgets
                app_drawer.dart
                custom_button.dart
                error_view.dart
                github_search_field.dart
```
packages folder:
```
packages
└───github_api
    │   pubspec.lock
    │   pubspec.yaml
    │
    ├───.dart_tool
    │       package_config.json
    │       package_config_subset
    │       version
    │
    └───lib
        │   github_api.dart
        │
        ├───bloc
        │       github_api_bloc.dart
        │       github_api_event.dart
        │       github_api_state.dart
        │
        ├───models
        │       github_user.dart
        │       repository_search_result.dart
        │       search_result_error.dart
        │       search_result_item.dart
        │       users_search_result.dart
        │
        └───repository
                github_cache.dart
                github_client.dart
                github_repository.dart
```
