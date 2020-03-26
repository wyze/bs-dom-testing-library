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
module ByAltTextQuery = {
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
module ByTitleQuery = {
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
module ByDisplayValueQuery = {
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
module ByRoleQuery = {
  module NameStr = {
    type options = {
      .
      "exact": Js.undefined(bool),
      "hidden": Js.undefined(bool),
      "name": Js.undefined(string),
      "normalizer": Js.undefined(string => string),
    };

    [@bs.obj]
    external makeOptions:
      (
        ~exact: bool=?,
        ~hidden: bool=?,
        ~name: string=?,
        ~normalizer: string => string=?,
        unit
      ) =>
      options =
      "";
  };

  module NameRegExp = {
    type options = {
      .
      "exact": Js.undefined(bool),
      "hidden": Js.undefined(bool),
      "name": Js.undefined(Js.Re.t),
      "normalizer": Js.undefined(string => string),
    };

    [@bs.obj]
    external makeOptions:
      (
        ~exact: bool=?,
        ~hidden: bool=?,
        ~name: Js.Re.t=?,
        ~normalizer: string => string=?,
        unit
      ) =>
      options =
      "";
  };
  module NameFunc = {
    type options = {
      .
      "exact": Js.undefined(bool),
      "hidden": Js.undefined(bool),
      "name": Js.undefined((string, Dom.element) => bool),
      "normalizer": Js.undefined(string => string),
    };

    [@bs.obj]
    external makeOptions:
      (
        ~exact: bool=?,
        ~hidden: bool=?,
        ~name: (string, Dom.element) => bool=?,
        ~normalizer: string => string=?,
        unit
      ) =>
      options =
      "";
  };
};
module ByTestIdQuery = {
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
external _getByAltText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Js.undefined(ByAltTextQuery.options)
  ) =>
  Dom.element =
  "getByAltText";

let getByAltText = (~matcher, ~options=?, element) =>
  _getByAltText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _getAllByAltText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Js.undefined(ByAltTextQuery.options)
  ) =>
  Dom.element =
  "getAllByAltText";

let getAllByAltText = (~matcher, ~options=?, element) =>
  _getAllByAltText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _queryByAltText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Js.undefined(ByAltTextQuery.options)
  ) =>
  Dom.element =
  "queryByAltText";

let queryByAltText = (~matcher, ~options=?, element) =>
  _queryByAltText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _queryAllByAltText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Js.undefined(ByAltTextQuery.options)
  ) =>
  Dom.element =
  "queryAllByAltText";

let queryAllByAltText = (~matcher, ~options=?, element) =>
  _queryAllByAltText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _findByAltText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Js.undefined(ByAltTextQuery.options)
  ) =>
  Js.Promise.t(Dom.element) =
  "findByAltText";

let findByAltText = (~matcher, ~options=?, element) =>
  _findByAltText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _findAllByAltText:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Js.undefined(ByAltTextQuery.options)
  ) =>
  Js.Promise.t(array(Dom.element)) =
  "findAllByAltText";

let findAllByAltText = (~matcher, ~options=?, element) =>
  _findAllByAltText(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

/**
 * ByTitle
 */
[@bs.module "@testing-library/dom"]
external _getByTitle:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Js.undefined(ByTitleQuery.options)
  ) =>
  Dom.element =
  "getByTitle";

let getByTitle = (~matcher, ~options=?, element) =>
  _getByTitle(element, ~matcher, ~options=Js.Undefined.fromOption(options));

[@bs.module "@testing-library/dom"]
external _getAllByTitle:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Js.undefined(ByTitleQuery.options)
  ) =>
  Dom.element =
  "getAllByTitle";

let getAllByTitle = (~matcher, ~options=?, element) =>
  _getAllByTitle(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _queryByTitle:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Js.undefined(ByTitleQuery.options)
  ) =>
  Dom.element =
  "queryByTitle";

let queryByTitle = (~matcher, ~options=?, element) =>
  _queryByTitle(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _queryAllByTitle:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Js.undefined(ByTitleQuery.options)
  ) =>
  Dom.element =
  "queryAllByTitle";

let queryAllByTitle = (~matcher, ~options=?, element) =>
  _queryAllByTitle(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _findByTitle:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Js.undefined(ByTitleQuery.options)
  ) =>
  Js.Promise.t(Dom.element) =
  "findByTitle";

let findByTitle = (~matcher, ~options=?, element) =>
  _findByTitle(element, ~matcher, ~options=Js.Undefined.fromOption(options));

[@bs.module "@testing-library/dom"]
external _findAllByTitle:
  (
    Dom.element,
    ~matcher: [@bs.unwrap] [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Js.undefined(ByTitleQuery.options)
  ) =>
  Js.Promise.t(array(Dom.element)) =
  "findAllByTitle";

let findAllByTitle = (~matcher, ~options=?, element) =>
  _findAllByTitle(
    element,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

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
