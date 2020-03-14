module FireEvent = DomTestingLibrary__FireEvent;

module Query: {
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

let getByLabelText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Query.options=?,
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
    ~options: Query.options=?,
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
    ~options: Query.options=?,
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
    ~options: Query.options=?,
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
    ~options: Query.options=?,
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
    ~options: Query.options=?,
    Dom.element
  ) =>
  Js.Promise.t(array(Dom.element));

let getByPlaceholderText: (string, Dom.element) => Dom.element;
let getAllByPlaceholderText: (string, Dom.element) => Dom.element;
let queryByPlaceholderText: (string, Dom.element) => Dom.element;
let queryAllByPlaceholderText: (string, Dom.element) => Dom.element;
let findByPlaceholderText: (string, Dom.element) => Js.Promise.t(Dom.element);
let findAllByPlaceholderText:
  (string, Dom.element) => Js.Promise.t(array(Dom.element));

let getByText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Query.options=?,
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
    ~options: Query.options=?,
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
    ~options: Query.options=?,
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
    ~options: Query.options=?,
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
    ~options: Query.options=?,
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
    ~options: Query.options=?,
    Dom.element
  ) =>
  Js.Promise.t(array(Dom.element));

let getByAltText: (string, Dom.element) => Dom.element;
let getAllByAltText: (string, Dom.element) => Dom.element;
let queryByAltText: (string, Dom.element) => Dom.element;
let queryAllByAltText: (string, Dom.element) => Dom.element;
let findByAltText: (string, Dom.element) => Js.Promise.t(Dom.element);
let findAllByAltText:
  (string, Dom.element) => Js.Promise.t(array(Dom.element));

let getByTitle: (string, Dom.element) => Dom.element;
let getAllByTitle: (string, Dom.element) => Dom.element;
let queryByTitle: (string, Dom.element) => Dom.element;
let queryAllByTitle: (string, Dom.element) => Dom.element;
let findByTitle: (string, Dom.element) => Js.Promise.t(Dom.element);
let findAllByTitle:
  (string, Dom.element) => Js.Promise.t(array(Dom.element));

let getByDisplayValue: (string, Dom.element) => Dom.element;
let getAllByDisplayValue: (string, Dom.element) => Dom.element;
let queryByDisplayValue: (string, Dom.element) => Dom.element;
let queryAllByDisplayValue: (string, Dom.element) => Dom.element;
let findByDisplayValue: (string, Dom.element) => Js.Promise.t(Dom.element);
let findAllByDisplayValue:
  (string, Dom.element) => Js.Promise.t(array(Dom.element));

let getByRole: (string, Dom.element) => Dom.element;
let getAllByRole: (string, Dom.element) => Dom.element;
let queryByRole: (string, Dom.element) => Dom.element;
let queryAllByRole: (string, Dom.element) => Dom.element;
let findByRole: (string, Dom.element) => Js.Promise.t(Dom.element);
let findAllByRole: (string, Dom.element) => Js.Promise.t(array(Dom.element));

let getByTestId: (string, Dom.element) => Dom.element;
let getAllByTestId: (string, Dom.element) => Dom.element;
let queryByTestId: (string, Dom.element) => Dom.element;
let queryAllByTestId: (string, Dom.element) => Dom.element;
let findByTestId: (string, Dom.element) => Js.Promise.t(Dom.element);
let findAllByTestId:
  (string, Dom.element) => Js.Promise.t(array(Dom.element));
