object FrmManutManual: TFrmManutManual
  Left = 0
  Top = 0
  Caption = 'Manuten'#231#227'o Pessoa Manual'
  ClientHeight = 224
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnPrinc: TPanel
    Left = 0
    Top = 0
    Width = 325
    Height = 224
    Align = alClient
    TabOrder = 0
    object lb_Brasileiro: TLabel
      Left = 34
      Top = 154
      Width = 52
      Height = 13
      Caption = 'Brasileiro?:'
    end
    object lbl_DtNascimento: TLabel
      Left = 2
      Top = 107
      Width = 85
      Height = 13
      Caption = 'Data Nascimento:'
    end
    object lb_Nome: TLabeledEdit
      Left = 89
      Top = 48
      Width = 185
      Height = 21
      EditLabel.Width = 31
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome:'
      LabelPosition = lpLeft
      TabOrder = 1
    end
    object lb_SobreNome: TLabeledEdit
      Left = 89
      Top = 75
      Width = 185
      Height = 21
      EditLabel.Width = 58
      EditLabel.Height = 13
      EditLabel.Caption = 'Sobrenome:'
      LabelPosition = lpLeft
      TabOrder = 2
    end
    object cb_Brasileiro: TComboBox
      Left = 89
      Top = 149
      Width = 88
      Height = 21
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 5
      Text = '0 - N'#227'o'
      Items.Strings = (
        '0 - N'#227'o'
        '1 - Sim')
    end
    object btSalvar: TButton
      Left = 89
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 6
      OnClick = btSalvarClick
    end
    object lb_ID: TLabeledEdit
      Left = 89
      Top = 21
      Width = 64
      Height = 21
      Alignment = taRightJustify
      EditLabel.Width = 15
      EditLabel.Height = 13
      EditLabel.Caption = 'ID:'
      LabelPosition = lpLeft
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 0
      Text = '-1'
    end
    object dt_DataNascimento: TDateTimePicker
      Left = 89
      Top = 102
      Width = 129
      Height = 21
      Date = 45240.350183043980000000
      Time = 45240.350183043980000000
      TabOrder = 3
    end
    object lb_Email: TLabeledEdit
      Left = 89
      Top = 125
      Width = 216
      Height = 21
      EditLabel.Width = 28
      EditLabel.Height = 13
      EditLabel.Caption = 'Email:'
      LabelPosition = lpLeft
      TabOrder = 4
    end
    object btAtualizar: TButton
      Left = 170
      Top = 184
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 7
      OnClick = btAtualizarClick
    end
  end
end