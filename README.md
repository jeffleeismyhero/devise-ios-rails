Devise iOS Rails Backend
====================================

Gem that updates devise to work with external clients. Specially created to work with [devise for iOS][ios_devise].

Requirements
============

| Name |  Version |
| :--: | :---: |
| [Ruby][ruby] | 2.1.5 |
| [Rails][rails] | 4.2 |
| [Devise][devise] | 3.4.1 |

Setup
=====

With a working devise environment, the only thing you need to do is:

- add gem to the Gemfile `gem 'devise-ios-rails'`
- `bundle install`

Example app
===========

- [Rails with devise and Simple Authentication Token authentication][rails_example_app]


Contribution
============

First, thank you for contributing!

Here a few guidelines to follow:

- we follow [Ruby Style Guide][ruby_style_guides].
- you can use [rubocop][rubocop] which can be easily integrated with popular editors. ([our rubocop config][rubocop_config])
- write tests
- make sure the entire test suite passes
- make sure rubocop passes, our config
- open a pull request on GitHub
- [squash your commits][squash_commits] after receiving feedback

Copyright  2014 © [Netguru][netguru_url], released under the New BSD License

[ruby]: https://www.ruby-lang.org
[rails]: http://www.rubyonrails.org
[ios_devise]: https://github.com/netguru/ios-devise
[ruby_style_guides]: https://github.com/bbatsov/ruby-style-guide
[rubocop]: https://github.com/bbatsov/rubocop
[rubocop_config]: https://github.com/netguru/hound/blob/master/config/rubocop.yml
[squash_commits]: http://blog.steveklabnik.com/posts/2012-11-08-how-to-squash-commits-in-a-github-pull-request
[netguru_url]: https://netguru.co
[rails_example_app]: https://github.com/netguru/devise-ios-rails-example
