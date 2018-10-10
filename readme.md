# bs-dom-testing-library

[![Build Status][travis-image]][travis-url]
[![npm][npm-image]][npm-url]

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
/* A_test.re */

open Jest;

[@bs.new]
external domParser : unit => parser = "DOMParser";

[@bs.send.pipe : parser]
external parseFromString : ( string, [@bs.as "text/html"] _) => Dom.element = "";

[@bs.get]
external body : Dom.element => Dom.element = "";

[@bs.get]
external firstChild : Dom.element => Dom.element = "";

describe("prettyDOM", () => {
  open Expect;

  let div = domParser()
    |> parseFromString("<div><b>Hello,</b><p> World!</p></div>")
    |> body
    |> firstChild;

  describe("prettyDOM", () => {
    test("works", () => {
      let actual = div |> DomTestingLibrary.prettyDOM;

      expect(actual) |> toMatchSnapshot;
    });

    test("works with maxLength", () => {
      let actual = div |> DomTestingLibrary.prettyDOM(~maxLength=25);

      expect(actual) |> toMatchSnapshot;
    });
  });
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

* [[`2a6ddfe79f`](https://github.com/wyze/bs-dom-testing-library/commit/2a6ddfe79f)] - Split main module into submodules (#4) (Neil Kistner)
* [[`584e1de278`](https://github.com/wyze/bs-dom-testing-library/commit/584e1de278)] - Add FireEvent.click and FireEvent.change methods (#2) (Neil Kistner)
* [[`c6aa67ffcf`](https://github.com/wyze/bs-dom-testing-library/commit/c6aa67ffcf)] - Add ignore option to getByText query (#3) (Neil Kistner)
* [[`8424bb3f8e`](https://github.com/wyze/bs-dom-testing-library/commit/8424bb3f8e)] - Upgrade dependencies (Neil Kistner)

## License

MIT © [Neil Kistner](https://neilkistner.com)

[travis-image]: https://img.shields.io/travis/wyze/bs-dom-testing-library.svg?style=flat-square
[travis-url]: https://travis-ci.org/wyze/bs-dom-testing-library

[npm-image]: https://img.shields.io/npm/v/bs-dom-testing-library.svg?style=flat-square
[npm-url]: https://npm.im/bs-dom-testing-library
