#!/bin/bash

javac -cp . ParserService.java
mv -f ParserService.class service/impl/

javac -cp . ParserServiceImpl.java
mv -f ParserServiceImpl.class service/impl/

javac ParserServicePublisher.java
mv -f ParserServicePublisher.class service/endp/
