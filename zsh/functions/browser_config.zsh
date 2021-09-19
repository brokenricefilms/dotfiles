#! /usr/bin/env zsh

alias browser='xdg-open'
alias browser_new_tab='brave-browser --new-window'
alias github='brave-browser --new-window "https://github.com/thuanpham2311"'
alias browser_fb='browser https://facebook.com'
alias browser_mes='browser "https://www.facebook.com/messages/t/thuanpham2311"'
alias browser_mail0='browser "https://mail.google.com/mail/u/0/#inbox"'
alias browser_mail1='browser "https://mail.google.com/mail/u/1/#inbox"'
alias browser_mail2='browser "https://mail.google.com/mail/u/2/#inbox"'
alias browser_stu='browser "http://stu.edu.vn/"'
alias browser_stu2='browser "http://stu.edu.vn/vi/393/thong-bao.html"'
alias browser_youtube_subsriptions='browser "https://www.youtube.com/feed/subscriptions"'
alias browser_feedly='browser "https://feedly.com/i/collection/content/user/0d89157e-ce7d-4b2c-a2d6-98826f1e5089/category/global.all"'
alias browser_google_podcast_subscriptions='browser "https://podcasts.google.com/subscriptions"'

:t() { browser_new_tab "https://translate.google.com/?source=osdd#auto|auto|$argv" }

:y() { browser_new_tab "https://www.youtube.com/results?search_query=$argv" }

:d() { browser_new_tab "https://duckduckgo.com/?q=$argv" }

:gm() { browser_new_tab "https://www.google.com/maps?q=$argv" }

:g() { browser_new_tab "https://www.google.com/search?q=$argv" }

:gh() { browser_new_tab "https://github.com/search?q=$argv" }

:f() { browser_new_tab "https://www.facebook.com/search?q=$argv" }

function browser_daily () {
    cowsay "GET.SHIT.DONE"
    browser_youtube_subsriptions
    browser_google_podcast_subscriptions
    browser_feedly
    browser_mail0
    browser_mail1
    browser_fb
    browser_stu
    browser_stu2
    firefox "facebook.com"
}
