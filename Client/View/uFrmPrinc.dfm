object FrmSelecaoTpManut: TFrmSelecaoTpManut
  Left = 0
  Top = 0
  Caption = 'Sele'#231#227'o do Tipo de Manuten'#231#227'o'
  ClientHeight = 265
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrinc: TPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 265
    Align = alClient
    TabOrder = 0
    object grpPrinc: TGroupBox
      Left = 1
      Top = 1
      Width = 303
      Height = 263
      Align = alClient
      Caption = 'Manuten'#231#227'o Pessoa'
      TabOrder = 0
      object btPessoaGrid: TButton
        Left = 40
        Top = 32
        Width = 105
        Height = 25
        Caption = 'Manuten'#231#227'o Grid'
        TabOrder = 0
        OnClick = btPessoaGridClick
      end
      object btPessoaManual: TButton
        Left = 160
        Top = 32
        Width = 105
        Height = 25
        Caption = 'Manuten'#231#227'o Manual'
        TabOrder = 1
        OnClick = btPessoaManualClick
      end
      object ed_IdPessoa: TLabeledEdit
        Left = 40
        Top = 80
        Width = 121
        Height = 21
        EditLabel.Width = 47
        EditLabel.Height = 13
        EditLabel.Caption = 'Id Pessoa'
        NumbersOnly = True
        TabOrder = 2
      end
      object bt_Consultar: TButton
        Left = 40
        Top = 120
        Width = 75
        Height = 25
        Caption = 'Consultar'
        TabOrder = 3
        OnClick = bt_ConsultarClick
      end
    end
  end
end
