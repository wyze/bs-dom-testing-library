@@coverage(exclude_file)

open GlennslRescriptJest.Jest
open Webapi.Dom
open Webapi.Dom.Element

@get external tagName: Dom.element => string = "tagName"
@get external name: Dom.element => string = "name"

@val external setTimeout: (unit => unit, int) => float = "setTimeout"

let render = html => {
  let body = document -> Document.createElement("body")

  body->setInnerHTML(html)

  document->Document.unsafeAsHtmlDocument->HtmlDocument.setBody(body)

  body
}

afterEach(() =>
  switch document->Document.unsafeAsHtmlDocument->HtmlDocument.body {
  | Some(body) => body->setInnerHTML("")
  | None => raise(Failure("Not document body found"))
  }
)

afterAll(Bisect.Runtime.write_coverage_data)

describe("DomTestingLibrary", () => {
  open DomTestingLibrary
  open Expect

  describe("prettyDOM", () => {
    let html = `<b title="greeting">Hello,</b><p data-testid="world"> World!</p><input type="text" placeholder="Enter something" /><input type="text" value="Some value" /><img src="" alt="Alt text" />`

    test("works", () => render(html) -> prettyDOM -> expect -> toMatchSnapshot)

    test("works with maxLength", () =>
      render(html) -> prettyDOM(~maxLength=60) -> expect -> toMatchSnapshot
    )
  })

  describe("configure works", () => {
    afterAll(() =>
      configure(~update=#Object(Configure.makeOptions(~testIdAttribute="data-testid", ())))
    )

    test("using an object", () => {
      configure(~update=#Object(Configure.makeOptions(~testIdAttribute="data-custom-test-id", ())))
      render(`<p data-custom-test-id="world"> World!</p>`)
      -> getByTestId(~matcher=#Str("world"))
      -> expect
      -> toMatchSnapshot
    })

    test("using a function", () => {
      configure(
        ~update=#Func(_ => Configure.makeOptions(~testIdAttribute="data-custom-test-id", ())),
      )
      render(`<p data-custom-test-id="world"> World!</p>`)
      -> getByTestId(~matcher=#Str("world"))
      -> expect
      -> toMatchSnapshot
    })
  })

  describe("ByLabelText", () => {
    describe("string matcher", () => {
      test("get works", () =>
        render(`<label>Hello, <input /></label>`)
        -> getByLabelText(~matcher=#Str("Hello,"))
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<label>Hello, <input /></label>`)
        -> getAllByLabelText(~matcher=#Str("Hello,"))
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<label>Hello, <input /></label>`)
        -> queryByLabelText(~matcher=#Str("Hello,"))
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<label>Hello, <input /></label>`)
        -> queryAllByLabelText(~matcher=#Str("Hello,"))
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () => {
        render(`<label>Hello, <input /></label>`)
        -> findByLabelText(~matcher=#Str("Hello,"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      })

      testPromise("findAll works", () =>
        render(`<label>Hello, <input /></label>`)
        -> findAllByLabelText(~matcher=#Str("Hello,"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })

    describe("regex matcher", () => {
      test("get works", () =>
        render(`<section aria-labelledby="section-one-header"><h3 id="section-one-header">Section One!</h3><p>some content</p></section>`)
        -> getByLabelText(~matcher=#RegExp(%re("/\\w!/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<section aria-labelledby="section-one-header"><h3 id="section-one-header">Section One!</h3><p>some content</p></section>`)
        -> getAllByLabelText(~matcher=#RegExp(%re("/\\w!/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<section aria-labelledby="section-one-header"><h3 id="section-one-header">Section One!</h3><p>some content</p></section>`)
        -> queryByLabelText(~matcher=#RegExp(%re("/\\w!/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<section aria-labelledby="section-one-header"><h3 id="section-one-header">Section One!</h3><p>some content</p></section>`)
        -> queryAllByLabelText(~matcher=#RegExp(%re("/\\w!/")), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<section aria-labelledby="section-one-header"><h3 id="section-one-header">Section One!</h3><p>some content</p></section>`)
        -> findByLabelText(~matcher=#RegExp(%re("/\\w!/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<section aria-labelledby="section-one-header"><h3 id="section-one-header">Section One!</h3><p>some content</p></section>`)
        -> findAllByLabelText(~matcher=#RegExp(%re("/\\w!/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })

    describe("function matcher", () => {
      test("get works", () =>
        render(`<p aria-label="message">World!</p>`)
        -> getByLabelText(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<p aria-label="message">World!</p>`)
        -> getAllByLabelText(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<p aria-label="message">World!</p>`)
        -> queryByLabelText(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<p aria-label="message">World!</p>`)
        -> queryAllByLabelText(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<p aria-label="message">World!</p>`)
        -> findByLabelText(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<p aria-label="message">World!</p>`)
        -> findAllByLabelText(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })
  })

  describe("ByPlaceholderText", () => {
    describe("string matcher", () => {
      test("get works", () =>
        render(`<input type="text" placeholder="Enter something" />`)
        -> getByPlaceholderText(~matcher=#Str("Enter something"))
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<input type="text" placeholder="Enter something" />`)
        -> getAllByPlaceholderText(~matcher=#Str("Enter something"))
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<input type="text" placeholder="Enter something" />`)
        -> queryByPlaceholderText(~matcher=#Str("Enter something"))
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<input type="text" placeholder="Enter something" />`)
        -> queryAllByPlaceholderText(~matcher=#Str("Enter something"))
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<input type="text" placeholder="Enter something" />`)
        -> findByPlaceholderText(~matcher=#Str("Enter something"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<input type="text" placeholder="Enter something" />`)
        -> findAllByPlaceholderText(~matcher=#Str("Enter something"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })

    describe("regex matcher", () => {
      test("get works", () =>
        render(`<input type="text" placeholder="Enter something" />`)
        -> getByPlaceholderText(~matcher=#RegExp(%re("/\\w+/")))
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<input type="text" placeholder="Enter something" />`)
        -> getAllByPlaceholderText(~matcher=#RegExp(%re("/\\w+/")))
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<input type="text" placeholder="Enter something" />`)
        -> queryByPlaceholderText(~matcher=#RegExp(%re("/\\w+/")))
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<input type="text" placeholder="Enter something" />`)
        -> queryAllByPlaceholderText(~matcher=#RegExp(%re("/\\w+/")))
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<input type="text" placeholder="Enter something" />`)
        -> findByPlaceholderText(~matcher=#RegExp(%re("/\\w+/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<input type="text" placeholder="Enter something" />`)
        -> findAllByPlaceholderText(~matcher=#RegExp(%re("/\\w+/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })

    describe("function matcher", () => {
      test("get works", () =>
        render(`<input type="text" name="my-input" placeholder="Enter something" />`)
        -> getByPlaceholderText(~matcher=#Func((_text, node) => node -> name === "my-input"))
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<input type="text" name="my-input" placeholder="Enter something" />`)
        -> getAllByPlaceholderText(~matcher=#Func((_text, node) => node -> name === "my-input"))
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<input type="text" name="my-input" placeholder="Enter something" />`)
        -> queryByPlaceholderText(~matcher=#Func((_text, node) => node -> name === "my-input"))
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<input type="text" name="my-input" placeholder="Enter something" />`)
        -> queryAllByPlaceholderText(~matcher=#Func((_text, node) => node -> name === "my-input"))
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<input type="text" name="my-input" placeholder="Enter something" />`)
        -> findByPlaceholderText(~matcher=#Func((_text, node) => node -> name === "my-input"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<input type="text" name="my-input" placeholder="Enter something" />`)
        -> findAllByPlaceholderText(~matcher=#Func((_text, node) => node -> name === "my-input"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })
  })

  describe("ByText", () => {
    describe("string matcher", () => {
      test("get works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> getByText(~matcher=#Str("Hello,"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> getAllByText(~matcher=#Str("Hello,"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> queryByText(~matcher=#Str("Hello,"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> queryAllByText(~matcher=#Str("Hello,"), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> findByText(~matcher=#Str("Hello,"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> findAllByText(~matcher=#Str("Hello,"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })

    describe("regex matcher", () => {
      test("get works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> getByText(~matcher=#RegExp(%re("/\\w!/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> getAllByText(~matcher=#RegExp(%re("/\\w!/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> queryByText(~matcher=#RegExp(%re("/\\w!/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> queryAllByText(~matcher=#RegExp(%re("/\\w!/")), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> findByText(~matcher=#RegExp(%re("/\\w!/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> findAllByText(~matcher=#RegExp(%re("/\\w!/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })

    describe("function matcher", () => {
      test("get works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> getByText(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> getAllByText(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> queryByText(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> queryAllByText(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> findByText(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> findAllByText(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })
  })

  describe("ByAltText", () => {
    describe("string matcher", () => {
      test("get works", () =>
        render(`<img src="" alt="Alt text" />`)
        -> getByAltText(~matcher=#Str("Alt text"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<img src="" alt="Alt text" />`)
        -> getAllByAltText(~matcher=#Str("Alt text"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<img src="" alt="Alt text" />`)
        -> queryByAltText(~matcher=#Str("Alt text"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<img src="" alt="Alt text" />`)
        -> queryAllByAltText(~matcher=#Str("Alt text"), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<img src="" alt="Alt text" />`)
        -> findByAltText(~matcher=#Str("Alt text"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<img src="" alt="Alt text" />`)
        -> findAllByAltText(~matcher=#Str("Alt text"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })

    describe("regex matcher", () => {
      test("get works", () =>
        render(`<img src="" alt="Alt text" />`)
        -> getByAltText(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<img src="" alt="Alt text" />`)
        -> getAllByAltText(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<img src="" alt="Alt text" />`)
        -> queryByAltText(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<img src="" alt="Alt text" />`)
        -> queryAllByAltText(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<img src="" alt="Alt text" />`)
        -> findByAltText(~matcher=#RegExp(%re("/\\w+/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<img src="" alt="Alt text" />`)
        -> findAllByAltText(~matcher=#RegExp(%re("/\\w+/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })

    describe("function matcher", () => {
      test("get works", () =>
        render(`<img name="my-img" src="" alt="Alt text" />`)
        -> getByAltText(~matcher=#Func((_text, node) => node -> name === "my-img"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<img name="my-img" src="" alt="Alt text" />`)
        -> getAllByAltText(~matcher=#Func((_text, node) => node -> name === "my-img"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<img name="my-img" src="" alt="Alt text" />`)
        -> queryByAltText(~matcher=#Func((_text, node) => node -> name === "my-img"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<img name="my-img" src="" alt="Alt text" />`)
        -> queryAllByAltText(~matcher=#Func((_text, node) => node -> name === "my-img"), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<img name="my-img" src="" alt="Alt text" />`)
        -> findByAltText(~matcher=#Func((_text, node) => node -> name === "my-img"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<img name="my-img" src="" alt="Alt text" />`)
        -> findAllByAltText(~matcher=#Func((_text, node) => node -> name === "my-img"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })
  })

  describe("ByTitle", () => {
    describe("string matcher", () => {
      test("get works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> getByTitle(~matcher=#Str("greeting"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> getAllByTitle(~matcher=#Str("greeting"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> queryByTitle(~matcher=#Str("greeting"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> queryAllByTitle(~matcher=#Str("greeting"), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> findByTitle(~matcher=#Str("greeting"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> findAllByTitle(~matcher=#Str("greeting"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })

    describe("regexp matcher", () => {
      test("get works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> getByTitle(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> getAllByTitle(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> queryByTitle(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> queryAllByTitle(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> findByTitle(~matcher=#RegExp(%re("/\\w+/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> findAllByTitle(~matcher=#RegExp(%re("/\\w+/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })

    describe("function matcher", () => {
      test("get works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> getByTitle(~matcher=#Func((_text, node) => node -> tagName === "B"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> getAllByTitle(~matcher=#Func((_text, node) => node -> tagName === "B"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> queryByTitle(~matcher=#Func((_text, node) => node -> tagName === "B"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> queryAllByTitle(~matcher=#Func((_text, node) => node -> tagName === "B"), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> findByTitle(~matcher=#Func((_text, node) => node -> tagName === "B"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<b title="greeting">Hello,</b>`)
        -> findAllByTitle(~matcher=#Func((_text, node) => node -> tagName === "B"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })
  })

  describe("ByDisplayValue", () => {
    describe("string matcher", () => {
      test("get works", () =>
        render(`<input type="text" value="Some value" />`)
        -> getByDisplayValue(~matcher=#Str("Some value"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<input type="text" value="Some value" />`)
        -> getAllByDisplayValue(~matcher=#Str("Some value"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<input type="text" value="Some value" />`)
        -> queryByDisplayValue(~matcher=#Str("Some value"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<input type="text" value="Some value" />`)
        -> queryAllByDisplayValue(~matcher=#Str("Some value"), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<input type="text" value="Some value" />`)
        -> findByDisplayValue(~matcher=#Str("Some value"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<input type="text" value="Some value" />`)
        -> findAllByDisplayValue(~matcher=#Str("Some value"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })

    describe("regex matcher", () => {
      test("get works", () =>
        render(`<input type="text" value="Some value" />`)
        -> getByDisplayValue(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<input type="text" value="Some value" />`)
        -> getAllByDisplayValue(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<input type="text" value="Some value" />`)
        -> queryByDisplayValue(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<input type="text" value="Some value" />`)
        -> queryAllByDisplayValue(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<input type="text" value="Some value" />`)
        -> findByDisplayValue(~matcher=#RegExp(%re("/\\w+/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<input type="text" value="Some value" />`)
        -> findAllByDisplayValue(~matcher=#RegExp(%re("/\\w+/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })
    describe("function matcher", () => {
      test("get works", () =>
        render(`<input name="my-input" type="text" value="Some value" />`)
        -> getByDisplayValue(~matcher=#Func((_text, node) => node -> name === "my-input"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<input name="my-input" type="text" value="Some value" />`)
        -> getAllByDisplayValue(~matcher=#Func((_text, node) => node -> name === "my-input"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<input name="my-input" type="text" value="Some value" />`)
        -> queryByDisplayValue(~matcher=#Func((_text, node) => node -> name === "my-input"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<input name="my-input" type="text" value="Some value" />`)
        -> queryAllByDisplayValue(~matcher=#Func((_text, node) => node -> name === "my-input"), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<input name="my-input" type="text" value="Some value" />`)
        -> findByDisplayValue(~matcher=#Func((_text, node) => node -> name === "my-input"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<input name="my-input" type="text" value="Some value" />`)
        -> findAllByDisplayValue(~matcher=#Func((_text, node) => node -> name === "my-input"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })
  })

  describe("ByRole", () => {
    describe("string matcher", () => {
      test("get works", () =>
        render(`<button>World!</button>`)
        -> getByRole(~matcher=#Str("button"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<button>World!</button>`)
        -> getAllByRole(~matcher=#Str("button"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<button>World!</button>`)
        -> queryByRole(~matcher=#Str("button"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<button>World!</button>`)
        -> queryAllByRole(~matcher=#Str("button"), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<button>World!</button>`)
        -> findByRole(~matcher=#Str("button"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<button>World!</button>`)
        -> findAllByRole(~matcher=#Str("button"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })
    describe("regex matcher", () => {
      test("get works", () =>
        render(`<button>World!</button>`)
        -> getByRole(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<button>World!</button>`)
        -> getAllByRole(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<button>World!</button>`)
        -> queryByRole(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<button>World!</button>`)
        -> queryAllByRole(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<button>World!</button>`)
        -> findByRole(~matcher=#RegExp(%re("/\\w+/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<button>World!</button>`)
        -> findAllByRole(~matcher=#RegExp(%re("/\\w+/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })
    describe("function matcher", () => {
      test("get works", () =>
        render(`<button>World!</button>`)
        -> getByRole(~matcher=#Func((_text, node) => node -> tagName === "BUTTON"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<button>World!</button>`)
        -> getAllByRole(~matcher=#Func((_text, node) => node -> tagName === "BUTTON"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<button>World!</button>`)
        -> queryByRole(~matcher=#Func((_text, node) => node -> tagName === "BUTTON"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<button>World!</button>`)
        -> queryAllByRole(~matcher=#Func((_text, node) => node -> tagName === "BUTTON"), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<button>World!</button>`)
        -> findByRole(~matcher=#Func((_text, node) => node -> tagName === "BUTTON"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<button>World!</button>`)
        -> findAllByRole(~matcher=#Func((_text, node) => node -> tagName === "BUTTON"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })
    test("level option works", () =>
      render(`<h3>World!</h3>`)
      -> getByRole(~matcher=#Str("heading"), ~options=ByRoleQuery.makeOptions(~level=3, ()), ())
      -> expect
      -> toMatchSnapshot
    )
  })

  describe("ByTestId", () => {
    describe("string matcher", () => {
      test("get works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> getByTestId(~matcher=#Str("world"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> getAllByTestId(~matcher=#Str("world"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> queryByTestId(~matcher=#Str("world"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> queryAllByTestId(~matcher=#Str("world"), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> findByTestId(~matcher=#Str("world"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> findAllByTestId(~matcher=#Str("world"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })
    describe("regex matcher", () => {
      test("get works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> getByTestId(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> getAllByTestId(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> queryByTestId(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> queryAllByTestId(~matcher=#RegExp(%re("/\\w+/")), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> findByTestId(~matcher=#RegExp(%re("/\\w+/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> findAllByTestId(~matcher=#RegExp(%re("/\\w+/")), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })
    describe("function matcher", () => {
      test("get works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> getByTestId(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("getAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> getAllByTestId(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("query works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> queryByTestId(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> expect
        -> toMatchSnapshot
      )

      test("queryAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> queryAllByTestId(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> expect
        -> toMatchSnapshot
      )

      testPromise("find works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> findByTestId(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )

      testPromise("findAll works", () =>
        render(`<p data-testid="world">World!</p>`)
        -> findAllByTestId(~matcher=#Func((_text, node) => node -> tagName === "P"), ())
        -> Promise.then(actual => actual -> expect -> toMatchSnapshot -> Promise.resolve)
      )
    })
  })

  test("getNodeText works", () =>
    render(`<b title="greeting">Hello,</b>`)
    -> getByTitle(~matcher=#Str("greeting"), ())
    -> getNodeText
    -> expect
    -> toMatchSnapshot
  )

  describe("waitFor", () => {
    testPromise("works", () => {
      let number = ref(10)
      let timeout = Js.Math.floor(Js.Math.random() *. 300.)
      let _ = setTimeout(() => number := 100, timeout)
      let callback = () => assert (number.contents == 100)

      waitFor(~callback, ()) -> Promise.then(_ => Promise.resolve(pass))
    })

    testPromise("supports container option", () => {
      let number = ref(0)
      let timeout = Js.Math.floor(Js.Math.random() *. 300.)
      let _ = setTimeout(() => number := 100, timeout)
      let callback = () => assert (number.contents == 10)
      let body = document -> Document.asHtmlDocument -> Belt.Option.flatMap(_, HtmlDocument.body)
      let options = WaitFor.makeOptions(~container=?body, ())

      waitFor(~callback, ~options, ()) -> Promise.catch(_ => Promise.resolve(pass))
    })

    testPromise("supports timeout option", () => {
      let number = ref(10)
      let _ = setTimeout(() => number := 100, 1000)
      let callback = () => assert (number.contents == 100)
      let options = WaitFor.makeOptions(~timeout=500, ())

      waitFor(~callback, ~options, ()) -> Promise.catch(_ => Promise.resolve(pass))
    })

    testPromise("supports interval option", () => {
      let number = ref(0)
      let callback = () => assert (number.contents == 10)
      let options = WaitFor.makeOptions(~interval=10, ~timeout=45, ())

      waitFor(~callback, ~options, ()) -> Promise.catch(_ => Promise.resolve(pass))
    })

    testPromise("supports mutationObserverOptions option", () => {
      let number = ref(0)
      let callback = () => assert (number.contents == 10)
      let options = WaitFor.makeOptions(
        ~mutationObserverOptions=DomTestingLibrary.MutationObserver.makeOptions(
          ~attributes=true,
          (),
        ),
        (),
      )

      waitFor(~callback, ~options, ()) -> Promise.catch(_ => Promise.resolve(pass))
    })
  })

  describe("waitForElementToBeRemoved", () =>
    testPromise("works", () => {
      let body = render(`<div data-testid="div"></div><div data-testid="div"></div>`)
      let callback = #Func(() => queryAllByTestId(body, ~matcher=#Str("div"), ()))
      let options = WaitFor.makeOptions(~timeout=1000, ())
      let divs = queryAllByTestId(body, ~matcher=#Str("div"), ())

      // first mutation
      let _ = setTimeout(
        () => Belt.Array.forEach(divs, div => div -> setAttribute("id", "mutated")),
        500,
      )

      // removal
      let _ = setTimeout(() =>
        Belt.Array.forEach(divs, div =>
          switch div->parentElement {
          | Some(parent) =>
            let _ = parent -> removeChild(div)
          | None => raise(Failure("No parent element found"))
          }
        )
      , 100)

      waitForElementToBeRemoved(~callback, ~options, ()) -> Promise.then(_ =>
        Promise.resolve(pass)
      )
    })
  )

  describe("waitForPromise", () =>
    testPromise("works", () => {
      let number = ref(10)
      let timeout = Js.Math.floor(Js.Math.random() *. 300.)
      let _ = setTimeout(() => number := 100, timeout)
      let callback = () => Promise.resolve(assert (number.contents == 100))

      waitForPromise(~callback, ()) -> Promise.then(_ => Promise.resolve(pass))
    })
  )

  describe("FireEvent", () => {
    test("click works", () => {
      let node = document -> Document.createElement("button")
      let spy = JestJs.inferred_fn()
      let fn = spy -> MockJs.fn
      let clickHandler = _ => fn(. "clicked!") -> ignore

      node -> Element.addEventListener("click", clickHandler)

      FireEvent.click(node, ())

      expect(spy -> MockJs.calls) -> toEqual(["clicked!"])
    })

    test("change works", () => {
      let node = document -> Document.createElement("input")
      let spy = JestJs.inferred_fn()
      let fn = spy -> MockJs.fn
      let changeHandler = _ => fn(. "changed!") -> ignore
      let eventInit = {
        "target": {
          "value": "1",
        },
      }

      node -> Element.addEventListener("change", changeHandler)

      FireEvent.change(node, ~eventInit, ())

      expect(spy -> MockJs.calls) -> toEqual(["changed!"])
    })
  })
})
