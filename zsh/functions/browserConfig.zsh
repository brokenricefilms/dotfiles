#! /usr/bin/env zsh

alias browserFb='xdg-open https://facebook.com'
alias browserMes='xdg-open "https://www.facebook.com/messages/t/thuanpham2311"'
alias browserMail0='xdg-open "https://mail.google.com/mail/u/0/#inbox"'
alias browserMail1='xdg-open "https://mail.google.com/mail/u/1/#inbox"'
alias browserYoutubeSubsriptions='xdg-open "https://www.youtube.com/feed/subscriptions"'
alias browserFeeder='xdg-open "https://feeder.co/reader"'
alias browserDiscord='xdg-open "https://discord.com/channels/@me"'

function browserDaily() {
  browserYoutubeSubsriptions
  browserFeeder
  browserMail0
  browserMail1
  browserFb
}
