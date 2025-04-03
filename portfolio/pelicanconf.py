#!/usr/bin/env python
# -*- coding: utf-8 -*- #

#/ Site author, name and url
AUTHOR = 'Santiago Mosca'
SITENAME = 'Portfolio'
BIND = 'localhost'
SITEURL = ''
TIMEZONE = 'Europe/Madrid'
DEFAULT_LANG = 'es'
 
#/ Theme and contents
THEME = 'theme/mytheme'
RELATIVE_URL = False
PATH = 'content'
STATIC_PATHS = ['imgs', 'docs']

PAGE_PATHS = ['pages']
PAGE_URL = '{slug}.html'
PAGE_SAVE_AS = '{slug}.html'

TAG_URL = '{slug}.html'
TAG_SAVE_AS = '{slug}.html'

SUMMARY_MAX_LENGTH = 20

#/ Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None
 
#/ Variables
GITHUB_URL = 'https://github.com/santiagomosca'

#/ Blogroll
LINKS = (('Pelican', 'http://getpelican.com/'),
         ('Python.org', 'http://python.org/'),
         ('Jinja2', 'http://jinja.pocoo.org/'),)

## # Social widget
## #SOCIAL = (('LinkedIn', 'https://www.linkedin.com/in/livia-jakob/'),)
## 
## 
## # Uncomment following line if you want document-relative URLs when developing
## #RELATIVE_URLS = True
## 
## # Order pages and articles by attribute
## PAGE_ORDER_BY = 'attribute'
## ARTICLE_ORDER_BY = 'attribute'
