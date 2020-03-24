module ByLabelTextQuery = {
  type options = {
    .
    "selector": Js.undefined(string),
    "exact": Js.undefined(bool),
    "normalizer": Js.undefined(string => string),
  };

  [@bs.obj]
  external makeOptions:
    (
      ~selector: string=?,
      ~exact: bool=?,
      ~normalizer: string => string=?,
      unit
    ) =>
    options =
    "";
};
module ByPlaceholderTextQuery = {
  type options = {
    .
    "exact": Js.undefined(bool),
    "normalizer": Js.undefined(string => string),
  };

  [@bs.obj]
  external makeOptions:
    (~exact: bool=?, ~normalizer: string => string=?, unit) => options =
    "";
};
module ByTextQuery = {
  type options = {
    .
    "exact": Js.undefined(bool),
    "selector": Js.undefined(string),
    "ignore": Js.undefined(string),
    "normalizer": Js.undefined(string => string),
  };

  [@bs.obj]
  external makeOptions:
    (
      ~exact: bool=?,
      ~selector: string=?,
      ~ignore: string=?,
      ~normalizer: string => string=?,
      unit
    ) =>
    options =
    "";
};

[@bs.module "@testing-library/dom"]
external getNodeText: Dom.element => string = "";

/**
 * ByLabelText
 */
[@bs.module "@testing-library/dom"]
external _getByLabelText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByLabelTextQuery.options)
  ) =>
  Dom.element =
  "getByLabelText";

let getByLabelText = (~matcher, ~options=?, element) =>
  _getByLabelText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _getAllByLabelText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByLabelTextQuery.options)
  ) =>
  Dom.element =
  "getAllByLabelText";

let getAllByLabelText = (~matcher, ~options=?, element) =>
  _getAllByLabelText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _queryByLabelText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByLabelTextQuery.options)
  ) =>
  Dom.element =
  "queryByLabelText";

let queryByLabelText = (~matcher, ~options=?, element) =>
  _queryByLabelText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _queryAllByLabelText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByLabelTextQuery.options)
  ) =>
  Dom.element =
  "queryAllByLabelText";

let queryAllByLabelText = (~matcher, ~options=?, element) =>
  _queryAllByLabelText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _findByLabelText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByLabelTextQuery.options)
  ) =>
  Js.Promise.t(Dom.element) =
  "findByLabelText";

let findByLabelText = (~matcher, ~options=?, element) =>
  _findByLabelText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _findAllByLabelText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByLabelTextQuery.options)
  ) =>
  Js.Promise.t(array(Dom.element)) =
  "findAllByLabelText";

let findAllByLabelText = (~matcher, ~options=?, element) =>
  _findAllByLabelText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

/**
 * ByPlaceholderText
 */
[@bs.module "@testing-library/dom"]
external _getByPlaceholderText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByPlaceholderTextQuery.options)
  ) =>
  Dom.element =
  "getByPlaceholderText";

let getByPlaceholderText = (~matcher, ~options=?, element) =>
  _getByPlaceholderText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _getAllByPlaceholderText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByPlaceholderTextQuery.options)
  ) =>
  Dom.element =
  "getAllByPlaceholderText";

let getAllByPlaceholderText = (~matcher, ~options=?, element) =>
  _getAllByPlaceholderText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _queryByPlaceholderText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByPlaceholderTextQuery.options)
  ) =>
  Dom.element =
  "queryByPlaceholderText";

let queryByPlaceholderText = (~matcher, ~options=?, element) =>
  _queryByPlaceholderText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _queryAllByPlaceholderText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByPlaceholderTextQuery.options)
  ) =>
  Dom.element =
  "queryAllByPlaceholderText";

let queryAllByPlaceholderText = (~matcher, ~options=?, element) =>
  _queryAllByPlaceholderText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _findByPlaceholderText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByPlaceholderTextQuery.options)
  ) =>
  Js.Promise.t(Dom.element) =
  "findByPlaceholderText";

let findByPlaceholderText = (~matcher, ~options=?, element) =>
  _findByPlaceholderText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _findAllByPlaceholderText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByPlaceholderTextQuery.options)
  ) =>
  Js.Promise.t(array(Dom.element)) =
  "findAllByPlaceholderText";

let findAllByPlaceholderText = (~matcher, ~options=?, element) =>
  _findAllByPlaceholderText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

/**
 * ByText
 */
[@bs.module "@testing-library/dom"]
external _getByText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByTextQuery.options)
  ) =>
  Dom.element =
  "getByText";

let getByText = (~matcher, ~options=?, element) =>
  _getByText(element, ~matcher, ~options=Js.Undefined.fromOption(options));

[@bs.module "@testing-library/dom"]
external _getAllByText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByTextQuery.options)
  ) =>
  Dom.element =
  "getAllByText";

let getAllByText = (~matcher, ~options=?, element) =>
  _getAllByText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _queryByText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByTextQuery.options)
  ) =>
  Dom.element =
  "queryByText";

let queryByText = (~matcher, ~options=?, element) =>
  _queryByText(element, ~matcher, ~options=Js.Undefined.fromOption(options));

[@bs.module "@testing-library/dom"]
external _queryAllByText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByTextQuery.options)
  ) =>
  Dom.element =
  "queryAllByText";

let queryAllByText = (~matcher, ~options=?, element) =>
  _queryAllByText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _findByText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByTextQuery.options)
  ) =>
  Js.Promise.t(Dom.element) =
  "findByText";

let findByText = (~matcher, ~options=?, element) =>
  _findByText(element, ~matcher, ~options=Js.Undefined.fromOption(options));

[@bs.module "@testing-library/dom"]
external _findAllByText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByTextQuery.options)
  ) =>
  Js.Promise.t(array(Dom.element)) =
  "findAllByText";

let findAllByText = (~matcher, ~options=?, element) =>
  _findAllByText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

/**
 * ByAltText
 */
[@bs.module "@testing-library/dom"]
external _getByAltText: (Dom.element, string) => Dom.element = "getByAltText";

let getByAltText = (id, element) => _getByAltText(element, id);

[@bs.module "@testing-library/dom"]
external _getAllByAltText: (Dom.element, string) => Dom.element =
  "getAllByAltText";

let getAllByAltText = (id, element) => _getAllByAltText(element, id);

[@bs.module "@testing-library/dom"]
external _queryByAltText: (Dom.element, string) => Dom.element =
  "queryByAltText";

let queryByAltText = (id, element) => _queryByAltText(element, id);

[@bs.module "@testing-library/dom"]
external _queryAllByAltText: (Dom.element, string) => Dom.element =
  "queryAllByAltText";

let queryAllByAltText = (id, element) => _queryAllByAltText(element, id);

[@bs.module "@testing-library/dom"]
external _findByAltText: (Dom.element, string) => Js.Promise.t(Dom.element) =
  "findByAltText";

let findByAltText = (id, element) => _findByAltText(element, id);

[@bs.module "@testing-library/dom"]
external _findAllByAltText:
  (Dom.element, string) => Js.Promise.t(array(Dom.element)) =
  "findAllByAltText";

let findAllByAltText = (id, element) => _findAllByAltText(element, id);

/**
 * ByTitle
 */
[@bs.module "@testing-library/dom"]
external _getByTitle: (Dom.element, string) => Dom.element = "getByTitle";

let getByTitle = (id, element) => _getByTitle(element, id);

[@bs.module "@testing-library/dom"]
external _getAllByTitle: (Dom.element, string) => Dom.element =
  "getAllByTitle";

let getAllByTitle = (id, element) => _getAllByTitle(element, id);

[@bs.module "@testing-library/dom"]
external _queryByTitle: (Dom.element, string) => Dom.element = "queryByTitle";

let queryByTitle = (id, element) => _queryByTitle(element, id);

[@bs.module "@testing-library/dom"]
external _queryAllByTitle: (Dom.element, string) => Dom.element =
  "queryAllByTitle";

let queryAllByTitle = (id, element) => _queryAllByTitle(element, id);

[@bs.module "@testing-library/dom"]
external _findByTitle: (Dom.element, string) => Js.Promise.t(Dom.element) =
  "findByTitle";

let findByTitle = (id, element) => _findByTitle(element, id);

[@bs.module "@testing-library/dom"]
external _findAllByTitle:
  (Dom.element, string) => Js.Promise.t(array(Dom.element)) =
  "findAllByTitle";

let findAllByTitle = (id, element) => _findAllByTitle(element, id);

/**
 * ByDisplayValue
 */
[@bs.module "@testing-library/dom"]
external _getByDisplayValue: (Dom.element, string) => Dom.element =
  "getByDisplayValue";

let getByDisplayValue = (id, element) => _getByDisplayValue(element, id);

[@bs.module "@testing-library/dom"]
external _getAllByDisplayValue: (Dom.element, string) => Dom.element =
  "getAllByDisplayValue";

let getAllByDisplayValue = (id, element) =>
  _getAllByDisplayValue(element, id);

[@bs.module "@testing-library/dom"]
external _queryByDisplayValue: (Dom.element, string) => Dom.element =
  "queryByDisplayValue";

let queryByDisplayValue = (id, element) => _queryByDisplayValue(element, id);

[@bs.module "@testing-library/dom"]
external _queryAllByDisplayValue: (Dom.element, string) => Dom.element =
  "queryAllByDisplayValue";

let queryAllByDisplayValue = (id, element) =>
  _queryAllByDisplayValue(element, id);

[@bs.module "@testing-library/dom"]
external _findByDisplayValue:
  (Dom.element, string) => Js.Promise.t(Dom.element) =
  "findByDisplayValue";

let findByDisplayValue = (id, element) => _findByDisplayValue(element, id);

[@bs.module "@testing-library/dom"]
external _findAllByDisplayValue:
  (Dom.element, string) => Js.Promise.t(array(Dom.element)) =
  "findAllByDisplayValue";

let findAllByDisplayValue = (id, element) =>
  _findAllByDisplayValue(element, id);

/**
 * ByRole
 */
[@bs.module "@testing-library/dom"]
external _getByRole: (Dom.element, string) => Dom.element = "getByRole";

let getByRole = (id, element) => _getByRole(element, id);

[@bs.module "@testing-library/dom"]
external _getAllByRole: (Dom.element, string) => Dom.element = "getAllByRole";

let getAllByRole = (id, element) => _getAllByRole(element, id);

[@bs.module "@testing-library/dom"]
external _queryByRole: (Dom.element, string) => Dom.element = "queryByRole";

let queryByRole = (id, element) => _queryByRole(element, id);

[@bs.module "@testing-library/dom"]
external _queryAllByRole: (Dom.element, string) => Dom.element =
  "queryAllByRole";

let queryAllByRole = (id, element) => _queryAllByRole(element, id);

[@bs.module "@testing-library/dom"]
external _findByRole: (Dom.element, string) => Js.Promise.t(Dom.element) =
  "findByRole";

let findByRole = (id, element) => _findByRole(element, id);

[@bs.module "@testing-library/dom"]
external _findAllByRole:
  (Dom.element, string) => Js.Promise.t(array(Dom.element)) =
  "findAllByRole";

let findAllByRole = (id, element) => _findAllByRole(element, id);

/**
 * ByTestId
 */
[@bs.module "@testing-library/dom"]
external _getByTestId: (Dom.element, string) => Dom.element = "getByTestId";

let getByTestId = (id, element) => _getByTestId(element, id);

[@bs.module "@testing-library/dom"]
external _getAllByTestId: (Dom.element, string) => Dom.element =
  "getAllByTestId";

let getAllByTestId = (id, element) => _getAllByTestId(element, id);

[@bs.module "@testing-library/dom"]
external _queryByTestId: (Dom.element, string) => Dom.element =
  "queryByTestId";

let queryByTestId = (id, element) => _queryByTestId(element, id);

[@bs.module "@testing-library/dom"]
external _queryAllByTestId: (Dom.element, string) => Dom.element =
  "queryAllByTestId";

let queryAllByTestId = (id, element) => _queryAllByTestId(element, id);

[@bs.module "@testing-library/dom"]
external _findByTestId: (Dom.element, string) => Js.Promise.t(Dom.element) =
  "findByTestId";

let findByTestId = (id, element) => _findByTestId(element, id);

[@bs.module "@testing-library/dom"]
external _findAllByTestId:
  (Dom.element, string) => Js.Promise.t(array(Dom.element)) =
  "findAllByTestId";

let findAllByTestId = (id, element) => _findAllByTestId(element, id);
