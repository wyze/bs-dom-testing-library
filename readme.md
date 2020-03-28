# bs-dom-testing-library &middot; [![Build Status][circleci-image]][circleci-url] [![npm][npm-image]][npm-url] [![Coveralls][coveralls-image]][coveralls-url]

> [BuckleScript](//github.com/BuckleScript/bucklescript) bindings for [dom-testing-library](//github.com/kentcdodds/dom-testing-library).

## Documentation

[**Read the docs**](//testing-library.com/docs/bs-react-testing-library/intro) | [Edit the docs](//github.com/alexkrolick/testing-library-docs)

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

### [v0.6.0](https://github.com/wyze/bs-dom-testing-library/releases/tag/v0.6.0) (2020-03-27)

* Add back override and change from OCaml to Reason ([@wyze](https://github.com/wyze) in [67052c2](https://github.com/wyze/bs-dom-testing-library/commit/67052c2))
* Remove linguist language override ([@wyze](https://github.com/wyze) in [c0ae165](https://github.com/wyze/bs-dom-testing-library/commit/c0ae165))
* Upgrade devDependencies to latest versions ([@wyze](https://github.com/wyze) in [f89533e](https://github.com/wyze/bs-dom-testing-library/commit/f89533e))
* Upgrade @testing-library/dom to latest (7.1) version ([@jihchi](https://github.com/jihchi) in [#13](https://github.com/wyze/bs-dom-testing-library/pull/13))

## License

MIT © [Neil Kistner](https://neilkistner.com)

[circleci-image]: https://img.shields.io/circleci/project/github/wyze/bs-dom-testing-library.svg?style=flat-square
[circleci-url]: https://circleci.com/gh/wyze/bs-dom-testing-library

[npm-image]: https://img.shields.io/npm/v/bs-dom-testing-library.svg?style=flat-square
[npm-url]: https://npm.im/bs-dom-testing-library

[coveralls-image]: https://img.shields.io/coveralls/github/wyze/bs-dom-testing-library.svg?style=flat-square
[coveralls-url]: https://coveralls.io/github/wyze/bs-dom-testing-library
