#!/usr/bin/env puppet apply

file {
  '/tmp/PuppetHelloWorld':
    content => 'Hello Yow!'
}
