#!/bin/sh

wget http://nlp.stanford.edu/software/stanford-parser-full-2015-12-09.zip
unzip stanford-parser-full-2015-12-09.zip
rm -f stanford-parser-full-2015-12-09.zip
cd stanford-parser-full-2015-12-09
mv * ..
cd ..
wget http://nlp.stanford.edu/software/stanford-chinese-corenlp-2016-01-19-models.jar
wget http://nlp.stanford.edu/software/stanford-english-corenlp-2016-01-10-models.jar
wget http://nlp.stanford.edu/software/stanford-french-corenlp-2016-01-14-models.jar
wget http://nlp.stanford.edu/software/stanford-german-2016-01-19-models.jar
wget http://nlp.stanford.edu/software/stanford-spanish-corenlp-2015-10-14-models.jar

unzip -o stanford-parser.jar
unzip -o slf4j-api.jar
unzip -o slf4j-simple.jar
unzip -o stanford-chinese-corenlp-2016-01-19-models.jar
unzip -o stanford-english-corenlp-2016-01-10-models.jar
unzip -o stanford-french-corenlp-2016-01-14-models.jar
unzip -o stanford-german-2016-01-19-models.jar
unzip -o stanford-spanish-corenlp-2015-10-14-models.jar

mkdir -p service/impl
mkdir -p service/endp
