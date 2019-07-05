module Query = {
  type options = {
    .
    "collapseWhitespace": Js.undefined(bool),
    "exact": Js.undefined(bool),
    "selector": Js.undefined(string),
    "trim": Js.undefined(bool),
    "ignore": Js.undefined(string),
  };

  [@bs.obj]
  external makeOptions:
    (
      ~collapseWhitespace: bool=?,
      ~exact: bool=?,
      ~selector: string=?,
      ~trim: bool=?,
      ~ignore: string=?,
      unit
    ) =>
    options =
    "";
};

[@bs.module "@testing-library/dom"]
external getNodeText: Dom.element => string = "";

[@bs.module "@testing-library/dom"]
external _getByTestId: (Dom.element, string) => Dom.element = "getByTestId";

let getByTestId = (id, element) => _getByTestId(element, id);

[@bs.module "@testing-library/dom"]
external _getByTitle: (Dom.element, string) => Dom.element = "getByTitle";

let getByTitle = (id, element) => _getByTitle(element, id);

[@bs.module "@testing-library/dom"]
external _getByPlaceholderText: (Dom.element, string) => Dom.element =
  "getByPlaceholderText";

let getByPlaceholderText = (id, element) =>
  _getByPlaceholderText(element, id);

[@bs.module "@testing-library/dom"]
external _getByAltText: (Dom.element, string) => Dom.element = "getByAltText";

let getByAltText = (id, element) => _getByAltText(element, id);

[@bs.module "@testing-library/dom"]
external _getByDisplayValue: (Dom.element, string) => Dom.element = "getByDisplayValue";

let getByDisplayValue = (id, element) => _getByDisplayValue(element, id);

[@bs.module "@testing-library/dom"]
external _getByText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(Query.options)
  ) =>
  Dom.element =
  "getByText";

let getByText = (~matcher, ~options=?, element) =>
  _getByText(element, ~matcher, ~options=Js.Undefined.fromOption(options));

[@bs.module "@testing-library/dom"]
external _getByLabelText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(Query.options)
  ) =>
  Dom.element =
  "getByLabelText";

let getByLabelText = (~matcher, ~options=?, element) =>
  _getByLabelText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );
