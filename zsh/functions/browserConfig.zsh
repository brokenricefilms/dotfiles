#! /usr/bin/env zsh

alias browser='xdg-open'
alias defaultBrowser='firefox'
alias browserNewTab='defaultBrowser --new-window'
alias github='defaultBrowser --new-window "https://github.com/thuanpham2311"'
alias browserFb='browser https://facebook.com'
alias browserMes='browser "https://www.facebook.com/messages/t/thuanpham2311"'
alias browserMail0='browser "https://mail.google.com/mail/u/0/#inbox"'
alias browserMail1='browser "https://mail.google.com/mail/u/1/#inbox"'
alias browserMail2='browser "https://mail.google.com/mail/u/2/#inbox"'
alias browserStu='browser "http://stu.edu.vn/"'
alias browserStu2='browser "http://stu.edu.vn/vi/393/thong-bao.html"'
alias browserYoutubeSubsriptions='browser "https://www.youtube.com/feed/subscriptions"'
alias browserFeedly='browser "https://feedly.com/i/collection/content/user/0d89157e-ce7d-4b2c-a2d6-98826f1e5089/category/global.all"'
alias browserFeeder='browser "https://feeder.co/reader"'
alias browserGooglePodcastSubscriptions='browser "https://podcasts.google.com/subscriptions"'
alias browserGithubNotification='browser "https://github.com/notifications?query=is%3Aunread"'
alias browserDiscord='browser "https://discord.com/channels/@me"'
alias browserAnime='browser "http://animevietsub.tv/"'
alias browserKdrama='browser "https://subnhanh.net/"'
alias browserMovie='browser "https://ophim.net/"'

alias createPassword='defaultBrowser --app="https://duckduckgo.com/?q=28+strong+password&t=h_&ia=answer"'
alias pw='defaultBrowser --app="https://duckduckgo.com/?q=28+strong+password&t=h_&ia=answer"'
qr() { defaultBrowser --app="https://duckduckgo.com/?q=qr+$argv" }

translate() { browserNewTab "https://translate.google.com/?source=osdd#auto|auto|$argv" }

searchYoutube() { browserNewTab "https://www.youtube.com/results?search_query=$argv" }

searchDuckduckgo() { browserNewTab "https://duckduckgo.com/?q=$argv" }

searchGoogle() { browserNewTab "https://www.google.com/search?q=$argv" }

searchGoogleMap() { browserNewTab "https://www.google.com/maps?q=$argv" }

searchGoogleImage() { browserNewTab "https://www.google.com/search?tbm=isch&q=$argv"}

searchGithub() { browserNewTab "https://github.com/search?q=$argv" }

function browserDaily () {
  echo "👉 just check once times a day bro"
  browserYoutubeSubsriptions
  browserFeeder
  browserMail0
  browserMail1
  browserFb
  browserAnime
  browserDiscord
}

alias google-chrome-master="google-chrome --profile-directory=Default"
alias google-chrome-school="google-chrome --profile-directory=\"Profile 1\""
