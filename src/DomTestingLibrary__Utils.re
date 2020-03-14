module MutationObserver = {
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

module WaitFor = {
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

module WaitForElement = {
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

[@bs.module "@testing-library/dom"]
external _waitFor:
  (Js.undefined(unit => unit), Js.undefined(WaitFor.options)) =>
  Js.Promise.t('a) =
  "waitFor";

let waitFor = (~callback=?, ~options=?, ()) =>
  _waitFor(
    Js.Undefined.fromOption(callback),
    Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _waitForElement:
  (Js.undefined(unit => 'a), Js.undefined(WaitForElement.options)) =>
  Js.Promise.t('a) =
  "waitForElement";

let waitForElement = (~callback=?, ~options=?, ()) =>
  _waitForElement(
    Js.Undefined.fromOption(callback),
    Js.Undefined.fromOption(options),
  );

[@bs.module "@testing-library/dom"]
external _prettyDOM: (Dom.element, Js.undefined(int)) => string = "prettyDOM";

let prettyDOM = (~maxLength=?, element) =>
  _prettyDOM(element, Js.Undefined.fromOption(maxLength));

type configureOptions = {. "testIdAttribute": Js.undefined(string)};

[@bs.module "@testing-library/dom"]
external configureWithFn: (Js.t({..}) => Js.t({..})) => unit = "configure";

[@bs.module "@testing-library/dom"]
external configureWithObject: configureOptions => unit = "configure";

let configure =
    (
      ~update: [
         | `Func(configureOptions => configureOptions)
         | `Object(configureOptions)
       ],
    ) => {
  switch (update) {
  | `Func(fn) => configureWithFn(fn)
  | `Object(obj) => configureWithObject(obj)
  };
};
