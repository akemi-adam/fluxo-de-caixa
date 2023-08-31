object frmFluxoDeCaixa: TfrmFluxoDeCaixa
  Left = 0
  Top = 0
  Caption = 'Fluxo de Caixa - by Bazilisco'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Consolas'
  Font.Style = []
  TextHeight = 14
  object lblPeriod: TLabel
    Left = 520
    Top = 24
    Width = 84
    Height = 14
    Caption = 'Novo per'#237'odo'
  end
  object lblCashFlow: TLabel
    Left = 520
    Top = 104
    Width = 70
    Height = 14
    Caption = 'Novo caixa'
  end
  object Label1: TLabel
    Left = 536
    Top = 184
    Width = 42
    Height = 14
    Caption = 'Label1'
  end
  object lsbCashList: TListBox
    Left = 8
    Top = 24
    Width = 497
    Height = 393
    ItemHeight = 14
    TabOrder = 0
  end
  object btnNewPeriod: TButton
    Left = 520
    Top = 44
    Width = 84
    Height = 29
    Caption = 'Adicionar'
    TabOrder = 1
    OnClick = btnNewPeriodClick
  end
  object btnNewCashFlow: TButton
    Left = 520
    Top = 124
    Width = 84
    Height = 29
    Caption = 'Adicionar'
    TabOrder = 2
    OnClick = btnNewCashFlowClick
  end
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 536
    Top = 352
  end
end
