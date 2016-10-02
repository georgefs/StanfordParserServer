# StanfordParserServer

## Introduction

[Stanford Parser](http://nlp.stanford.edu/software/lex-parser.shtml)是由
[Christopher Manning](http://nlp.stanford.edu/manning/)及他實驗室的成員開發的parser。
parser是一種程式，能夠找出句子裡的文法結構。在Starford Parser裡，包含PCFG parser
及dependency parser，支援中文、英文、法文、德文、西班牙文等五種語言。

本程式試著將中文的dependency parser包裝成一個service，因為我不太擅長Java，所以
安裝過程及程式內容有不通順的地方，如果願意一起改進，歡迎使用pull request分享你的
程式碼。

## Prerequisites

1. Java 8
2. Python2要裝`suds`，Python3要裝`suds-py3`

## Installation

```shell-script
git clone https://github.com/banyh/StanfordParserServer
sh install.sh
```

Start the server at port `9997`:

```shell-script
nohup sh run.sh &
```

## Customization

1. parser對外的網址定義在`ParserServicePublisher.java`中，
    裡面寫`http://0.0.0.0:9997/parser`表示要用`http://localhost:9997/parser?wsdl`來存取
2. parser的實際內容定義在`ParserServiceImpl.java`中，
    裡面已經固定使用中文model `"edu/stanford/nlp/models/lexparser/chineseFactored.ser.gz"`，
    如果要使用其他語言，請自行修改

## Python Usage

請參考`client.py`。

1. `from suds.client import Client`
2. `parClient = Client('http://localhost:9997/parser?wsdl')`
3. 傳的參數應該是經過postag及segment的句子，格式為: `w1 w2$$$w3 w4 w5###t1 t2$$$t3 t4 t5`。
    其中`w1, w2`代表一個句子，`w3, w4, w5`代表第二個句子，中間用`$$$`分隔。
    `t1, t2`代表第一句的pos-tag，`t3, t4, t5`代表第二句的pos-tag，中間也用`$$$`分隔。
4. `result = parClient.service.getParserResult(word_tag)`。
    result的格式為: `r1,h1,d1 r2,h2,d2$$$r3,h3,d3 r4,h4,d4 r5,h5,d5`。
    其中`r1`代表第一個relation，`h1`代表relation head的編號(從1開始)，`d1`代表relation dependent的編號。
5. 注意事項: 因為訓練資料是簡體，所以要文字轉為簡體再作parsing
