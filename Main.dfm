object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 439
  ClientWidth = 808
  Caption = 'MainForm'
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  AlignmentControl = uniAlignmentClient
  Layout = 'vbox'
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 808
    Height = 89
    Hint = ''
    Align = alTop
    TabOrder = 2
    Caption = ''
    object UniButton2: TUniButton
      Left = 1
      Top = 1
      Width = 112
      Height = 87
      Hint = ''
      Caption = 'Conexao direta'
      Align = alLeft
      TabOrder = 1
      OnClick = UniButton2Click
    end
    object UniButton1: TUniButton
      Left = 656
      Top = 1
      Width = 151
      Height = 87
      Hint = ''
      Caption = 'CONEXAO DIRETA UNICA'
      Align = alRight
      TabOrder = 2
      OnClick = UniButton1Click
    end
    object UniButton4: TUniButton
      Left = 113
      Top = 1
      Width = 110
      Height = 87
      Hint = ''
      Caption = 'close query'
      Align = alLeft
      TabOrder = 3
      OnClick = UniButton4Click
      ExplicitLeft = 131
    end
    object UniButton5: TUniButton
      Left = 327
      Top = 1
      Width = 106
      Height = 87
      Hint = ''
      Caption = 'close MENTABLE'
      Align = alLeft
      TabOrder = 4
      OnClick = UniButton5Click
      ExplicitLeft = 399
    end
    object UniButton6: TUniButton
      Left = 223
      Top = 1
      Width = 104
      Height = 87
      Hint = ''
      Caption = 'RestAPI'
      Align = alLeft
      TabOrder = 5
      OnClick = UniButton6Click
      ExplicitLeft = 265
    end
  end
  object UniDBGrid1: TUniDBGrid
    Left = 225
    Top = 89
    Width = 583
    Height = 350
    Hint = ''
    DataSource = DataSource1
    WebOptions.FetchAll = True
    LoadMask.Message = 'Loading data...'
    LayoutConfig.Flex = 1
    LayoutConfig.Width = '100%'
    TabOrder = 0
  end
  object UniMemo1: TUniMemo
    Left = 0
    Top = 89
    Width = 225
    Height = 350
    Hint = ''
    Lines.Strings = (
      'UniMemo1')
    Align = alLeft
    TabOrder = 1
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 568
    Top = 168
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 464
    Top = 168
  end
end
