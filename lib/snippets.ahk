:?*:\po::
clipboard = checkout my portfolio https://brokenricefilms.pages.dev/portfolio
send ^+v
return
:?*:\m::
clipboard = brokenricefilms@gmail.com
send ^+v
return

:?*:\po::
clipboard = checkout my portfolio https://brokenricefilms.pages.dev/portfolio
send ^+v
return

:?*:\w::
clipboard = https://brokenricefilms.pages.dev
send ^+v
return

:?*:\pp::
clipboard = 
(
Hi,

I have experience working with a travel vlog youtube channel with over 50,000 subscribers.

Here are some examples of travel vlogs I edited:
- https://vimeo.com/952803807
- https://vimeo.com/952798464
- https://vimeo.com/952798415

You can also check out my portfolio: https://brokenricefilms.pages.dev/portfolio

Let's delve into your project:
- Could you share an example video that represents the style you're aiming for?
- How many videos do you plan to assign to me if the first task goes well?
- Are there any color palettes, style guides, or branding guidelines I should follow during editing?

Thanks,
Thuan pham
)
send ^+v
return

:?*:\ph::
clipboard = 0765650452
send ^+v
return

:?*:\g::
send gramma check ""
sleep 200
send {left}
sleep 100
send #!+v
sleep 100
send {enter}
sleep 200
send ^v
sleep 200
send ^{enter}
return

:?*:\x::
autotrim off
search := "from:brokenricefilms "
clipboard := search
send ^+v
return
