module FireEvent = DomTestingLibrary__FireEvent;

module ByLabelTextQuery: {
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
module ByPlaceholderTextQuery: {
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
module ByTextQuery: {
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
module ByAltTextQuery: {
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
module ByTitleQuery: {
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
module ByDisplayValueQuery: {
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
module ByRoleQuery: {
  type options = {
    .
    "exact": Js.undefined(bool),
    "hidden": Js.undefined(bool),
    // TODO: add supports for TextMatch
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
module ByTestIdQuery: {
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
module MutationObserver: {
  type options = {
    .
    "attributeFilter": Js.undefined(array(string)),
    "attributeOldValue": Js.undefined(bool),
    "attributes": Js.undefined(bool),
    "characterData": Js.undefined(bool),
    "characterDataOldValue": Js.undefined(bool),
    "subtree": Js.undefined(bool),
  };
  [@bs.obj]
  external makeOptions:
    (
      ~attributeFilter: array(string)=?,
      ~attributeOldValue: bool=?,
      ~attributes: bool=?,
      ~characterData: bool=?,
      ~characterDataOldValue: bool=?,
      ~subtree: bool=?,
      unit
    ) =>
    options =
    "";
};
module WaitFor: {
  type options = {
    .
    "container": Js.undefined(Dom.element),
    "interval": Js.undefined(int),
    "timeout": Js.undefined(int),
    "mutationObserverOptions": Js.undefined(MutationObserver.options),
  };
  [@bs.obj]
  external makeOptions:
    (
      ~container: Dom.element=?,
      ~interval: int=?,
      ~timeout: int=?,
      ~mutationObserverOptions: MutationObserver.options=?,
      unit
    ) =>
    options =
    "";
};
module WaitForElement: {
  type options = {
    .
    "container": Js.undefined(Dom.element),
    "timeout": Js.undefined(int),
  };
  [@bs.obj]
  external makeOptions:
    (
      ~container: Dom.element=?,
      ~mutationObserverInit: MutationObserver.options=?,
      ~timeout: int=?,
      unit
    ) =>
    options =
    "";
};

let waitFor:
  (~callback: unit => unit=?, ~options: WaitFor.options=?, unit) =>
  Js.Promise.t('a);

let waitForElement:
  (~callback: unit => 'a=?, ~options: WaitForElement.options=?, unit) =>
  Js.Promise.t('a);

let prettyDOM: (~maxLength: int=?, Dom.element) => string;

type configureOptions = {. "testIdAttribute": Js.undefined(string)};

let configure:
  (
    ~update: [
               | `Func(configureOptions => configureOptions)
               | `Object(configureOptions)
             ]
  ) =>
  unit;

[@bs.module "@testing-library/dom"]
external getNodeText: Dom.element => string = "getNodeText";

/**
 * ByLabelText
 */
let getByLabelText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByLabelTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let getAllByLabelText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByLabelTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryByLabelText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByLabelTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryAllByLabelText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByLabelTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let findByLabelText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByLabelTextQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(Dom.element);

let findAllByLabelText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByLabelTextQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(array(Dom.element));

/**
 * ByPlaceholderText
 */
let getByPlaceholderText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByPlaceholderTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let getAllByPlaceholderText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByPlaceholderTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryByPlaceholderText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByPlaceholderTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryAllByPlaceholderText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByPlaceholderTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let findByPlaceholderText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByPlaceholderTextQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(Dom.element);

let findAllByPlaceholderText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByPlaceholderTextQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(array(Dom.element));

/**
 * ByText
 */
let getByText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let getAllByText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryByText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryAllByText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let findByText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTextQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(Dom.element);

let findAllByText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTextQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(array(Dom.element));

/**
 * ByAltText
 */
let getByAltText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByAltTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let getAllByAltText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByAltTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryByAltText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByAltTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryAllByAltText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByAltTextQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let findByAltText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByAltTextQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(Dom.element);

let findAllByAltText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByAltTextQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(array(Dom.element));

/**
 * ByTitle
 */
let getByTitle:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTitleQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let getAllByTitle:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTitleQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryByTitle:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTitleQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryAllByTitle:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTitleQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let findByTitle:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTitleQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(Dom.element);

let findAllByTitle:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTitleQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(array(Dom.element));

/**
 * ByDisplayValue
 */
let getByDisplayValue:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByDisplayValueQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let getAllByDisplayValue:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByDisplayValueQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryByDisplayValue:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByDisplayValueQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryAllByDisplayValue:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByDisplayValueQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let findByDisplayValue:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByDisplayValueQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(Dom.element);

let findAllByDisplayValue:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByDisplayValueQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(array(Dom.element));

/**
 * ByRole
 */
let getByRole:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByRoleQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let getAllByRole:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByRoleQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryByRole:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByRoleQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryAllByRole:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByRoleQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let findByRole:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByRoleQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(Dom.element);

let findAllByRole:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByRoleQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(array(Dom.element));

/**
 * ByTestId
 */
let getByTestId:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTestIdQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let getAllByTestId:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTestIdQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryByTestId:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTestIdQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let queryAllByTestId:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTestIdQuery.options=?,
    Dom.element
  ) =>
  Dom.element;

let findByTestId:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTestIdQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(Dom.element);

let findAllByTestId:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: ByTestIdQuery.options=?,
    Dom.element
  ) =>
  Js.Promise.t(array(Dom.element));
