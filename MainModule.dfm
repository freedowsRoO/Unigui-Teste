object UniMainModule: TUniMainModule
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  Height = 278
  Width = 591
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT FIRST 500 * FROM MOCK_dATA ')
    Left = 63
    Top = 134
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\DELPHI TEST\TESTE.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    Left = 48
    Top = 40
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 159
    Top = 40
  end
end
