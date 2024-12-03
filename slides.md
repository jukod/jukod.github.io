Competitive Programming @ JTH/JU
================================

<img src="https://github.com/user-attachments/assets/b719083b-b6af-4074-85ce-fdf3c9a49633" width=66% />

2024 Rudy Matela ([rudy.matela@ju.se]), JTH

[rudy.matela@ju.se]: mailto:rudy.matela@ju.se

------

Since 2023,
JTH/JU [has been participating][] in programming competitions/contests:

mainly in the __[Nordic Collegiate Programming Contest (NCPC)][]__.

<img src="https://github.com/user-attachments/assets/b719083b-b6af-4074-85ce-fdf3c9a49633" width=66% />

[has been participating]: https://jukod.github.io/blog
[NCPC]: https://nordic.icpc.io/
[Nordic Collegiate Programming Contest]:        https://nordic.icpc.io/
[Nordic Collegiate Programming Contest (NCPC)]: https://nordic.icpc.io/

------

::: columns

:::: {.column width=50%}

The NCPC format:

* 👥 teams of [3 university students][]
* ⏱️ 5 hours
* 🚩 [≈ 10 programming problems][]
* ⌨️ solutions in: [Python], [Java], [C#], [C++], [Haskell] or [40 other languages].
* 💻 1 computer per team
* 🎈 the team with [most solved problems][] wins

&nbsp;

* 1 problem solved = 1 balloon!

[3 university students]: https://live.staticflickr.com/7884/32596056617_5dc85ee500_b.jpg
[≈ 10 programming problems]: https://github.com/icpc/ncpc-web/releases/download/ncpc2022-data/ncpc2022problems.pdf
[Haskell]: https://www.haskell.org/
[C#]:      https://learn.microsoft.com/en-us/dotnet/csharp/
[Java]:    https://www.java.com/
[Python]:  https://www.python.org/
[C++]:     https://isocpp.org/
[C]:       https://en.wikipedia.org/wiki/C_(programming_language)
[40 other languages]: https://open.kattis.com/languages
[most solved problems]: https://ncpc24.kattis.com/contests/ncpc24/standings?filter=6262

::::

:::: {.column width=50%}

<img src="https://github.com/user-attachments/assets/f582d523-0bfa-44c1-a87e-76ca7c1f2954" width=100% />

::::

:::

------

::: columns

:::: {.column width=55%}
How are the problems?

e.g.: [NCPC 2022 Problems](https://github.com/icpc/ncpc-web/releases/download/ncpc2022-data/ncpc2022problems.pdf)

There's usually an easy problem that everyone can solve;
then problems get progressively harder up to a problem that only a couple teams can solve.

Solutions not only have to produce the correct output, but also be in the correct/expected time complexity.
It's often
easy to get the correct output through brute-force simulation ❌,
but quite hard to do it in an optimal time complexity ✅.

You can find all problems for the past decade on [open.kattis.com](https://open.kattis.com):
[NCPC 2024](https://open.kattis.com/problem-sources/Nordic%20Collegiate%20Programming%20Contest%20%28NCPC%29%202024?order=difficulty_data);
[NCPC 2023](https://open.kattis.com/problem-sources/Nordic%20Collegiate%20Programming%20Contest%20%28NCPC%29%202023?order=difficulty_data);
[NCPC 2022](https://open.kattis.com/problem-sources/Nordic%20Collegiate%20Programming%20Contest%20%28NCPC%29%202022?order=difficulty_data);
[NCPC 2021](https://open.kattis.com/problem-sources/Nordic%20Collegiate%20Programming%20Contest%20%28NCPC%29%202021?order=difficulty_data);
[NCPC 2020](https://open.kattis.com/problem-sources/Nordic%20Collegiate%20Programming%20Contest%20%28NCPC%29%202020?order=difficulty_data);
[NCPC 2019](https://open.kattis.com/problem-sources/Nordic%20Collegiate%20Programming%20Contest%20%28NCPC%29%202019?order=difficulty_data);
[NCPC 2018](https://open.kattis.com/problem-sources/Nordic%20Collegiate%20Programming%20Contest%20%28NCPC%29%202018?order=difficulty_data);
[NCPC 2017](https://open.kattis.com/problem-sources/Nordic%20Collegiate%20Programming%20Contest%20%28NCPC%29%202017?order=difficulty_data).

You can even submit your solutions there to see if you got it right
and in the right time complexity.



::::

:::: {.column width=45%}
<img src="https://live.staticflickr.com/1645/26110858644_84ba0f26c4_b.jpg" width=100% />
::::

:::

------

An example problem:

[Highest Hill from NCPC 2022](https://open.kattis.com/problems/highesthill).  (CC-BY-SA)

------

### Highest Hill (1)

__Some not-so-relevant text/story:__

Sweden may not have a particularly impressive mountain range compared to other NCPC countries such as Norway and Iceland, but at least it beats the flatlands of Denmark. The situation is not so clear when comparing other member countries though. For example, is Estonia more mountainous than Lithuania1? To settle this question, you want to determine which of the two countries has the most impressive mountain peak.

------

### Highest Hill (2)

A mountain range is defined by sampling the heights $h_i$ of $n$ equidistant points.
Within a mountain range,
we call a triple of indices
$1 \leq i < j < k \leq n$
a peak if
$h_i \leq \cdots \leq h_j \geq \cdots \geq h_k$.
The height of a peak is defined as the smaller of $h_j - h_i$ and $h_j - h_k$.

__Given a mountain range, can you find the height of its highest peak?__

------

### Highest Hill (3)

#### Sample Input 1

```
11
0 1 2 3 4 5 4 3 2 1 0
```

#### Sample Output 1

```
5
```

------

### Highest Hill (4)

#### Sample Input 2

```
10
29 85 88 12 52 37 19 86 7 44
```

#### Sample Output 2

```
67
```

------

Can you solve this?

* In $O(n^3)$ "time limit exceeded", no points... ❌
* In $O(n^2)$ "time limit exceeded", no points still... ❌
* In $O(n)$ accepted. ✅

------

::: columns

:::: {.column width=33%}

The competition stages:

1. [NCPC][]: Nordics
2. [NWERC][]: NW EU
3. [EUC][]: Europe
4. [ICPC][]: World Finals

[NWERC]: https://nwerc.eu/
[EUC]:   https://euc.icpc.global/
[ICPC]:  https://icpc.global/

Qualifying teams move to the next stage.

<img src="https://upload.wikimedia.org/wikipedia/commons/c/c6/ICPC_Foundation_logo.svg" width=66% />

::::

:::: {.column width=66%}
<img src="https://jukod.github.io/ncpc-icpc.svg" width=100% />
::::

:::

------

::: columns

:::: {.column width=50%}

The calendar:

| contest      | when               |
| ------------ | ------------------ |
| registration | __September__      |
| 1. [NCPC][]  | __early&nbsp;October__ |
| 2. [NWERC][] | late&nbsp;November |
| 3. [EUC][]   | late&nbsp;February |
| 4. [ICPC][]  | Aug-Sep            |

(Qualifying teams move to the next stage.)

<img src="https://upload.wikimedia.org/wikipedia/commons/c/c6/ICPC_Foundation_logo.svg" width=66% />

::::

:::: {.column width=50%}
<img src="https://jukod.github.io/ncpc-icpc.svg" width=100% />
::::

:::

------

There's an intricate web of competitions worldwide...

<img src="https://jukod.github.io/full-icpc.svg" width=100% />

------

Being in Sweden,
you nevertheless start at __[NCPC]__.

------

### NCPC 2025

::: columns

:::: {.column width=50%}

When?

* __Saturday 4 October 2025__ 10:00 -- 16:00.

Where?

* __¿JTH?__

&nbsp;

In the past...

* Linköping University (2023 & 2024), we drove there
* For 2025, __maybe/perhaps/perchance__ we will host at __¿JTH?__.

::::

:::: {.column width=50%}

<img src="https://ju.se/images/18.1ad0f9d6177c3b563dd27f22/1614754729027/JTH-180507-1040.jpg" width=100% />

::::

:::

------

::: columns

:::: {.column width=50%}

__Why participate?__

* Its __fun__!  You get baloons 🎈🎈🎈!
* A great way to __practice programming__: data structures, algorithms, etc.
* __Coursework__: gets __easier__.
* Teamwork.
* Meet people / networking.
* Potential travel (if you qualify)
* Nice for your CV.
* "Meet" companies (sponsors).

::::

:::: {.column width=50%}

<img src="https://live.staticflickr.com/1526/26113291873_9208648a69_b.jpg" width=100% />

<img src="https://live.staticflickr.com/7884/32596056617_5dc85ee500_b.jpg" width=100% />

<img src="https://miro.medium.com/v2/resize:fit:720/format:webp/1*mWjv-mIg4gGw7vhj-uCyRw.jpeg" width=100% />

::::

:::

------

For NWERC, there's even a livestream with live scoreboard, a narrator, a commentator and whatnot:

<iframe width="100%" style="aspect-ratio: 16/9" src="https://www.youtube.com/embed/Ho3z9XpJ5AA?si=H6rRPzUnmrFSjzNr&amp;start=1413" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

------

::: columns

:::: {.column width=60%}

__Would you like to participate?__

1. __form a team__ of 3 JU students;
2. contact a JU/JTH lecturer to be your __team coach__:
	* your coach is responsible for registering you;
3. __start practicing__.

... not necessarily in the above order...

For CSE/AIE students:
Rudy Matela ([rudy.matela@ju.se](mailto:rudy.matela@ju.se))
can be your coach if you like.
(with Masoumeh Taromirad as the co-coach)

For students of other programmes:
find a coach within your programme/department.

::::

:::: {.column width=40%}

<img src="https://live.staticflickr.com/1645/26110858644_84ba0f26c4_b.jpg" width=100% />

::::

:::

------

## JU Kod Study Group

::: columns

:::: {.column width=60%}

__How to practice?__

__Join the [JU Kod][] study group.__

[JU Kod]: https://jukod.github.io/

We have a mailing list and a [Discord server][jukod-discord-server].
We have occasional __meetups and practice sessions__.
You can find more information on our website.

The mailing list is maintained by Rudy Matela.
Let me know if you want in
and you'll be informed of when we hold practice sessions, contests or meetups.

The [Discord server][jukod-discord-server] is maintained by students (Rudy is not there).

[jukod-discord-server]: https://discord.gg/fxZvWBCt9G

::::

:::: {.column width=40%}

https://jukod.github.io/

<img src="qr.svg" width=100% />

::::

:::

------

## JU Kod Study Group (2)

::: columns

:::: {.column width=60%}

On the [JU Kod] website,
you'll find a list of interesting problems to start practicing:

- [F -             FizzBuzz &nbsp; 🐝](https://open.kattis.com/problems/fizzbuzz)
- [C -     Coffee Cup Combo &nbsp; ☕](https://open.kattis.com/problems/coffeecupcombo)
- [K -       Knot Knowledge &nbsp; 🪢](https://open.kattis.com/problems/knotknowledge)
- [L -         Locust Locus &nbsp; 🦗](https://open.kattis.com/problems/locustlocus)
- [H -         Highest Hill &nbsp; ⛰️](https://open.kattis.com/problems/highesthill)
- [J -             Jamboree &nbsp; ⛺](https://open.kattis.com/problems/jamboree)
- [C -    Converting Romans &nbsp; 🏛️](https://open.kattis.com/problems/convertingromans)
- [G - Graduation Guarantee &nbsp; 🎓](https://open.kattis.com/problems/graduationguarantee)

They're all from past editions of NCPC.

They are hosted on Open Kattis,
you can submit your solutions to be graded automatically
as if you were in the competition/contest.

::::

:::: {.column width=40%}

https://jukod.github.io/

<img src="qr.svg" width=100% />

::::

:::


------

### JU/JTH @ NCPC: summary

| .                       | #-prob.      | 🇸🇪-rank    | 🇸🇪%   | rank        | %       |
| ----------------------- | ------------ | ------------ | ------- | ----------- | ------- |
| [NCPC 2023][ncpc2023sb] | 5 🎈🎈🎈🎈🎈 |    24th / 36 | top 66% |  89th / 160 | top 55% |
| [NCPC 2024][ncpc2024sb] | 4 🎈🎈🎈🎈   |     9th / 23 | top 40% |  __39th / 139__ | __top 30%__ |

... also: [3 problems solved at NWERC 2024][]!

<img src="https://github.com/user-attachments/assets/b719083b-b6af-4074-85ce-fdf3c9a49633" width=55% />
<img src="https://github.com/user-attachments/assets/f582d523-0bfa-44c1-a87e-76ca7c1f2954" width=30% />

[ncpc2023sb]: https://ncpc23.kattis.com/contests/ncpc23/standings?filter=5254
[ncpc2024sb]: https://ncpc24.kattis.com/contests/ncpc24/standings?filter=6262
[3 problems solved at NWERC 2024]: https://2024.nwerc.eu/main/scoreboard/

------

Think you can do better?

Join next time.


------

::: columns

:::: {.column width=60%}

__Would you like to participate?__

1. __form a team__ of 3 JU students;
2. contact a lecturer to be your __team coach__:
	* your coach is responsible for registering you;
3. __start practicing__.
4. Join [JU Kod] for practice, tips and tricks.

... not necessarily in the above order...

For CSE/AIE students:
Rudy Matela ([rudy.matela@ju.se](mailto:rudy.matela@ju.se))
can be your coach if you like.
(with Masoumeh Taromirad as the co-coach)

For students of other programmes:
find a coach within your programme/department.

::::

:::: {.column width=40%}

<img src="https://github.com/user-attachments/assets/f582d523-0bfa-44c1-a87e-76ca7c1f2954" width=100% />

[jukod.github.io](https://jukod.github.io/)

<img src="qr.svg" width=50% />

::::

:::


------

### Any questions?

::: columns

:::: {.column width=50%}

<img src="https://github.com/user-attachments/assets/b719083b-b6af-4074-85ce-fdf3c9a49633" width=100% />

<img src="https://live.staticflickr.com/1645/26110858644_84ba0f26c4_b.jpg" width=100% />

::::

:::: {.column width=50%}

<img src="https://github.com/user-attachments/assets/f582d523-0bfa-44c1-a87e-76ca7c1f2954" width=100% />

<img src="https://live.staticflickr.com/1526/26113291873_9208648a69_b.jpg" width=100% />

::::

:::

------

### Thank you!

::: columns

:::: {.column width=50%}

<img src="https://github.com/user-attachments/assets/b719083b-b6af-4074-85ce-fdf3c9a49633" width=100% />

<img src="https://live.staticflickr.com/1645/26110858644_84ba0f26c4_b.jpg" width=100% />

::::

:::: {.column width=50%}

<img src="https://github.com/user-attachments/assets/f582d523-0bfa-44c1-a87e-76ca7c1f2954" width=100% />

<img src="https://live.staticflickr.com/1526/26113291873_9208648a69_b.jpg" width=100% />

::::

:::

------

.

------

To compile this document from source run:

```bash
pandoc --title "JU Kod" -tslidy -s slides.md -o slides.html
```

You need `pandoc` installed.

This slide set can be found on:

```
https://jukod.github.io/slides
```

------

.
