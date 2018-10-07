module FireEvent = DomTestingLibrary__FireEvent;

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
  external makeOptions :
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

module Wait = {
  type options = {
    .
    "interval": Js.undefined(int),
    "timeout": Js.undefined(int),
  };

  [@bs.obj]
  external makeOptions : (~interval: int=?, ~timeout: int=?, unit) => options =
    "";
};

module WaitForElement = {
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
  external makeOptions :
    (
      ~container: Dom.element=?,
      ~mutationObserverInit: mutationObserverOptions=?,
      ~timeout: int=?,
      unit
    ) =>
    options =
    "";

  [@bs.obj]
  external makeMutationObserverOptions :
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

[@bs.module "dom-testing-library"]
external _wait :
  (Js.undefined(unit => unit), Js.undefined(Wait.options)) =>
  Js.Promise.t('a) =
  "wait";

let wait = (~callback=?, ~options=?, ()) =>
  _wait(
    Js.Undefined.fromOption(callback),
    Js.Undefined.fromOption(options),
  );

[@bs.module "dom-testing-library"]
external _waitForElement :
  (Js.undefined(unit => 'a), Js.undefined(WaitForElement.options)) =>
  Js.Promise.t('a) =
  "waitForElement";

let waitForElement = (~callback=?, ~options=?, ()) =>
  _waitForElement(
    Js.Undefined.fromOption(callback),
    Js.Undefined.fromOption(options),
  );

[@bs.module "dom-testing-library"]
external _prettyDOM : (Dom.element, Js.undefined(int)) => string =
  "prettyDOM";

let prettyDOM = (~maxLength=?, element) =>
  _prettyDOM(element, Js.Undefined.fromOption(maxLength));

[@bs.module "dom-testing-library"]
external getNodeText : Dom.element => string = "";

[@bs.module "dom-testing-library"]
external _getByTestId :
 (
   Dom.element,
   string
 ) =>
 Dom.element =
 "getByTestId";

let getByTestId = (id, element) => _getByTestId(element, id);

[@bs.module "dom-testing-library"]
external _getByTitle :
 (
   Dom.element,
   string
 ) =>
 Dom.element =
 "getByTitle";

let getByTitle = (id, element) => _getByTitle(element, id);

[@bs.module "dom-testing-library"]
external _getByPlaceholderText :
 (
   Dom.element,
   string
 ) =>
 Dom.element =
 "getByPlaceholderText";

let getByPlaceholderText = (id, element) => _getByPlaceholderText(element, id);

[@bs.module "dom-testing-library"]
external _getByAltText :
 (
   Dom.element,
   string
 ) =>
 Dom.element =
 "getByAltText";

let getByAltText = (id, element) => _getByAltText(element, id);

[@bs.module "dom-testing-library"]
external _getByValue :
 (
   Dom.element,
   string
 ) =>
 Dom.element =
 "getByValue";

let getByValue = (id, element) => _getByValue(element, id);

[@bs.module "dom-testing-library"]
external _getByText :
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
