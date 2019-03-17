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

### [v0.3.0](https://github.com/wyze/bs-dom-testing-library/releases/tag/v0.3.0) (2018-10-10)

- [[`2a6ddfe79f`](https://github.com/wyze/bs-dom-testing-library/commit/2a6ddfe79f)] - Split main module into submodules (#4) (Neil Kistner)
- [[`584e1de278`](https://github.com/wyze/bs-dom-testing-library/commit/584e1de278)] - Add FireEvent.click and FireEvent.change methods (#2) (Neil Kistner)
- [[`c6aa67ffcf`](https://github.com/wyze/bs-dom-testing-library/commit/c6aa67ffcf)] - Add ignore option to getByText query (#3) (Neil Kistner)
- [[`8424bb3f8e`](https://github.com/wyze/bs-dom-testing-library/commit/8424bb3f8e)] - Upgrade dependencies (Neil Kistner)

## License

MIT © [Neil Kistner](https://neilkistner.com)

[circleci-image]: https://img.shields.io/circleci/project/github/wyze/bs-dom-testing-library.svg?style=flat-square
[circleci-url]: https://circleci.com/gh/wyze/bs-dom-testing-library

[npm-image]: https://img.shields.io/npm/v/bs-dom-testing-library.svg?style=flat-square
[npm-url]: https://npm.im/bs-dom-testing-library

[coveralls-image]: https://img.shields.io/coveralls/github/wyze/bs-dom-testing-library.svg?style=flat-square
[coveralls-url]: https://coveralls.io/github/wyze/bs-dom-testing-library
