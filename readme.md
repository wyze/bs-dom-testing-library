# rescript-dom-testing-library
[![Build Status][circleci-image]][circleci-url] [![npm][npm-image]][npm-url] [![Coveralls][codecov-image]][codecov-url]

## Documentation
rescript-dom-testing-library updates Neil Kistner's bindings for [dom-testing-library](//github.com/testing-library/dom-testing-library) to [Rescript 9.x ](//github.com/rescript-lang/).  Breaking changes include

- [Rescript 9](https://rescript-lang.org/docs/manual/latest/introduction) revamps the JavaScript Promise API bindings, deprecating `Js.Promise` in favor of [Patrick Ecker's proposal](https://github.com/ryyppy/rescript-promise#usage). rescript-dom-testing-library now depends on [ryyppy/rescript-promise](https://github.com/ryyppy/rescript-promise#usage).
- Web API bindings: [bs-webapi](https://www.npmjs.com/package/bs-webapi) dependency has been updated to the Reason Community webapi package [rescript-webapi](https://www.npmjs.com/package/rescript-webapi).
- Jest bindings:  [`@glennsl/rescript-jest`](https://github.com/glennsl/rescript-jest) replaces `@glennsl/bs-jest`.  In order to align with Rescript 9 API and semantics, `@glennsl/rescript-jest` introduces many breaking changes.  See the [rescript-jest readme file](https://github.com/glennsl/rescript-jest#readme)
- testing-library/dom dependencies updated to latest available version of each.
- [Jest 27.0.0](https://github.com/facebook/jest/pull/10947) switched from Jest-Jasmine to Jest-circus changing the behavior of before and after hooks.  See the rescript-jest [readme](https://github.com/glennsl/rescript-jest#readme) file.
- [Recript 9](https://rescript-lang.org/docs/manual/latest/introduction) deprecates the [|> pipe operator](https://rescript-lang.org/docs/manual/latest/pipe#triangle-pipe-deprecated). rescript-dom-testing-library now uses the `->` arrow pipe operator and data-first semantics
- [Recript 9](https://rescript-lang.org/docs/manual/latest/introduction) deprecates the [send.pipe decorator](https://rescript-lang.org/syntax-lookup#send-pipe-decorator).  rescript-dom-testing-library bindings now use the [send decorator](https://rescript-lang.org/syntax-lookup#send-decorator).

Non-breaking changes include
- rescript-dom-testing-library includes babel.config.js and jest.config.js illustrating how to transform Jest tests to use ES6 module format



[**Read the docs**](//testing-library.com/docs/bs-react-testing-library/intro) | [Edit the docs](//github.com/alexkrolick/testing-library-docs)

## Installation

```sh
$ yarn add --dev rescript-dom-testing-library

# or..

$ npm install --save-dev rescript-dom-testing-library
```

## Usage

#### Add to `bsconfig.json`

```json
{
  "bs-dev-dependencies": [
    "rescript-dom-testing-library",
    "ryppy/rescript-promise",
  ]
}
```

#### With [`rescript-jest`](//github.com/glennsl/bs-jest)

```ocaml
/* Header_test.res */

open GlennslRescriptJest.Jest;
open Expect;
open Webapi.Dom;
open Webapi.Dom.Element;

test("header exists", () => {
  let doc = document -> Document.createElement("div")
  doc -> setInnerHTML(`<h1>Hello, World!</h1>`)

  doc -> getByText(~matcher=#Str("Hello, World!"), ())
  -> expect
  -> ExpectJs.toBeTruthy;
})
```

## Examples

See [`src/__tests__`](src/__tests__) for some examples.

## Development

```sh
$ git clone https://github.com/wyze/s-dom-testing-library.git
$ cd bs-dom-testing-library
$ yarn # or `npm install`
```

## Build

```sh
$ yarn build
```

## Test

```sh
$ yarn test
```

## Change Log

> [Full Change Log](changelog.md)

### [v0.8.0 ]
- Updated to Rescript 9
- [BREAKING] Updated to [Patrick Ecker's Promise API](https://github.com/ryyppy/rescript-promise#usage)
- [BREAKING] Updated to data-first semantics.  API chaining now uses `->` operator instead of `|>` operator
- Updated tests to use GlennslRescriptJest namespace.
### [v0.7.0](https://github.com/wyze/bs-dom-testing-library/releases/tag/v0.7.0) (2020-10-21)

* Add waitForElementToBeRemoved ([@wyze](https://github.com/wyze) in [#23](https://github.com/wyze/bs-dom-testing-library/pull/23))
* Add more ByRole options ([@wyze](https://github.com/wyze) in [#22](https://github.com/wyze/bs-dom-testing-library/pull/22))
* Update some of the utility functions ([@wyze](https://github.com/wyze) in [#21](https://github.com/wyze/bs-dom-testing-library/pull/21))
* Add sponsor button ([@wyze](https://github.com/wyze) in [dec1dab](https://github.com/wyze/bs-dom-testing-library/commit/dec1dab))
* Upgrade to latest dependencies ([@wyze](https://github.com/wyze) in [#20](https://github.com/wyze/bs-dom-testing-library/pull/20))

## License

MIT © [Neil Kistner](https://neilkistner.com)

[circleci-image]: https://img.shields.io/circleci/project/github/wyze/bs-dom-testing-library.svg?style=flat-square
[circleci-url]: https://circleci.com/gh/wyze/bs-dom-testing-library

[npm-image]: https://img.shields.io/npm/v/bs-dom-testing-library.svg?style=flat-square
[npm-url]: https://npm.im/bs-dom-testing-library

[codecov-image]: https://img.shields.io/codecov/c/github/wyze/bs-dom-testing-library.svg?style=flat-square
[codecov-url]: https://codecov.io/github/wyze/bs-dom-testing-library
