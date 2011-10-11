# say_what

say_what is a twitter bot to post based on a set of phrases as they are tweeted. It is a Rack application, and uses the [Twitter gem](https://github.com/jnunemaker/twitter) to retweet any tweets with the given parameters. 

## Configuration
1. Register your app on Twitter.
2. Grab your OAuth keys by running [this script](https://github.com/jnunemaker/twitter).
3. Set `ENV['CONSUMER_KEY']`, `ENV['CONSUMER_SECRET']`, `ENV['OAUTH_TOKEN']`, and `ENV['OAUTH_TOKEN_SECRET']`.
4. Start the app with `bundle install; rackup`.
5. Don't be spammy.

## License
The MIT License (MIT)
Copyright (c) 2011 Gordon Diggs

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
