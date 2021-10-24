#! /usr/bin/env zsh

alias browser='xdg-open'
alias browserNewTab='brave-browser --new-window'
alias github='brave-browser --new-window "https://github.com/thuanpham2311"'
alias browserFb='browser https://facebook.com'
alias browserMes='browser "https://www.facebook.com/messages/t/thuanpham2311"'
alias browserMail0='browser "https://mail.google.com/mail/u/0/#inbox"'
alias browserMail1='browser "https://mail.google.com/mail/u/1/#inbox"'
alias browserMail2='browser "https://mail.google.com/mail/u/2/#inbox"'
alias browserStu='browser "http://stu.edu.vn/"'
alias browserStu2='browser "http://stu.edu.vn/vi/393/thong-bao.html"'
alias browserYoutubeSubsriptions='browser "https://www.youtube.com/feed/subscriptions"'
alias browserFeedly='browser "https://feedly.com/i/collection/content/user/0d89157e-ce7d-4b2c-a2d6-98826f1e5089/category/global.all"'
alias browserGooglePodcastSubscriptions='browser "https://podcasts.google.com/subscriptions"'

sbt() { browserNewTab "https://translate.google.com/?source=osdd#auto|auto|$argv" }

sby() { browserNewTab "https://www.youtube.com/results?search_query=$argv" }

sbd() { browserNewTab "https://duckduckgo.com/?q=$argv" }

sbg() { browserNewTab "https://www.google.com/search?q=$argv" }

sbgm() { browserNewTab "https://www.google.com/maps?q=$argv" }

sbgi() { browserNewTab "https://www.google.com/search?tbm=isch&q=$argv"}

sbgh() { browserNewTab "https://github.com/search?q=$argv" }

function browserDaily () {
    cowsay "GET.SHIT.DONE"
    browserYoutubeSubsriptions
    browserGooglePodcastSubscriptions
    browserFeedly
    browserMail0
    browserMail1
    browserFb
    browserStu
    browserStu2
}
