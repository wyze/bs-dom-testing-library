open Jest;

type parser;

[@bs.new]
external domParser : unit => parser = "DOMParser";

[@bs.send.pipe : parser]
external parseFromString : ( string, [@bs.as "text/html"] _) => Dom.element = "";

[@bs.get]
external body : Dom.element => Dom.element = "";

[@bs.get]
external firstChild : Dom.element => Dom.element = "";

[@bs.get]
external tagName : Dom.element => string = "";

[@bs.val]
external setTimeout : (unit => unit, int) => float = "setTimeout";

describe("DomTestingLibrary", () => {
  open DomTestingLibrary;
  open Expect;

  let div = domParser()
    |> parseFromString({j|
        <div>
          <b title="greeting">Hello,</b>
          <p data-testid="world"> World!</p>
          <input type="text" placeholder="Enter something" />
          <input type="text" value="Some value" />
          <img src="" alt="Alt text" />
        </div>
      |j})
    |> body
    |> firstChild;

  describe("prettyDOM", () => {
    test("works", () => {
      let actual = div |> prettyDOM;

      expect(actual) |> toMatchSnapshot;
    });

    test("works with maxLength", () => {
      let actual = div |> prettyDOM(~maxLength=25);

      expect(actual) |> toMatchSnapshot;
    });
  });

  test("getNodeText works", () => {
    let actual = div |> getByTitle("greeting") |> getNodeText;

    expect(actual) |> toMatchSnapshot;
  });

  test("getByTestId works", () => {
    let actual = div |> getByTestId("world");

    expect(actual) |> toMatchSnapshot;
  });

  test("getByPlaceholderText works", () => {
    let actual = div |> getByPlaceholderText("Enter something");

    expect(actual) |> toMatchSnapshot;
  });

  test("getByAltText works", () => {
    let actual = div |> getByAltText("Alt text");

    expect(actual) |> toMatchSnapshot;
  });

  test("getByTitle works", () => {
    let actual = div |> getByTitle("greeting");

    expect(actual) |> toMatchSnapshot;
  });

  test("getByValue works", () => {
    let actual = div |> getByValue("Some value");

    expect(actual) |> toMatchSnapshot;
  });

  describe("getByText", () => {
    test("works with string matcher", () => {
      let actual = div |> getByText(~matcher=`Str("Hello,"));

      expect(actual) |> toMatchSnapshot;
    });

    test("works with regex matcher", () => {
      let actual = div |> getByText(~matcher=`RegExp([%bs.re "/\\w!/"]));

      expect(actual) |> toMatchSnapshot;
    });

    test("works with function matcher", () => {
      let matcher = ( _text, node ) => (node |> tagName) === "P";
      let actual = div |> getByText(~matcher=`Func(matcher));

      expect(actual) |> toMatchSnapshot;
    });
  });

  describe("wait", () => {
    testPromise("works", () => {
      let number = ref(10);
      let timeout = Js.Math.floor(Js.Math.random() *. 300.);
      let _ = setTimeout(() => { number := 100 }, timeout);
      let callback = () => assert(number^ == 100);

      wait(~callback, ())
        |> Js.Promise.then_(_ => Js.Promise.resolve(pass));
    });

    testPromise("supports timeout option", () => {
      let number = ref(10);
      let _ = setTimeout(() => { number := 100 }, 1000);
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
});
