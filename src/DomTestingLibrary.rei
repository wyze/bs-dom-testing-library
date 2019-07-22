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
module Wait: {
  type options = {
    .
    "interval": Js.undefined(int),
    "timeout": Js.undefined(int),
  };
  [@bs.obj]
  external makeOptions: (~interval: int=?, ~timeout: int=?, unit) => options =
    "";
};
module WaitForElement: {
  type mutationObserverOptions = {
    .
    "attributeFilter": Js.undefined(array(string)),
    "attributeOldValue": Js.undefined(bool),
    "attributes": Js.undefined(bool),
    "characterData": Js.undefined(bool),
    "characterDataOldValue": Js.undefined(bool),
    "subtree": Js.undefined(bool),
  };
  type options = {
    .
    "container": Js.undefined(Dom.element),
    "timeout": Js.undefined(int),
  };
  [@bs.obj]
  external makeOptions:
    (
      ~container: Dom.element=?,
      ~mutationObserverInit: mutationObserverOptions=?,
      ~timeout: int=?,
      unit
    ) =>
    options =
    "";
  [@bs.obj]
  external makeMutationObserverOptions:
    (
      ~attributeFilter: array(string)=?,
      ~attributeOldValue: bool=?,
      ~attributes: bool=?,
      ~characterData: bool=?,
      ~characterDataOldValue: bool=?,
      ~subtree: bool=?,
      unit
    ) =>
    mutationObserverOptions =
    "";
};

let wait:
  (~callback: unit => unit=?, ~options: Wait.options=?, unit) =>
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

let getByTestId: (string, Dom.element) => Dom.element;

let getByPlaceholderText: (string, Dom.element) => Dom.element;

let getByAltText: (string, Dom.element) => Dom.element;

let getByTitle: (string, Dom.element) => Dom.element;

let getByDisplayValue: (string, Dom.element) => Dom.element;

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
