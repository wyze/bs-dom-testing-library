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

  test("getNodeText works", () =>
    render({|<b title="greeting">Hello,</b>|})
    |> getByTitle("greeting")
    |> getNodeText
    |> expect
    |> toMatchSnapshot
  );

  test("getByTestId works", () =>
    render({|<p data-testid="world"> World!</p>|})
    |> getByTestId("world")
    |> expect
    |> toMatchSnapshot
  );

  test("getByTestId works with a custom test ID", () => {
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

  test("getByPlaceholderText works", () =>
    render({|<input type="text" placeholder="Enter something" />|})
    |> getByPlaceholderText("Enter something")
    |> expect
    |> toMatchSnapshot
  );

  test("getByAltText works", () =>
    render({|<img src="" alt="Alt text" />|})
    |> getByAltText("Alt text")
    |> expect
    |> toMatchSnapshot
  );

  test("getByTitle works", () =>
    render({|<b title="greeting">Hello,</b>|})
    |> getByTitle("greeting")
    |> expect
    |> toMatchSnapshot
  );

  test("getByDisplayValue works", () =>
    render({|<input type="text" value="Some value" />|})
    |> getByDisplayValue("Some value")
    |> expect
    |> toMatchSnapshot
  );

  describe("getByText", () => {
    test("works with string matcher", () =>
      render({|<b title="greeting">Hello,</b>|})
      |> getByText(~matcher=`Str("Hello,"))
      |> expect
      |> toMatchSnapshot
    );

    test("works with regex matcher", () =>
      render({|<p data-testid="world"> World!</p>|})
      |> getByText(~matcher=`RegExp([%bs.re "/\\w!/"]))
      |> expect
      |> toMatchSnapshot
    );

    test("works with function matcher", () =>
      render({|<p data-testid="world"> World!</p>|})
      |> getByText(
           ~matcher=`Func((_text, node) => node |> tagName === "P"),
         )
      |> expect
      |> toMatchSnapshot
    );
  });

  describe("getByLabelText", () => {
    test("works with string matcher", () =>
      render({|<label>Hello, <input /></label>|})
      |> getByLabelText(~matcher=`Str("Hello,"))
      |> expect
      |> toMatchSnapshot
    );

    test("works with regex matcher", () =>
      render(
        {|<section aria-labelledby="section-one-header"><h3 id="section-one-header">Section One!</h3><p>some content</p></section>|},
      )
      |> getByLabelText(~matcher=`RegExp([%bs.re "/\\w!/"]))
      |> expect
      |> toMatchSnapshot
    );

    test("works with function matcher", () =>
      render({|<p aria-label="message"> World!</p>|})
      |> getByLabelText(
           ~matcher=`Func((_text, node) => node |> tagName === "P"),
         )
      |> expect
      |> toMatchSnapshot
    );
  });

  describe("wait", () => {
    testPromise("works", () => {
      let number = ref(10);
      let timeout = Js.Math.floor(Js.Math.random() *. 300.);
      let _ = setTimeout(() => number := 100, timeout);
      let callback = () => assert(number^ == 100);

      wait(~callback, ()) |> Js.Promise.then_(_ => Js.Promise.resolve(pass));
    });

    testPromise("supports timeout option", () => {
      let number = ref(10);
      let _ = setTimeout(() => number := 100, 1000);
      let callback = () => assert(number^ == 100);
      let options = Wait.makeOptions(~timeout=500, ());

      wait(~callback, ~options, ())
      |> Js.Promise.catch(_ => Js.Promise.resolve(pass));
    });

    testPromise("supports interval option", () => {
      let number = ref(0);
      let callback = () => assert(number^ == 10);
      let options = Wait.makeOptions(~interval=10, ~timeout=45, ());

      wait(~callback, ~options, ())
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
