#!/bin/bash

input=linkstoread.txt

cat $input | grep 'habrahabr\|geektimes' | sed -E "s#http://(geektimes|habrahabr)\.ru/(post|company/[a-z]+/blog)/([0-9]+)/#wget -nd -E -H -k -K -p -P \1/\3 http://m.\1.ru/post/\3#" >dl.sh
cat $input | grep 'habrahabr\|geektimes' | sed -E "s#http://(geektimes|habrahabr)\.ru/(post|company/[a-z]+/blog)/([0-9]+)/#wget -nd -E -H -k -K -p -P \1/\3 http://m.\1.ru/post/\3/comments#" >>dl.sh
chmod +x dl.sh

rm index.html
cat $input | grep 'habrahabr\|geektimes' | sed -E "s#http://(geektimes|habrahabr)\.ru/(post|company/[a-z]+/blog)/([0-9]+)/#<a href='\1/\3/\3.html'>\1\3</a> <a href='\1/\3/comments.html'>\1\3_comments</a>#" >>index.html
