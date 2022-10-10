#! /usr/bin/env zsh

alias browser_facebook='xdg-open https://facebook.com'
alias browser_messenger='xdg-open "https://www.facebook.com/messages/t/thuanpham2311"'
alias browser_gmail_user_0='xdg-open "https://mail.google.com/mail/u/0/#inbox"'
alias browser_gmail_user_1='xdg-open "https://mail.google.com/mail/u/1/#inbox"'
alias browser_youtube_subscriptions='xdg-open "https://www.youtube.com/feed/subscriptions"'
alias browser_feeder='xdg-open "https://feeder.co/reader"'
alias browser_discord='xdg-open "https://discord.com/channels/@me"'

function browserDaily() {
  browser_youtube_subscriptions
  browser_feeder
  browser_gmail_user_0
  browser_gmail_user_1
  browser_facebook
}
