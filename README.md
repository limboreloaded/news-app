## Crypto News App

Flutter mobile app that displays latest crypto news, prices,events and projects.

# Description

The app fetches data by using a refresh mechanism, that reloads data every 5 minutes if the data from the API endpoint is new.

The app saves the data in an internal SQL database.

The app queries and mutates the data using controllers made using riverpod, that translate database models to app models.

The app uses json_serializable and freezed for better conversion of keys (format data coming from the db).

## How to Run

0. Install Flutter
1. Clone repo
2. Inside the app root directory, type ```flutter pub get```
3. Run a desired simulator (iOS recommended)
4. Type ```flutter run```

## Gallery

# Home Page

![](https://raw.githubusercontent.com/limboreloaded/news-app/main/HomePage.png)

# Actions Page

![](https://raw.githubusercontent.com/limboreloaded/news-app/main/ActionsPage.png)

# Action View

![](https://raw.githubusercontent.com/limboreloaded/news-app/main/ActionView.png)

# Tweets Page

![](https://raw.githubusercontent.com/limboreloaded/news-app/main/TweetsPage.png)

# News Page

![](https://raw.githubusercontent.com/limboreloaded/news-app/main/NewsPage.png)

# News View

![](https://raw.githubusercontent.com/limboreloaded/news-app/main/NewsView.png)

# Projects Page

![](https://raw.githubusercontent.com/limboreloaded/news-app/main/ProjectsPage.png)

# Projects View

![](https://raw.githubusercontent.com/limboreloaded/news-app/main/ProjectsView.png)

# Settings Page

![](https://raw.githubusercontent.com/limboreloaded/news-app/main/SettingsPage.png)