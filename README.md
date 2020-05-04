# Botflix - Your Netflix Bot for series suggestion

> Are you tired of swiping around searching for the next series to watch during this quarantine? You don't have to read hundreds of summaries to try to guess if a series is good or not. Botflix gives you a suggestion based on reviews of hundreds of users of the AdoroCinema website, and only suggests those of high grades (4.3 or higher up to 5). It retrieves the 100 most recent ones, so they're all freshly baked, and picks one by random so you don't even have to tire your head deciding anything! You're in for a treat!

![screenshot](./app_screenshot.png)

Botflix is a scraper built with Ruby, more specifically with the gems 'nokogiri' and 'httparty', in order to retrieve data from the website AdoroCinema. This site is a reviews portal, a brazilian "Rotten Tomatoes" of sorts, that gathers critiques and reviews from professionals and public in general alike. 
I have built the algorith of Botflix in a way that it takes the 100 most recent series (by addressing their page of most recent series) that ALSO have 4.3 or more stars of evaluation. After gathering their information, it picks one of them randomly, and returns this series as a suggestion for the user. 
For usage, the user only have to reach the bot through Telegram in @botflixbot.

## Built With

- Ruby
- Gems: nokogiri, httparty, telegram-bot-ruby

## Live Demo

[Live Demo Link](https://livedemo.com)


## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites
You must have Ruby installed in your machine. To do that, follow this link: https://www.theodinproject.com/courses/web-development-101/lessons/installing-ruby

### Setup
You can download the [repository](https://github.com/phfdonda/Capstone_Ruby_Scraper_Bot) or clone (paste on the terminal) ```git clone git@github.com:phfdonda/Capstone_Ruby_Scraper_Bot.git```
You are going to have to install certain gems to be able to use this project. They are:

##### [telegram-bot-ruby](https://github.com/telegram-bot-rb/telegram-bot)
##### [nokogiri](https://nokogiri.org/tutorials/installing_nokogiri.html#install-with-included-libraries-recommended)
##### [httparty](https://github.com/jnunemaker/httparty)
To install all of those, you can use Bundler, by just running ```bundle install``` after writing "gem <name-of-the-gem>" for each of the gems in the Gemfile file. To learn more about how to do that, [follow this link](https://bundler.io/v2.0/man/bundle-install.1.html). 

### Usage
The executable is located in the bin folder, and is called main.rb. Open the terminal and cd to the path where you download the Capstone project. It should be something like: ```User/<folder>/Capstone_Ruby_Scraper_Bot/```. Go to the 'bin' folder, and run the 'main' file. It will start a server

### Run tests

### Deployment



## Authors

👤 **Author1**

- Github: [@githubhandle](https://github.com/githubhandle)
- Twitter: [@twitterhandle](https://twitter.com/twitterhandle)
- Linkedin: [linkedin](https://linkedin.com/linkedinhandle)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- A special thanks to my wonderful wife who has given me so much inspiration and incredible ideas!

## 📝 License

This project is [MIT](lic.url) licensed.
