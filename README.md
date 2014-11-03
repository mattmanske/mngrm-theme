# MNGRM Shopify Theme

This is a Middleman project that includes all of the initial templates, styles,
and basic javascript for Small Shops United.

### Asset Pipeline

Middleman comes prepackaged with SASS and Coffeescript. We've also included
[slim](http://slim-lang.com/) for templates, and [bourbon](http://bourbon.io/)
and [neat](http://neat.bourbon.io/) for additional SASS mixins.

We've also included [gmaps.js](http://hpneo.github.io/gmaps/), an easier way to
interact with the Google Maps Javascript API.

LiveReload will update your HTML/JS/CSS automatically whenever you make changes.
**Note: When you add new files, you may need to restart Middleman for
them to be included correctly.**

### Getting Setup

After you've cloned the repo, you'll need to install the necessary packages:

```
$ bundle install && npm install && bower install
```

Then start the Middleman server:

```
$ bundle exec middleman
```

You can now visit the site by going to [localhost:4567](http://localhost:4567/)

### Deployment

This repo is setup to build and deploy to GitHub pages. To do so, use th following command:

```
$ rake publish
```

If the build process is successful, you should see the updates at [polymatt.github.io/mngrm-theme](http://polymatt.github.io/mngrm-theme)

If you'd instead like to bypass the deployment and generate the site, use:

```
$ bundle exec middleman build
```

The command will generate a directory in the root of the project labeled
"build" and you can open the index.html file in your browser.
