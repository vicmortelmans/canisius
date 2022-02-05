# canisius

Live website: [bijbel.gelovenleren.net](https://bijbel.gelovenleren.net)

After cloning, cd into BibleConfiguration and `git submodule update --init`

Katholieke Bijbelvertaling

Ant targets:

- *html-per-book* Separate files per book and top-level navigation

- *html* A single HTML file containing the whole Bible (is part of the html-per-book website)

- *html-sitemap* An XML sitemap file for the html-per-book website

- *bijbel* builds the above targets and uploads the result 

Following targets are not related to the website:

- *xml-per-chapter* Separate files per chapter

- *html-without-sup* Variant of the latter, with different bookmarking

- *outline* XML outline with verse counts
