object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  Height = 170
  Width = 501
  object conexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    TransactIsolationLevel = tiReadCommitted
    HostName = '.\SERVERCURSO'
    Port = 1433
    Database = 'vendas'
    User = ''
    Password = ''
    Protocol = 'mssql'
    LibraryLocation = 'C:\Projeto Delphi\ntwdblib.dll'
    Left = 224
    Top = 64
  end
end
