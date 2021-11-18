# bs-dom-testing-library &middot; [![Build Status][circleci-image]][circleci-url] [![npm][npm-image]][npm-url] [![Coveralls][codecov-image]][codecov-url]

> [Rescript](//github.com/BuckleScript/bucklescript) bindings for [dom-testing-library](//github.com/testing-library/dom-testing-library).

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

  div -> setInnerHTML({|<h1>Hello, World!</h1>|});

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
