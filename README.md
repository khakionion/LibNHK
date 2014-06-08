# LibNHK

A framework for accessing NHK's public data. At the moment, it only supports [NHK NEWSweb Easy](http://www3.nhk.or.jp/news/easy/), but other data is publicly accessible and well-formatted, so it should be possible to grow the library. 

## Usage

    var theNews:NHKEasyNews! = NHKEasyNews() //or specify an NSData/NSURL
    for nextArticle:NHKArticle in theNews.articleStore! {
        println("Next article: " + nextArticle.title!)
    }

## License

This library is available under the [MIT license](http://www.opensource.org/licenses/mit-license.php).

