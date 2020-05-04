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
To install all of those, you can use Bundler, by just running ```bundle install``` after defining the gems in the Gemfile file. To learn more about how to do that, [follow this link](https://bundler.io/v2.0/man/bundle-install.1.html). 

### Usage
The executable is located in the bin folder, and is called main.rb. Open the terminal and cd to the path where you download the Capstone project. It should be something like: ```User/<folder>/Capstone_Ruby_Scraper_Bot/```. Go to the 'bin' folder, and run the 'main' file. It will start a server. After that, if a user sends a message with '/start' to @botflixbot in Telegram, it will respond with a series of messages giving a suggestion. 
The messages are all in portuguese, because the users are supposed to be brazilians, but here are the messages translated to English - at least the standard parts, not the content retrieved from the website.
##### "Hey! Wait a minute, let me pause my series here, just a sec."
##### "Ok, just paused it. Wow, it's a series to nail you on the couch! Want a suggestion? Watch this one!"
##### "It's name is [title]"
##### "It was directed by [director] and has good actors like [cast]. But it's not just me talking!"
##### "It has a grade of [stars] in the AdoroCinema review's portal, ok?"
##### "Well, do you want a summary? Here it is:"
##### "[summary]"
##### "Worth a check! Watch the first episode, you might like it! Well, that's it! I'll go back to my series! See ya!"

The messages are filled with information that have been scraped from the portal, like title, director, cast, summary, evaluation, etc. That way the user can have a quick access to a good review of a series without having to look through so many options.

### Run tests
We have only one method for this project, the scraper method. It is supposed to retrieve a Hash containing the values scraped from the website, and the spec files test that.

### Deployment



## Authors

👤 **Pedro Henrique Ferreira Donda**



Github - [@phfhdonda](https://github.com/phfdonda)

LinkedIn - [PedroDonda](https://www.linkedin.com/in/pedro-donda-808621bb/)

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
