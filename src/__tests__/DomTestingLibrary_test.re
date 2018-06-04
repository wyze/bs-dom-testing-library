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
    |> parseFromString("<div><b>Hello,</b><p> World!</p></div>")
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

  test("getNodeTest works", () => {
    let actual = div |> firstChild |> getNodeText;

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
