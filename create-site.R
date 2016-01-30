setwd('~/Documents/code/rweyant.github.io/')
jekyll(dir='.',
       input=c('.','_source','_posts'),
       output=c('.','_posts'),
       script=c('Makefile','build.R'),
       serve=TRUE,
       command = 'bundle exec jekyll build')
