module ByLabelTextQuery = {
  type options = {
    "selector": Js.undefined<string>,
    "exact": Js.undefined<bool>,
    "normalizer": Js.undefined<string => string>,
  }

  @obj external makeOptions: (
    ~selector: string=?,
    ~exact: bool=?,
    ~normalizer: string => string=?,
    unit,
  ) => options = ""
}
module ByPlaceholderTextQuery = {
  type options = {"exact": Js.undefined<bool>, "normalizer": Js.undefined<string => string>}

  @obj external makeOptions: (~exact: bool=?, ~normalizer: string => string=?, unit) => options = ""
}
module ByTextQuery = {
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
module ByAltTextQuery = {
  type options = {"exact": Js.undefined<bool>, "normalizer": Js.undefined<string => string>}

  @obj external makeOptions: (~exact: bool=?, ~normalizer: string => string=?, unit) => options = ""
}
module ByTitleQuery = {
  type options = {"exact": Js.undefined<bool>, "normalizer": Js.undefined<string => string>}

  @obj  external makeOptions: (~exact: bool=?, ~normalizer: string => string=?, unit) => options = ""
}
module ByDisplayValueQuery = {
  type options = {"exact": Js.undefined<bool>, "normalizer": Js.undefined<string => string>}

  @obj external makeOptions: (~exact: bool=?, ~normalizer: string => string=?, unit) => options = ""
}
module ByRoleQuery = {
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
module ByTestIdQuery = {
  type options = {"exact": Js.undefined<bool>, "normalizer": Js.undefined<string => string>}

  @obj external makeOptions: (~exact: bool=?, ~normalizer: string => string=?, unit) => options = ""
}

@module("@testing-library/dom")
external getNodeText: Dom.element => string = "getNodeText"

@ocaml.doc("
 * ByLabelText
 ")
@module("@testing-library/dom")
external _getByLabelText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByLabelTextQuery.options>,
) => Dom.element = "getByLabelText"

let getByLabelText = (element, ~matcher, ~options=?, ()) =>
  _getByLabelText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _getAllByLabelText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByLabelTextQuery.options>,
) => array<Dom.element> = "getAllByLabelText"

let getAllByLabelText = (element, ~matcher, ~options=?, ()) =>
  _getAllByLabelText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryByLabelText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByLabelTextQuery.options>,
) => Js.null<Dom.element> = "queryByLabelText"

let queryByLabelText = (element, ~matcher, ~options=?, ()) =>
  _queryByLabelText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryAllByLabelText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByLabelTextQuery.options>,
) => array<Dom.element> = "queryAllByLabelText"

let queryAllByLabelText = (element, ~matcher, ~options=?, ()) =>
  _queryAllByLabelText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findByLabelText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByLabelTextQuery.options>,
) => Promise.t<Dom.element> = "findByLabelText"

let findByLabelText = (element, ~matcher, ~options=?, ()) =>
  _findByLabelText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findAllByLabelText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByLabelTextQuery.options>,
) => Promise.t<array<Dom.element>> = "findAllByLabelText"

let findAllByLabelText = (element, ~matcher, ~options=?, ()) =>
  _findAllByLabelText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@ocaml.doc("
 * ByPlaceholderText
 ")
@module("@testing-library/dom")
external _getByPlaceholderText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByPlaceholderTextQuery.options>,
) => Dom.element = "getByPlaceholderText"

let getByPlaceholderText = (element, ~matcher, ~options=?, ()) =>
  _getByPlaceholderText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _getAllByPlaceholderText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByPlaceholderTextQuery.options>,
) => array<Dom.element> = "getAllByPlaceholderText"

let getAllByPlaceholderText = (element, ~matcher, ~options=?, ()) =>
  _getAllByPlaceholderText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryByPlaceholderText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByPlaceholderTextQuery.options>,
) => Js.null<Dom.element> = "queryByPlaceholderText"

let queryByPlaceholderText = (element, ~matcher, ~options=?, ()) =>
  _queryByPlaceholderText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryAllByPlaceholderText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByPlaceholderTextQuery.options>,
) => array<Dom.element> = "queryAllByPlaceholderText"

let queryAllByPlaceholderText = (element, ~matcher, ~options=?, ()) =>
  _queryAllByPlaceholderText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findByPlaceholderText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByPlaceholderTextQuery.options>,
) => Promise.t<Dom.element> = "findByPlaceholderText"

let findByPlaceholderText = (element, ~matcher, ~options=?, ()) =>
  _findByPlaceholderText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findAllByPlaceholderText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByPlaceholderTextQuery.options>,
) => Promise.t<array<Dom.element>> = "findAllByPlaceholderText"

let findAllByPlaceholderText = (element, ~matcher, ~options=?, ()) =>
  _findAllByPlaceholderText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@ocaml.doc("
 * ByText
 ")
@module("@testing-library/dom")
external _getByText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTextQuery.options>,
) => Dom.element = "getByText"

let getByText = (element, ~matcher, ~options=?, ()) =>
  _getByText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _getAllByText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTextQuery.options>,
) => array<Dom.element> = "getAllByText"

let getAllByText = (element, ~matcher, ~options=?, ()) =>
  _getAllByText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryByText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTextQuery.options>,
) => Js.null<Dom.element> = "queryByText"

let queryByText = (element, ~matcher, ~options=?, ()) =>
  _queryByText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryAllByText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTextQuery.options>,
) => array<Dom.element> = "queryAllByText"

let queryAllByText = (element, ~matcher, ~options=?, ()) =>
  _queryAllByText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findByText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTextQuery.options>,
) => Promise.t<Dom.element> = "findByText"

let findByText = (element, ~matcher, ~options=?, ()) =>
  _findByText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findAllByText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTextQuery.options>,
) => Promise.t<array<Dom.element>> = "findAllByText"

let findAllByText = (element, ~matcher, ~options=?, ()) =>
  _findAllByText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@ocaml.doc("
 * ByAltText
 ")
@module("@testing-library/dom")
external _getByAltText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByAltTextQuery.options>,
) => Dom.element = "getByAltText"

let getByAltText = (element, ~matcher, ~options=?, ()) =>
  _getByAltText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _getAllByAltText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByAltTextQuery.options>,
) => array<Dom.element> = "getAllByAltText"

let getAllByAltText = (element, ~matcher, ~options=?, ()) =>
  _getAllByAltText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryByAltText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByAltTextQuery.options>,
) => Js.null<Dom.element> = "queryByAltText"

let queryByAltText = (element, ~matcher, ~options=?, ()) =>
  _queryByAltText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryAllByAltText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByAltTextQuery.options>,
) => array<Dom.element> = "queryAllByAltText"

let queryAllByAltText = (element, ~matcher, ~options=?, ()) =>
  _queryAllByAltText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findByAltText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByAltTextQuery.options>,
) => Promise.t<Dom.element> = "findByAltText"

let findByAltText = (element, ~matcher, ~options=?, ()) =>
  _findByAltText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findAllByAltText: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByAltTextQuery.options>,
) => Promise.t<array<Dom.element>> = "findAllByAltText"

let findAllByAltText = (element, ~matcher, ~options=?, ()) =>
  _findAllByAltText(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@ocaml.doc("
 * ByTitle
 ")
@module("@testing-library/dom")
external _getByTitle: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByTitleQuery.options>,
) => Dom.element = "getByTitle"

let getByTitle = (element, ~matcher, ~options=?, ()) =>
  _getByTitle(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _getAllByTitle: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByTitleQuery.options>,
) => array<Dom.element> = "getAllByTitle"

let getAllByTitle = (element, ~matcher, ~options=?, ()) =>
  _getAllByTitle(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryByTitle: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByTitleQuery.options>,
) => Js.null<Dom.element> = "queryByTitle"

let queryByTitle = (element, ~matcher, ~options=?, ()) =>
  _queryByTitle(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryAllByTitle: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByTitleQuery.options>,
) => array<Dom.element> = "queryAllByTitle"

let queryAllByTitle = (element, ~matcher, ~options=?, ()) =>
  _queryAllByTitle(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findByTitle: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByTitleQuery.options>,
) => Promise.t<Dom.element> = "findByTitle"

let findByTitle = (element, ~matcher, ~options=?, ()) =>
  _findByTitle(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findAllByTitle: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByTitleQuery.options>,
) => Promise.t<array<Dom.element>> = "findAllByTitle"

let findAllByTitle = (element, ~matcher, ~options=?, ()) =>
  _findAllByTitle(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@ocaml.doc("
 * ByDisplayValue
 ")
@module("@testing-library/dom")
external _getByDisplayValue: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByDisplayValueQuery.options>,
) => Dom.element = "getByDisplayValue"

let getByDisplayValue = (element, ~matcher, ~options=?, ()) =>
  _getByDisplayValue(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _getAllByDisplayValue: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByDisplayValueQuery.options>,
) => array<Dom.element> = "getAllByDisplayValue"

let getAllByDisplayValue = (element, ~matcher, ~options=?, ()) =>
  _getAllByDisplayValue(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryByDisplayValue: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByDisplayValueQuery.options>,
) => Js.null<Dom.element> = "queryByDisplayValue"

let queryByDisplayValue = (element, ~matcher, ~options=?, ()) =>
  _queryByDisplayValue(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryAllByDisplayValue: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByDisplayValueQuery.options>,
) => array<Dom.element> = "queryAllByDisplayValue"

let queryAllByDisplayValue = (element, ~matcher, ~options=?, ()) =>
  _queryAllByDisplayValue(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findByDisplayValue: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByDisplayValueQuery.options>,
) => Promise.t<Dom.element> = "findByDisplayValue"

let findByDisplayValue = (element, ~matcher, ~options=?, ()) =>
  _findByDisplayValue(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findAllByDisplayValue: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByDisplayValueQuery.options>,
) => Promise.t<array<Dom.element>> = "findAllByDisplayValue"

let findAllByDisplayValue = (element, ~matcher, ~options=?, ()) =>
  _findAllByDisplayValue(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@ocaml.doc("
 * ByRole
 ")
@module("@testing-library/dom")
external _getByRole: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByRoleQuery.options>,
) => Dom.element = "getByRole"

let getByRole = (element, ~matcher, ~options=?, ()) =>
  _getByRole(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _getAllByRole: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByRoleQuery.options>,
) => array<Dom.element> = "getAllByRole"

let getAllByRole = (element, ~matcher, ~options=?, ()) =>
  _getAllByRole(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryByRole: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByRoleQuery.options>,
) => Js.null<Dom.element> = "queryByRole"

let queryByRole = (element, ~matcher, ~options=?, ()) =>
  _queryByRole(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryAllByRole: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByRoleQuery.options>,
) => array<Dom.element> = "queryAllByRole"

let queryAllByRole = (element, ~matcher, ~options=?, ()) =>
  _queryAllByRole(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findByRole: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByRoleQuery.options>,
) => Promise.t<Dom.element> = "findByRole"

let findByRole = (element, ~matcher, ~options=?, ()) =>
  _findByRole(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findAllByRole: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByRoleQuery.options>,
) => Promise.t<array<Dom.element>> = "findAllByRole"

let findAllByRole = (element, ~matcher, ~options=?, ()) =>
  _findAllByRole(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@ocaml.doc("
 * ByTestId
 ")
@module("@testing-library/dom")
external _getByTestId: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByTestIdQuery.options>,
) => Dom.element = "getByTestId"

let getByTestId = (element, ~matcher, ~options=?, ()) =>
  _getByTestId(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _getAllByTestId: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByTestIdQuery.options>,
) => array<Dom.element> = "getAllByTestId"

let getAllByTestId = (element, ~matcher, ~options=?, ()) =>
  _getAllByTestId(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryByTestId: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByTestIdQuery.options>,
) => Js.null<Dom.element> = "queryByTestId"

let queryByTestId = (element, ~matcher, ~options=?, ()) =>
  _queryByTestId(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _queryAllByTestId: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByTestIdQuery.options>,
) => array<Dom.element> = "queryAllByTestId"

let queryAllByTestId = (element, ~matcher, ~options=?, ()) =>
  _queryAllByTestId(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findByTestId: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByTestIdQuery.options>,
) => Promise.t<Dom.element> = "findByTestId"

let findByTestId = (element, ~matcher, ~options=?, ()) =>
  _findByTestId(element, ~matcher, ~options=Js.Undefined.fromOption(options))

@module("@testing-library/dom")
external _findAllByTestId: (
  Dom.element,
  ~matcher: @unwrap
  [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: Js.undefined<ByTestIdQuery.options>,
) => Promise.t<array<Dom.element>> = "findAllByTestId"

let findAllByTestId = (element, ~matcher, ~options=?, ()) =>
  _findAllByTestId(element, ~matcher, ~options=Js.Undefined.fromOption(options))
