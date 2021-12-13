module FireEvent = DomTestingLibrary__FireEvent

module ByLabelTextQuery: {
  type options = {
    "selector": Js.undefined<string>,
    "exact": Js.undefined<bool>,
    "normalizer": Js.undefined<string => string>,
  }
  @obj
  external makeOptions: (
    ~selector: string=?,
    ~exact: bool=?,
    ~normalizer: string => string=?,
    unit,
  ) => options = ""
}
module ByPlaceholderTextQuery: {
  type options = {"exact": Js.undefined<bool>, "normalizer": Js.undefined<string => string>}
  @obj
  external makeOptions: (~exact: bool=?, ~normalizer: string => string=?, unit) => options = ""
}
module ByTextQuery: {
  type options = {
    "exact": Js.undefined<bool>,
    "selector": Js.undefined<string>,
    "ignore": Js.undefined<string>,
    "normalizer": Js.undefined<string => string>,
  }
  @obj external makeOptions: (
    ~exact: bool=?,
    ~selector: string=?,
    ~ignore: string=?,
    ~normalizer: string => string=?,
    unit,
  ) => options = ""
}
module ByAltTextQuery: {
  type options = {"exact": Js.undefined<bool>, "normalizer": Js.undefined<string => string>}
  @obj external makeOptions: (~exact: bool=?, ~normalizer: string => string=?, unit) => options = ""
}
module ByTitleQuery: {
  type options = {"exact": Js.undefined<bool>, "normalizer": Js.undefined<string => string>}
  @obj external makeOptions: (~exact: bool=?, ~normalizer: string => string=?, unit) => options = ""
}
module ByDisplayValueQuery: {
  type options = {"exact": Js.undefined<bool>, "normalizer": Js.undefined<string => string>}
  @obj external makeOptions: (~exact: bool=?, ~normalizer: string => string=?, unit) => options = ""
}
module ByRoleQuery: {
  type options = {
    "checked": Js.undefined<bool>,
    "collapseWhitespace": Js.undefined<bool>,
    "exact": Js.undefined<bool>,
    "hidden": Js.undefined<bool>,
    "level": Js.undefined<int>,
    "pressed": Js.undefined<bool>,
    "name": Js.undefined<string>,
    "normalizer": Js.undefined<string => string>,
    "queryFallbacks": Js.undefined<bool>,
    "selected": Js.undefined<bool>,
    "trim": Js.undefined<bool>,
  }
  @obj external makeOptions: (
    ~checked: bool=?,
    ~collapseWhitespace: bool=?,
    ~exact: bool=?,
    ~hidden: bool=?,
    ~level: int=?,
    ~pressed: bool=?,
    ~name: string=?,
    ~normalizer: string => string=?,
    ~queryFallbacks: bool=?,
    ~selected: bool=?,
    ~trim: bool=?,
    unit,
  ) => options = ""
}
module ByTestIdQuery: {
  type options = {"exact": Js.undefined<bool>, "normalizer": Js.undefined<string => string>}
  @obj external makeOptions: (~exact: bool=?, ~normalizer: string => string=?, unit) => options = ""
}
module MutationObserver: {
  type options = {
    "attributeFilter": Js.undefined<array<string>>,
    "attributeOldValue": Js.undefined<bool>,
    "attributes": Js.undefined<bool>,
    "characterData": Js.undefined<bool>,
    "characterDataOldValue": Js.undefined<bool>,
    "childList": Js.undefined<bool>,
    "subtree": Js.undefined<bool>,
  }
  @obj external makeOptions: (
    ~attributeFilter: array<string>=?,
    ~attributeOldValue: bool=?,
    ~attributes: bool=?,
    ~characterData: bool=?,
    ~characterDataOldValue: bool=?,
    ~childList: bool=?,
    ~subtree: bool=?,
    unit,
  ) => options = ""
}
module WaitFor: {
  type options = {
    "container": Js.undefined<Dom.element>,
    "interval": Js.undefined<int>,
    "mutationObserverOptions": Js.undefined<MutationObserver.options>,
    "onTimeout": Js.undefined<Js.Exn.t => Js.Exn.t>,
    "showOriginalStackTrace": Js.undefined<bool>,
    "stackTraceError": Js.undefined<Js.Exn.t>,
    "timeout": Js.undefined<int>,
  }
  @obj external makeOptions: (
    ~container: Dom.element=?,
    ~interval: int=?,
    ~mutationObserverOptions: MutationObserver.options=?,
    ~onTimeout: Js.Exn.t => Js.Exn.t=?,
    ~showOriginalStackTrace: bool=?,
    ~stackTraceError: Js.Exn.t=?,
    ~timeout: int=?,
    unit,
  ) => options = ""
}
module WaitForElement: {
  type options = {"container": Js.undefined<Dom.element>, "timeout": Js.undefined<int>}
  @obj external makeOptions: (
    ~container: Dom.element=?,
    ~mutationObserverInit: MutationObserver.options=?,
    ~timeout: int=?,
    unit,
  ) => options = ""
}

let waitFor: (~callback: unit => unit, ~options: WaitFor.options=?, unit) => Js.Promise.t<'a>

let waitForPromise: (
  ~callback: unit => Js.Promise.t<'a>,
  ~options: WaitFor.options=?,
  unit,
) => Js.Promise.t<'b>

let waitForElement: (
  ~callback: unit => 'a=?,
  ~options: WaitForElement.options=?,
  unit,
) => Js.Promise.t<'a>

let waitForElementToBeRemoved: (
  ~callback: [#Func(unit => 'a) | #Value('a)],
  ~options: WaitFor.options=?,
  unit,
) => Js.Promise.t<unit>

let prettyDOM: (Dom.element, ~maxLength: int=?, ()) => string

let logDOM: (Dom.element, ~maxLength: int=?, ()) => unit

module Configure: {
  type options = {
    "_disableExpensiveErrorDiagnostics": Js.undefined<bool>,
    "asyncUtilTimeout": Js.undefined<int>,
    "asyncWrapper": Js.undefined<unit => unit>,
    "computedStyleSupportsPseudoElements": Js.undefined<bool>,
    "defaultHidden": Js.undefined<bool>,
    "eventWrapper": Js.undefined<unit => unit>,
    "getElementError": Js.undefined<(string, Dom.element) => Js.Exn.t>,
    "showOriginalStackTrace": Js.undefined<bool>,
    "testIdAttribute": Js.undefined<string>,
    "throwSuggestions": Js.undefined<bool>,
  }
  @obj external makeOptions: (
    ~_disableExpensiveErrorDiagnostics: bool=?,
    ~asyncUtilTimeout: int=?,
    ~asyncWrapper: unit => unit=?,
    ~computedStyleSupportsPseudoElements: bool=?,
    ~defaultHidden: bool=?,
    ~eventWrapper: unit => unit=?,
    ~getElementError: (string, Dom.element) => Js.Exn.t=?,
    ~showOriginalStackTrace: bool=?,
    ~testIdAttribute: string=?,
    ~throwSuggestions: bool=?,
    unit,
  ) => options = ""
}

let configure: (
  ~update: [
    | #Func(Configure.options => Configure.options)
    | #Object(Configure.options)
  ],
) => unit

@module("@testing-library/dom")
external getNodeText: Dom.element => string = "getNodeText"

@ocaml.doc("
 * ByLabelText
 ")
let getByLabelText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByLabelTextQuery.options=?,
  ()) => Dom.element

let getAllByLabelText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByLabelTextQuery.options=?,
  ()) => array<Dom.element>

let queryByLabelText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByLabelTextQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByLabelText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByLabelTextQuery.options=?,
  ()) => array<Dom.element>

let findByLabelText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByLabelTextQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByLabelText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByLabelTextQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

@ocaml.doc("
 * ByPlaceholderText
 ")
let getByPlaceholderText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByPlaceholderTextQuery.options=?,
  ()) => Dom.element

let getAllByPlaceholderText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByPlaceholderTextQuery.options=?,
  ()) => array<Dom.element>

let queryByPlaceholderText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByPlaceholderTextQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByPlaceholderText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByPlaceholderTextQuery.options=?,
  ()) => array<Dom.element>

let findByPlaceholderText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByPlaceholderTextQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByPlaceholderText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByPlaceholderTextQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

@ocaml.doc("
 * ByText
 ")
let getByText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTextQuery.options=?,
  ()) => Dom.element

let getAllByText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTextQuery.options=?,
  ()) => array<Dom.element>

let queryByText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTextQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTextQuery.options=?,
  ()) => array<Dom.element>

let findByText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTextQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTextQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

@ocaml.doc("
 * ByAltText
 ")
let getByAltText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByAltTextQuery.options=?,
  ()) => Dom.element

let getAllByAltText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByAltTextQuery.options=?,
  ()) => array<Dom.element>

let queryByAltText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByAltTextQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByAltText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByAltTextQuery.options=?,
  ()) => array<Dom.element>

let findByAltText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByAltTextQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByAltText: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByAltTextQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

@ocaml.doc("
 * ByTitle
 ")
let getByTitle: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTitleQuery.options=?,
  ()) => Dom.element

let getAllByTitle: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTitleQuery.options=?,
  ()) => array<Dom.element>

let queryByTitle: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTitleQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByTitle: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTitleQuery.options=?,
  ()) => array<Dom.element>

let findByTitle: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTitleQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByTitle: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTitleQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

@ocaml.doc("
 * ByDisplayValue
 ")
let getByDisplayValue: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByDisplayValueQuery.options=?,
  ()) => Dom.element

let getAllByDisplayValue: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByDisplayValueQuery.options=?,
  ()) => array<Dom.element>

let queryByDisplayValue: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByDisplayValueQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByDisplayValue: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByDisplayValueQuery.options=?,
  ()) => array<Dom.element>

let findByDisplayValue: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByDisplayValueQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByDisplayValue: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByDisplayValueQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

@ocaml.doc("
 * ByRole
 ")
let getByRole: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByRoleQuery.options=?,
  ()) => Dom.element

let getAllByRole: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByRoleQuery.options=?,
  ()) => array<Dom.element>

let queryByRole: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByRoleQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByRole: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByRoleQuery.options=?,
  ()) => array<Dom.element>

let findByRole: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByRoleQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByRole: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByRoleQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

@ocaml.doc("
 * ByTestId
 ")
let getByTestId: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTestIdQuery.options=?,
  ()) => Dom.element

let getAllByTestId: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTestIdQuery.options=?,
  ()) => array<Dom.element>

let queryByTestId: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTestIdQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByTestId: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTestIdQuery.options=?,
  ()) => array<Dom.element>

let findByTestId: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTestIdQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByTestId: (
  Dom.element,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: ByTestIdQuery.options=?,
  ()) => Promise.t<array<Dom.element>>
