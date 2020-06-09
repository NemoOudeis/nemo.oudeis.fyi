---
title:      Master Your Tools
date:       2020-06-08
lastmod:    2020-06-09
author:     Nemo Oudeis
draft:      false
---

Today I found ["Most tech content is bullshit"](https://www.aleksandra.codes/tech-content-consumer) by [Aleksandra Sikora](https://twitter.com/aleksandrasays). Good title, right? 😁 In a nutshell her post says: all information on the internet is written by people who don't really know. And I'd say she's right about that. Still we point to them and say "this is the authoritative source, we should follow it!". I have seen & heard the same hand-wavy arguments, from junior, senior, tech leads, engineering managers, architects - really any job title and level of seniority. A lot of the time it plays out like this:

> Expert: We need to do X!
> 
> Me: Why?
> 
> Expert: It's an industry best practice. Google is doing it!/I read it in a book. The author is famous!/I heard it at this conference. The speaker created a framework!/There is no other option!
>
> Me: Why?
>
> Expert: Because of the above!

Leaning into the external authority somehow has massive appeal.

Anyhow if you cannot formulate the problem, how your solution addresses the problem and the benefits and drawbacks of your solution then you don't know what you are talking about. At least you don't know it well enough. Unfortunately all the bullshit tech content (that Aleksandra is referring to) is the training material for the next generation of developers. It teaches them to ask: "How do I do it? And who said so?" instead of "How do I do it? Why? No I really want to understand it!".

# Framework Induced Ignorance

I work several development teams on a variety of technologies. An anti-pattern I have seen on several occasions is framework worship: developers religiously follow the framework gospel (documentation & related blog posts) and ignore what developers have learned over decades - because React is new, how could your old idea apply to React?! I call this **Framework Induced Ignorance**, developers follow the $FRAMEWORK Way™️ and close their minds to other ideas. Let me give you 3 examples.

## Android

The last 2 generations[^1] of Android developers have followed the [Android developer documentation](http://developer.android.com/). It taught them to....

[^1]: I count a framework developer generation as 5 years.

* ... love [god objects](https://en.wikipedia.org/wiki/God_object). Put all business logic into you `Activity` (or `Fragment`) - UI, business logic, external adapter code, what have you. Separation of Concerns - go home, we don't need you anymore!
* ... ignore unit testing. The testing skill in Android land is abysmal (compared to  other communities). Most code is tightly coupled to the android platform, as a result the [Robolectric](http://robolectric.org/) project was born. It provides a work around to test your code, even if it's coupled to the platform - a hack to retrofit testing into a non-testable code base. (No offense to the robolectric folks, it's a great project.)
* ...forget about threading. On Android threading is inherently necessary, the UI thread has 16ms to draw the next frame. That's no time to do heavy lifting. Still the solutions promoted by the official Android documentation were error prone, clunky and have been rightfully deprecated (farewell `Loader` & `AsyncTask`, see you never). A lot of developers adopted [reactive extensions](https://github.com/ReactiveX/RxJava) just for the sake of explicit thread control. Talk about bringing a gun to a knife fight....

## React

Recently I reviewed React.js code and one component was growing too big, it was several hundred lines of code at the time. The component is essentially an elaborate form, with different sections, which are semi independent. I've seen similar situations on other front end frameworks/platforms before, so I asked the developer:

> Me: Can we split up the into smaller, self contained pieces?
>
> Expert: No that is not possible in React, we cannot share state between functional components.
>
> *An hour of experimentation*
>
> Me: How about this → *shows pull request*. Can't we just call a function which returns JSX?
>
> Expert: How does this work? I've never seen this before? Is there a blog post or documentation about it?
>
> Me: I don't know, it's just JavaScript. A function that takes parameters and returns JSX, nothing to do with React internals really.

Later on he got really excited about this. Him sticking only to the React docs & related blogs closed his mind to "non React" approaches.

## Spring

A third example is Java/Kotlin Spring. Spring is a great tool -- if you know how to use it. Sadly what I've seen looks more like Spring is using developers. A co-worker of mine, with a background the .NET, had to take over such a Spring application. He summarized it as "more annotations than actual code". Yikes.

I work with a Spring expert who followed exactly the same approach - he loves god objects, tightly coupled to each other and to the framework, all tied together with an overgrowth of annotations. Really very similar to the unfortunate Androids above. Now he's un-learning the anti-patterns that the spring community taught him over the years. But it's a slow process.

## Wait a minute...

We've been here before. So much so that Uncle Bob already wrote about this in one of his books[^2], so I'll just steal his summary:

[^2]: [Clean Architecture](https://learning.oreilly.com/library/view/clean-architecture-a/9780134494272/), chapter 21

> Frameworks can be very powerful and very useful. Framework authors often believe very deeply in their frameworks. The examples they write for how to use their frameworks are told from the point of view of a true believer. Other authors who write about the framework also tend to be disciples of the true belief. They show you the way to use the framework. Often they assume an all-encompassing, all-pervading, let-the-framework-do-everything position.

If that sounds familiar it is essentially the same bullshit content that Aleskandra was talking about.

So now we're here, ankle-deep in bullshit content, how do we get out?

# Craft beer, craft pizza, craft... software?

Developing software is a craft.

But what does that even mean?

In history the trajectory of a tradesperson typically included 3 distinct stages: apprentice, journeyman and [master craftsperson](https://en.wikipedia.org/wiki/Master_craftsman)[^3]. Some of that system still remains in parts of the world, but only in traditional crafts - carpenters, electricians, butchers, etc.

[^3]: I prefer the term "craftsperson" to "craftsman" because there is really no reason to gender these terms. However using "journey person" instead of "journeyman" makes the writing less clear. 

What all of these trades have in common is:

1. You need knowledge of the trade
2. You need to apply that knowledge, over and over again to master different techniques and skills.
3. Reflect on and improve upon techniques & skills.

This applies to software development exactly the same way. You have to learn the basics about development and then do it a ton to become good at it. You can learn JavaScript and React basics in several weeks (step 1), but you need months to years to master JavaScript and React (step 2). What about step 3? That's how we separate wheat from chaff. If you aspire to be a software master craftsperson you have to go beyond the knowledge from framework documentation & blogs. 

## What's wrong with StackOverflow?

Well nothing really, it's a great tool, I use it a lot. But....

* Copy-paste error message into Google
* Finding a StackOverflow answer
* Copy-paste solution 
* Repeat until your problem goes away

That will achieve the immediate goal. And if you do that over and over again you arguable follow step 1 and 2: Using Google and StackOverflow is part of the developer skillset, doing it more often will make you better or faster at finding these answers. But for step 3 you need to stop and understand why that answer solves your problem. What was the root cause of the problem? How does the solution address that? 🤔

If you want to escape the bullshit content you have to understand why the solution works. If you really understand the little bit of code you found that knowledge compounds. Soon enough it's time for you to write a blog post or documentation - and you sure as hell won't write bullshit content, right?! By practicing step 3, trying to understand every bit of code you write, at least a bit better that yesterday, you have a fighting chance. By mindlessly copy-pasting however...
<!-- If you want to become an expert developer, or tech leads or software architects you need to understand why the solution works. -->

<!-- Not everybody wants that. If developing software is a low-effort way to maintain a decent lifestyle to you, or you want to transition out of development into product/project/people management, or you want to start your own business and be a jack of all trades - that's all perfectly fine. But then you're probably not reading this post anyways 😜. -->

## Extreme Values & Reasonable Expectations

Why is that thirds step, the understanding of the solution, so important? Uncle Bob formulates a "list of perfectly reasonable expectations that managers, users, and customers have of [developers]"[^4] and among them is **Fearless Competence**:

[^4]: [Clean Agile](https://learning.oreilly.com/library/view/clean-agile-back/9780135782002/), chapter 2

> Customers, users, and managers expect fearless competence. They expect that if you see something wrong or dirty, you will fix and clean it. They don’t expect you to allow problems to fester and grow; they expect you to stay on top of the code, keeping it as clean and clear as possible.

We aspire to be software master craftspeople in order to be fearlessly competent!

Similarly Courage is one of the values in Extreme Programming[^5]:

[^5]: [Extreme Programming Explained: Embrace Change](https://learning.oreilly.com/library/view/extreme-programming-explained/0321278658/), chapter 1.4

> Courage is effective action in the face of fear.

We aspire to be software master craftspeople in order to be able to act with courage!

Yet another way of putting it is in the [Manifesto for Software Craftsmanship](https://manifesto.softwarecraftsmanship.org/#/en), with the subtitle

> Raising the bar.

We aspire to be software master craftspeople in order to raise the bar!

[^6]

[^6]: I know we started with discounting external authority, so let me qualify: I refer to these sources for different (better) formulations. And to clarify that these ideas are not my original thinking.

# Master your Tool

In summary

* [Aleskandra](https://twitter.com/aleksandrasays) says "Most tech content is bullshit" - I agree
* Generations of developers suffer from Framework Induced Ignorance
* The only remedy practicing software development as a craft

Where does that leave us?

For all aspiring tech leaders/experts/architects:
* Master you tools instead of being used and abused by it!
* Create content along the way. Maybe yours won't be bullshit 😉.

