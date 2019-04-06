# bs-dom-testing-library &middot; [![Build Status][circleci-image]][circleci-url] [![npm][npm-image]][npm-url] [![Coveralls][coveralls-image]][coveralls-url]

> [BuckleScript](//github.com/BuckleScript/bucklescript) bindings for [dom-testing-library](//github.com/kentcdodds/dom-testing-library).

## Installation

```sh
$ yarn add --dev bs-dom-testing-library

# or..

$ npm install --save-dev bs-dom-testing-library
```

## Usage

#### Add to `bsconfig.json`

```json
{
  "bs-dev-dependencies": [
    "bs-dom-testing-library"
  ]
}
```

#### With [`bs-jest`](//github.com/reasonml-community/bs-jest)

```ocaml
/* Header_test.re */

open Jest;
open Expect;
open Webapi.Dom;
open Webapi.Dom.Element;

test("header exists", () => {
  let div = Document.createElement("div", document);

  div->setInnerHTML({|<h1>Hello, World!</h1>|});

  div
  |> getByText(~matcher=`Str("Hello, World!"))
  |> expect
  |> ExpectJs.toBeTruthy;
});
```

## Examples

See [`src/__tests__`](src/__tests__) for some examples.

## Development

```sh
$ git clone https://github.com/wyze/bs-dom-testing-library.git
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

### [v0.4.0](https://github.com/wyze/bs-dom-testing-library/releases/tag/v0.4.0) (2019-04-05)

* Add the rest of the events and change method signature ([@wyze](https://github.com/wyze) in [0814ce1](https://github.com/wyze/bs-dom-testing-library/commit/0814ce1))
* Change tests to use new render function ([@wyze](https://github.com/wyze) in [feeb021](https://github.com/wyze/bs-dom-testing-library/commit/feeb021))
* Meta file updates ([@wyze](https://github.com/wyze) in [3ab333b](https://github.com/wyze/bs-dom-testing-library/commit/3ab333b))
* Upgrade dependencies ([@wyze](https://github.com/wyze) in [bcded3e](https://github.com/wyze/bs-dom-testing-library/commit/bcded3e))

## License

MIT © [Neil Kistner](https://neilkistner.com)

[circleci-image]: https://img.shields.io/circleci/project/github/wyze/bs-dom-testing-library.svg?style=flat-square
[circleci-url]: https://circleci.com/gh/wyze/bs-dom-testing-library

[npm-image]: https://img.shields.io/npm/v/bs-dom-testing-library.svg?style=flat-square
[npm-url]: https://npm.im/bs-dom-testing-library

[coveralls-image]: https://img.shields.io/coveralls/github/wyze/bs-dom-testing-library.svg?style=flat-square
[coveralls-url]: https://coveralls.io/github/wyze/bs-dom-testing-library
