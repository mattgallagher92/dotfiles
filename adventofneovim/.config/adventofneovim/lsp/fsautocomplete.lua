return {
  filetypes = { 'fsharp' },
  root_markers = { '*.slnx', '*.sln', '*.fsproj', '.git' },
  cmd = { 'fsautocomplete' },
  -- https://github.com/ionide/FsAutoComplete/blob/main/docs/communication-protocol.md#initialization-options
  init_options = {
    AutomaticWorkspaceInit = true,
  },
  -- https://github.com/ionide/FsAutoComplete/blob/main/docs/communication-protocol.md#settings
  settings = {
    FSharp = {
      keywordsAutocomplete = true,
      ExternalAutocomplete = false,
      Linter = true,
      UnionCaseStubGeneration = true,
      UnionCaseStubGenerationBody = 'failwith "Not Implemented"',
      RecordStubGeneration = true,
      RecordStubGenerationBody = 'failwith "Not Implemented"',
      InterfaceStubGeneration = true,
      InterfaceStubGenerationObjectIdentifier = 'this',
      InterfaceStubGenerationMethodBody = 'failwith "Not Implemented"',
      UnusedOpensAnalyzer = true,
      UnusedDeclarationsAnalyzer = true,
      UseSdkScripts = true,
      SimplifyNameAnalyzer = false,
      ResolveNamespaces = true,
      EnableReferenceCodeLens = true,
      dotNetRoot = '/usr/local/share/dotnet',
    },
  },
}
