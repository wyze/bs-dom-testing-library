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
  module NameStr: {
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

  module NameRegExp: {
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

  module NameFunc: {
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
external getNodeText: Dom.element => string = "";

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
let getByDisplayValue: (string, Dom.element) => Dom.element;
let getAllByDisplayValue: (string, Dom.element) => Dom.element;
let queryByDisplayValue: (string, Dom.element) => Dom.element;
let queryAllByDisplayValue: (string, Dom.element) => Dom.element;
let findByDisplayValue: (string, Dom.element) => Js.Promise.t(Dom.element);
let findAllByDisplayValue:
  (string, Dom.element) => Js.Promise.t(array(Dom.element));

/**
 * ByRole
 */
let getByRole: (string, Dom.element) => Dom.element;
let getAllByRole: (string, Dom.element) => Dom.element;
let queryByRole: (string, Dom.element) => Dom.element;
let queryAllByRole: (string, Dom.element) => Dom.element;
let findByRole: (string, Dom.element) => Js.Promise.t(Dom.element);
let findAllByRole: (string, Dom.element) => Js.Promise.t(array(Dom.element));

/**
 * ByTestId
 */
let getByTestId: (string, Dom.element) => Dom.element;
let getAllByTestId: (string, Dom.element) => Dom.element;
let queryByTestId: (string, Dom.element) => Dom.element;
let queryAllByTestId: (string, Dom.element) => Dom.element;
let findByTestId: (string, Dom.element) => Js.Promise.t(Dom.element);
let findAllByTestId:
  (string, Dom.element) => Js.Promise.t(array(Dom.element));
