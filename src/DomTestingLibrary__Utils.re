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
