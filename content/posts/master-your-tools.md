---
title:      Master Your Tools
date:       2020-06-08T13:59:22+09:00
lastmod:    2020-06-08T13:59:22+09:00
author:     Nemo Oudeis
draft:      true
---

Today I stumbled upon this post ["Most tech content is bullshit"](https://www.aleksandra.codes/tech-content-consumer) by [Aleksandra Sikora](https://twitter.com/aleksandrasays). In summary she says: whatever information you find on the internet, take it with a grain of salt. And I couldn't agree more. (She formulated this thought so well with "just" 3 years of professional experience, impressive clarity for such a young developer). I have experienced the same hand-wavy arguments in before, from junior, senior, tech leads, engineering managers, architects - really any job title and level of seniority. A lot of the time it plays out as

> Expert: We need to do X!
> 
> Me: Why?
> 
> Expert: It's an industry best practice. Google is doing it!/I read it in a book. The author is famous!/I heard it at this conference. The speaker created a framework!/There is no other option!
>
> Me: Why?
>
> Expert: Because of the above!

Leaning into the external authority somehow has massive appeal...

Anyhow if you cannot formulate the problem and the benefits and drawbacks of your proposed solutions you don't know what you are talking about. At least you don't know it well enough. Unfortunately all the bullshit tech content that Aleksandra is referring to is the training material for the next generation of developers. What it teaches them is to ask: "How? Who said so?" instead of "How? Why? No I really want to understand it!".

# Framework Induced Ignorance

As a software architect I work with application teams on a variety of technologies. An anti-pattern I have seen a lot is framework worship: developers religiously follow the framework documentation & related blog posts, they ignore what developers have learned over decades - because React is new, how could your old idea apply to React?! I call this "Framework Induced Ignorance", developers follow the $FRAMEWORK Way™️ and closing their minds to all other ideas. Let me give you 3 examples I've sen over the last 10 years:

The last 2 generations of Android developers[^1] have followed the [Android developer documentation](http://developer.android.com/) and learned to....

[^1]: I count a framework developer generation as 5 years.

* ... love [god objects](https://en.wikipedia.org/wiki/God_object). Put all business logic into you `Activity` (or `Fragment`) - UI, business logic, external adapter code, what have you. Separation of Concerns - go home, you're drunk.
* ... ignore unit. The testing skill in the field is abysmal (compared to  other communities). Most code is tightly coupled with the android platform, as a result the [Robolectric](http://robolectric.org/) project was born. It provides a work around to test your code, even if it's coupled to the platform - a hack to retrofit testing into a non-testable code base. (No offense to the robolectric folks, it's a great project.)
* ...forget about threading. On Android threading is inherently necessary, the UI thread has 16ms to draw the next frame. That's no time to do heavy lifting. Still the solutions promoted by Android were error prone, clunky and have been rightfully deprecated (see you never `Loader` & `AsyncTask`). A lot of developers adopted [reactive extensions](https://github.com/ReactiveX/RxJava) just for the sake of explicit thread control. Talk about bringing a gun to a knife fight....

Recently I reviewed React.js code and saw a component that was growing too big, it was maybe 500 lines of code at the time. It was essentially a fancy form, with different sections, which are semi independent. I've seen similar situations on other front end frameworks/platforms before, so I asked the developer:

> Me: Can we split up the into smaller, self contained pieces (without necessarily creating new React components)?
>
> Expert: No that is not possible in React.
>
> *An hour of experimentation*
>
> Me: How about this → *shows pull request*. Can't we just call a function from JSX which returns a sub-"component"?
>
> Expert: How does this work? I've never seen this before? Is there a blog post or documentation about it?
>
> Me: I don't know, it's just JavaScript. Just a function that takes parameters and returns JSX, nothing to do with React really (except for the JSX).

Later on he got really excited about this. Him sticking only to the React docs & related blogs closed his mind to "non-react" approaches.

A third example is Java/Kotlin Spring. Spring is a great tool if you know how to use it. What I've seen looked more like developers being used by Spring, sadly. A co-worker of mine, which a background in the .NET world, had to take over such a Spring application. He summarized it as "more annotations than actual code". I work with a Spring expert who followed exactly the same approach - just link the Androids above he loves god objects, which are tightly coupled to each other and the framework (mostly through an overgrowth of annotations). Now he's un-learning the anti-patterns that the spring community taught him over the years, but it's a slow process.

To steal Uncle Bob's summary[^2]:

[^2]: [Clean Architecture](https://learning.oreilly.com/library/view/clean-architecture-a/9780134494272/), chapter 21

> Frameworks can be very powerful and very useful. Framework authors often believe very deeply in their frameworks. The examples they write for how to use their frameworks are told from the point of view of a true believer. Other authors who write about the framework also tend to be disciples of the true belief. They show you the way to use the framework. Often they assume an all-encompassing, all-pervading, let-the-framework-do-everything position.

# Craft beer, craft pizza, craft... software?

Developing software is a craft. 

Wait, what? What does that even mean?

In history the trajectory of a tradesperson typically included 3 distinct stages: apprentice, journeyman and [master craftsperson](https://en.wikipedia.org/wiki/Master_craftsman)[^3]. Some of that system still remains in parts of the world, but only in traditional crafts - carpenters, electricians, butchers (as opposed to "unskilled" jobs).

[^3]: I prefer the term "craftsperson" to "craftsman" because there is really no reason to gender these terms. However using "journey person" instead of "journeyman" makes the writing less clear. 

What all of these trades have in common is:

1. You need knowledge specific to the trade
2. You need to apply that knowledge over and over again to master the different techniques and skills of your trade.
3. Reflect on and improve techniques & skills of the trade.

I argue this applies to software development exactly the same way. You have to learn the basics about development and then do it a ton to become good at it. For example you can learn JavaScript and React basics in several weeks (step 1), but you need months to years to master JavaScript and React (step 2). What about step 3? That's how we separate wheat from chaff. If you aspire to be a software master craftsperson you have to go beyond the knowledge from framework documentation & blogs. 

## What's wrong with Stackoverflow?

Well nothing really, it's a great tool, I use it a lot. But....

For example copy pasting an error message into google, finding a stack overflow answer, copy-pasting the solution until your problem goes away - that will achieve the immediate goal. And if you do that over and over again you arguable follow step 1 and 2: Using google and stack overflow is part of the developer skillset, doing it more often will likely make you better at finding these answers (or may just faster at typing the query). But for step 3 you need to stop and understand why that answer solves your problem. What was the root cause of the problem? How does the solution address that? 🤔

If you want to become an expert developer, or tech leads or software architects you need to understand why the solution works. 

Tot everybody wants that. If developing software is a low-effort way to maintain a decent lifestyle to you, or you want to transition out of development into product/project/people management, or you want to start your own business and be a jack of all trades - that's all perfectly fine. But then you're probably not reading this post anyways 😜.

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
* This leads to Framework Induced Ignorance in the next generation of software developers
* The remedy is recognizing software development as a craft

Where does that leave us?

For all aspiring tech leaders/experts/architects:
* Master you tools instead of being used and abused by it!
* Create content along the way. Maybe yours won't be bullshit 😉.

