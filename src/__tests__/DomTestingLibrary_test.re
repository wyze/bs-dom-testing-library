open Js.Promise;
open Jest;
open Webapi.Dom;
open Webapi.Dom.Element;

[@bs.get] external tagName: Dom.element => string = "";

[@bs.val] external setTimeout: (unit => unit, int) => float = "setTimeout";

let render = html => {
  let body = Document.createElement("body", document);

  body->setInnerHTML(html);

  document->Document.unsafeAsHtmlDocument->HtmlDocument.setBody(body);

  body;
};

afterEach(() =>
  switch (document->Document.unsafeAsHtmlDocument->HtmlDocument.body) {
  | Some(body) => body->setInnerHTML("")
  | None => raise(Failure("Not document body found"))
  }
);

describe("DomTestingLibrary", () => {
  open DomTestingLibrary;
  open Expect;

  describe("prettyDOM", () => {
    let html = {|<b title="greeting">Hello,</b><p data-testid="world"> World!</p><input type="text" placeholder="Enter something" /><input type="text" value="Some value" /><img src="" alt="Alt text" />|};

    test("works", () =>
      render(html) |> prettyDOM |> expect |> toMatchSnapshot
    );

    test("works with maxLength", () =>
      render(html) |> prettyDOM(~maxLength=60) |> expect |> toMatchSnapshot
    );
  });

  describe("configure works", () => {
    test("using an object", () => {
      configure(
        ~update=
          `Object({
            "testIdAttribute": Js.Undefined.return("data-custom-test-id"),
          }),
      );
      render({|<p data-custom-test-id="world"> World!</p>|})
      |> getByTestId("world")
      |> expect
      |> toMatchSnapshot;
    });

    test("using a function", () => {
      configure(
        ~update=
          `Func(
            _ =>
              {
                "testIdAttribute": Js.Undefined.return("data-custom-test-id"),
              },
          ),
      );
      render({|<p data-custom-test-id="world"> World!</p>|})
      |> getByTestId("world")
      |> expect
      |> toMatchSnapshot;
    });
  });

  describe("ByLabelText", () => {
    describe("string matcher", () => {
      test("get works", () =>
        render({|<label>Hello, <input /></label>|})
        |> getByLabelText(~matcher=`Str("Hello,"))
        |> expect
        |> toMatchSnapshot
      );

      test("getAll works", () =>
        render({|<label>Hello, <input /></label>|})
        |> getAllByLabelText(~matcher=`Str("Hello,"))
        |> expect
        |> toMatchSnapshot
      );

      test("query works", () =>
        render({|<label>Hello, <input /></label>|})
        |> queryByLabelText(~matcher=`Str("Hello,"))
        |> expect
        |> toMatchSnapshot
      );

      test("queryAll works", () =>
        render({|<label>Hello, <input /></label>|})
        |> queryAllByLabelText(~matcher=`Str("Hello,"))
        |> expect
        |> toMatchSnapshot
      );

      testPromise("find works", () =>
        render({|<label>Hello, <input /></label>|})
        |> findByLabelText(~matcher=`Str("Hello,"))
        |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
      );

      testPromise("findAll works", () =>
        render({|<label>Hello, <input /></label>|})
        |> findAllByLabelText(~matcher=`Str("Hello,"))
        |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
      );
    });

    describe("regex matcher", () => {
      test("get works", () =>
        render(
          {|<section aria-labelledby="section-one-header"><h3 id="section-one-header">Section One!</h3><p>some content</p></section>|},
        )
        |> getByLabelText(~matcher=`RegExp([%bs.re "/\\w!/"]))
        |> expect
        |> toMatchSnapshot
      );

      test("getAll works", () =>
        render(
          {|<section aria-labelledby="section-one-header"><h3 id="section-one-header">Section One!</h3><p>some content</p></section>|},
        )
        |> getAllByLabelText(~matcher=`RegExp([%bs.re "/\\w!/"]))
        |> expect
        |> toMatchSnapshot
      );

      test("query works", () =>
        render(
          {|<section aria-labelledby="section-one-header"><h3 id="section-one-header">Section One!</h3><p>some content</p></section>|},
        )
        |> queryByLabelText(~matcher=`RegExp([%bs.re "/\\w!/"]))
        |> expect
        |> toMatchSnapshot
      );

      test("queryAll works", () =>
        render(
          {|<section aria-labelledby="section-one-header"><h3 id="section-one-header">Section One!</h3><p>some content</p></section>|},
        )
        |> queryAllByLabelText(~matcher=`RegExp([%bs.re "/\\w!/"]))
        |> expect
        |> toMatchSnapshot
      );

      testPromise("find works", () =>
        render(
          {|<section aria-labelledby="section-one-header"><h3 id="section-one-header">Section One!</h3><p>some content</p></section>|},
        )
        |> findByLabelText(~matcher=`RegExp([%bs.re "/\\w!/"]))
        |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
      );

      testPromise("findAll works", () =>
        render(
          {|<section aria-labelledby="section-one-header"><h3 id="section-one-header">Section One!</h3><p>some content</p></section>|},
        )
        |> findAllByLabelText(~matcher=`RegExp([%bs.re "/\\w!/"]))
        |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
      );
    });

    describe("function matcher", () => {
      test("get works", () =>
        render({|<p aria-label="message">World!</p>|})
        |> getByLabelText(
             ~matcher=`Func((_text, node) => node |> tagName === "P"),
           )
        |> expect
        |> toMatchSnapshot
      );

      test("getAll works", () =>
        render({|<p aria-label="message">World!</p>|})
        |> getAllByLabelText(
             ~matcher=`Func((_text, node) => node |> tagName === "P"),
           )
        |> expect
        |> toMatchSnapshot
      );

      test("query works", () =>
        render({|<p aria-label="message">World!</p>|})
        |> queryByLabelText(
             ~matcher=`Func((_text, node) => node |> tagName === "P"),
           )
        |> expect
        |> toMatchSnapshot
      );

      test("queryAll works", () =>
        render({|<p aria-label="message">World!</p>|})
        |> queryAllByLabelText(
             ~matcher=`Func((_text, node) => node |> tagName === "P"),
           )
        |> expect
        |> toMatchSnapshot
      );

      testPromise("find works", () =>
        render({|<p aria-label="message">World!</p>|})
        |> findByLabelText(
             ~matcher=`Func((_text, node) => node |> tagName === "P"),
           )
        |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
      );

      testPromise("findAll works", () =>
        render({|<p aria-label="message">World!</p>|})
        |> findAllByLabelText(
             ~matcher=`Func((_text, node) => node |> tagName === "P"),
           )
        |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
      );
    });
  });

  describe("ByPlaceholderText", () => {
    test("get works", () =>
      render({|<input type="text" placeholder="Enter something" />|})
      |> getByPlaceholderText("Enter something")
      |> expect
      |> toMatchSnapshot
    );

    test("getAll works", () =>
      render({|<input type="text" placeholder="Enter something" />|})
      |> getAllByPlaceholderText("Enter something")
      |> expect
      |> toMatchSnapshot
    );

    test("query works", () =>
      render({|<input type="text" placeholder="Enter something" />|})
      |> queryByPlaceholderText("Enter something")
      |> expect
      |> toMatchSnapshot
    );

    test("queryAll works", () =>
      render({|<input type="text" placeholder="Enter something" />|})
      |> queryAllByPlaceholderText("Enter something")
      |> expect
      |> toMatchSnapshot
    );

    testPromise("find works", () =>
      render({|<input type="text" placeholder="Enter something" />|})
      |> findByPlaceholderText("Enter something")
      |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
    );

    testPromise("findAll works", () =>
      render({|<input type="text" placeholder="Enter something" />|})
      |> findAllByPlaceholderText("Enter something")
      |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
    );
  });

  describe("ByText", () => {
    describe("string matcher", () => {
      test("get works", () =>
        render({|<b title="greeting">Hello,</b>|})
        |> getByText(~matcher=`Str("Hello,"))
        |> expect
        |> toMatchSnapshot
      );

      test("getAll works", () =>
        render({|<b title="greeting">Hello,</b>|})
        |> getAllByText(~matcher=`Str("Hello,"))
        |> expect
        |> toMatchSnapshot
      );

      test("query works", () =>
        render({|<b title="greeting">Hello,</b>|})
        |> queryByText(~matcher=`Str("Hello,"))
        |> expect
        |> toMatchSnapshot
      );

      test("queryAll works", () =>
        render({|<b title="greeting">Hello,</b>|})
        |> queryAllByText(~matcher=`Str("Hello,"))
        |> expect
        |> toMatchSnapshot
      );

      testPromise("find works", () =>
        render({|<b title="greeting">Hello,</b>|})
        |> findByText(~matcher=`Str("Hello,"))
        |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
      );

      testPromise("findAll works", () =>
        render({|<b title="greeting">Hello,</b>|})
        |> findAllByText(~matcher=`Str("Hello,"))
        |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
      );
    });

    describe("regex matcher", () => {
      test("get works", () =>
        render({|<p data-testid="world">World!</p>|})
        |> getByText(~matcher=`RegExp([%bs.re "/\\w!/"]))
        |> expect
        |> toMatchSnapshot
      );

      test("getAll works", () =>
        render({|<p data-testid="world">World!</p>|})
        |> getAllByText(~matcher=`RegExp([%bs.re "/\\w!/"]))
        |> expect
        |> toMatchSnapshot
      );

      test("query works", () =>
        render({|<p data-testid="world">World!</p>|})
        |> queryByText(~matcher=`RegExp([%bs.re "/\\w!/"]))
        |> expect
        |> toMatchSnapshot
      );

      test("queryAll works", () =>
        render({|<p data-testid="world">World!</p>|})
        |> queryAllByText(~matcher=`RegExp([%bs.re "/\\w!/"]))
        |> expect
        |> toMatchSnapshot
      );

      testPromise("find works", () =>
        render({|<p data-testid="world">World!</p>|})
        |> findByText(~matcher=`RegExp([%bs.re "/\\w!/"]))
        |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
      );

      testPromise("findAll works", () =>
        render({|<p data-testid="world">World!</p>|})
        |> findAllByText(~matcher=`RegExp([%bs.re "/\\w!/"]))
        |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
      );
    });

    describe("function matcher", () => {
      test("get works", () =>
        render({|<p data-testid="world">World!</p>|})
        |> getByText(
             ~matcher=`Func((_text, node) => node |> tagName === "P"),
           )
        |> expect
        |> toMatchSnapshot
      );

      test("getAll works", () =>
        render({|<p data-testid="world">World!</p>|})
        |> getAllByText(
             ~matcher=`Func((_text, node) => node |> tagName === "P"),
           )
        |> expect
        |> toMatchSnapshot
      );

      test("query works", () =>
        render({|<p data-testid="world">World!</p>|})
        |> queryByText(
             ~matcher=`Func((_text, node) => node |> tagName === "P"),
           )
        |> expect
        |> toMatchSnapshot
      );

      test("queryAll works", () =>
        render({|<p data-testid="world">World!</p>|})
        |> queryAllByText(
             ~matcher=`Func((_text, node) => node |> tagName === "P"),
           )
        |> expect
        |> toMatchSnapshot
      );

      testPromise("find works", () =>
        render({|<p data-testid="world">World!</p>|})
        |> findByText(
             ~matcher=`Func((_text, node) => node |> tagName === "P"),
           )
        |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
      );

      testPromise("findAll works", () =>
        render({|<p data-testid="world">World!</p>|})
        |> findAllByText(
             ~matcher=`Func((_text, node) => node |> tagName === "P"),
           )
        |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
      );
    });
  });

  describe("ByAltText", () => {
    test("get works", () =>
      render({|<img src="" alt="Alt text" />|})
      |> getByAltText("Alt text")
      |> expect
      |> toMatchSnapshot
    );

    test("getAll works", () =>
      render({|<img src="" alt="Alt text" />|})
      |> getAllByAltText("Alt text")
      |> expect
      |> toMatchSnapshot
    );

    test("query works", () =>
      render({|<img src="" alt="Alt text" />|})
      |> queryByAltText("Alt text")
      |> expect
      |> toMatchSnapshot
    );

    test("queryAll works", () =>
      render({|<img src="" alt="Alt text" />|})
      |> queryAllByAltText("Alt text")
      |> expect
      |> toMatchSnapshot
    );

    testPromise("find works", () =>
      render({|<img src="" alt="Alt text" />|})
      |> findByAltText("Alt text")
      |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
    );

    testPromise("findAll works", () =>
      render({|<img src="" alt="Alt text" />|})
      |> findAllByAltText("Alt text")
      |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
    );
  });

  describe("ByTitle", () => {
    test("get works", () =>
      render({|<b title="greeting">Hello,</b>|})
      |> getByTitle("greeting")
      |> expect
      |> toMatchSnapshot
    );

    test("getAll works", () =>
      render({|<b title="greeting">Hello,</b>|})
      |> getAllByTitle("greeting")
      |> expect
      |> toMatchSnapshot
    );

    test("query works", () =>
      render({|<b title="greeting">Hello,</b>|})
      |> queryByTitle("greeting")
      |> expect
      |> toMatchSnapshot
    );

    test("queryAll works", () =>
      render({|<b title="greeting">Hello,</b>|})
      |> queryAllByTitle("greeting")
      |> expect
      |> toMatchSnapshot
    );

    testPromise("find works", () =>
      render({|<b title="greeting">Hello,</b>|})
      |> findByTitle("greeting")
      |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
    );

    testPromise("findAll works", () =>
      render({|<b title="greeting">Hello,</b>|})
      |> findAllByTitle("greeting")
      |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
    );
  });

  describe("ByDisplayValue", () => {
    test("get works", () =>
      render({|<input type="text" value="Some value" />|})
      |> getByDisplayValue("Some value")
      |> expect
      |> toMatchSnapshot
    );

    test("getAll works", () =>
      render({|<input type="text" value="Some value" />|})
      |> getAllByDisplayValue("Some value")
      |> expect
      |> toMatchSnapshot
    );

    test("query works", () =>
      render({|<input type="text" value="Some value" />|})
      |> queryByDisplayValue("Some value")
      |> expect
      |> toMatchSnapshot
    );

    test("queryAll works", () =>
      render({|<input type="text" value="Some value" />|})
      |> queryAllByDisplayValue("Some value")
      |> expect
      |> toMatchSnapshot
    );

    testPromise("find works", () =>
      render({|<input type="text" value="Some value" />|})
      |> findByDisplayValue("Some value")
      |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
    );

    testPromise("findAll works", () =>
      render({|<input type="text" value="Some value" />|})
      |> findAllByDisplayValue("Some value")
      |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
    );
  });

  describe("ByRole", () => {
    test("get works", () =>
      render({|<button>World!</button>|})
      |> getByRole("button")
      |> expect
      |> toMatchSnapshot
    );

    test("getAll works", () =>
      render({|<button>World!</button>|})
      |> getAllByRole("button")
      |> expect
      |> toMatchSnapshot
    );

    test("query works", () =>
      render({|<button>World!</button>|})
      |> queryByRole("button")
      |> expect
      |> toMatchSnapshot
    );

    test("queryAll works", () =>
      render({|<button>World!</button>|})
      |> queryAllByRole("button")
      |> expect
      |> toMatchSnapshot
    );

    testPromise("find works", () =>
      render({|<button>World!</button>|})
      |> findByRole("button")
      |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
    );

    testPromise("findAll works", () =>
      render({|<button>World!</button>|})
      |> findAllByRole("button")
      |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
    );
  });

  describe("ByTestId", () => {
    test("get works", () =>
      render({|<p data-testid="world">World!</p>|})
      |> getByTestId("world")
      |> expect
      |> toMatchSnapshot
    );

    test("getAll works", () =>
      render({|<p data-testid="world">World!</p>|})
      |> getAllByTestId("world")
      |> expect
      |> toMatchSnapshot
    );

    test("query works", () =>
      render({|<p data-testid="world">World!</p>|})
      |> queryByTestId("world")
      |> expect
      |> toMatchSnapshot
    );

    test("queryAll works", () =>
      render({|<p data-testid="world">World!</p>|})
      |> queryAllByTestId("world")
      |> expect
      |> toMatchSnapshot
    );

    testPromise("find works", () =>
      render({|<p data-testid="world">World!</p>|})
      |> findByTestId("world")
      |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
    );

    testPromise("findAll works", () =>
      render({|<p data-testid="world">World!</p>|})
      |> findAllByTestId("world")
      |> then_(actual => actual |> expect |> toMatchSnapshot |> resolve)
    );
  });

  test("getNodeText works", () =>
    render({|<b title="greeting">Hello,</b>|})
    |> getByTitle("greeting")
    |> getNodeText
    |> expect
    |> toMatchSnapshot
  );

  describe("waitFor", () => {
    testPromise("works", () => {
      let number = ref(10);
      let timeout = Js.Math.floor(Js.Math.random() *. 300.);
      let _ = setTimeout(() => number := 100, timeout);
      let callback = () => assert(number^ == 100);

      waitFor(~callback, ())
      |> Js.Promise.then_(_ => Js.Promise.resolve(pass));
    });

    testPromise("supports container option", () => {
      let number = ref(0);
      let timeout = Js.Math.floor(Js.Math.random() *. 300.);
      let _ = setTimeout(() => number := 100, timeout);
      let callback = () => assert(number^ == 10);
      let body =
        document
        |> Document.asHtmlDocument
        |> Belt.Option.flatMap(_, HtmlDocument.body);
      let options = WaitFor.makeOptions(~container=?body, ());

      waitFor(~callback, ~options, ())
      |> Js.Promise.catch(_ => Js.Promise.resolve(pass));
    });

    testPromise("supports timeout option", () => {
      let number = ref(10);
      let _ = setTimeout(() => number := 100, 1000);
      let callback = () => assert(number^ == 100);
      let options = WaitFor.makeOptions(~timeout=500, ());

      waitFor(~callback, ~options, ())
      |> Js.Promise.catch(_ => Js.Promise.resolve(pass));
    });

    testPromise("supports interval option", () => {
      let number = ref(0);
      let callback = () => assert(number^ == 10);
      let options = WaitFor.makeOptions(~interval=10, ~timeout=45, ());

      waitFor(~callback, ~options, ())
      |> Js.Promise.catch(_ => Js.Promise.resolve(pass));
    });

    testPromise("supports mutationObserverOptions option", () => {
      let number = ref(0);
      let callback = () => assert(number^ == 10);
      let options =
        WaitFor.makeOptions(
          ~mutationObserverOptions=
            DomTestingLibrary.MutationObserver.makeOptions(),
          (),
        );

      waitFor(~callback, ~options, ())
      |> Js.Promise.catch(_ => Js.Promise.resolve(pass));
    });
  });

  describe("FireEvent", () => {
    test("click works", () => {
      let node = document |> Document.createElement("button");
      let spy = JestJs.inferred_fn();
      let fn = spy |> MockJs.fn;
      let clickHandler = _ => fn(. "clicked!") |> ignore;

      node |> Element.addEventListener("click", clickHandler);

      FireEvent.click(node);

      expect(spy |> MockJs.calls) |> toEqual([|"clicked!"|]);
    });

    test("change works", () => {
      let node = document |> Document.createElement("input");
      let spy = JestJs.inferred_fn();
      let fn = spy |> MockJs.fn;
      let changeHandler = _ => fn(. "changed!") |> ignore;
      let eventInit = {
        "target": {
          "value": "1",
        },
      };

      node |> Element.addEventListener("change", changeHandler);

      FireEvent.change(~eventInit, node);

      expect(spy |> MockJs.calls) |> toEqual([|"changed!"|]);
    });
  });
});
