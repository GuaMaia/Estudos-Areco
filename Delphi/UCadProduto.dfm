object FCadProduto: TFCadProduto
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produto'
  ClientHeight = 192
  ClientWidth = 603
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  KeyPreview = True
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  TextHeight = 15
  object Label3: TLabel
    Left = 8
    Top = 58
    Width = 50
    Height = 13
    Caption = 'C'#211'DIGO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 103
    Width = 73
    Height = 13
    Caption = 'DESCRI'#199#195'O'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 148
    Width = 22
    Height = 13
    Caption = 'UN.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 73
    Top = 148
    Width = 109
    Height = 13
    Caption = 'PRE'#199'O UNIT'#193'RIO'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Verdana'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inline FFrame_Cadastro1: TFFrame_Cadastro
    Left = 0
    Top = 0
    Width = 603
    Height = 55
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 599
    inherited Panel1: TPanel
      Width = 603
      ExplicitWidth = 599
      inherited btSalvar: TSpeedButton
        Left = 54
        Top = -1
        OnClick = FFrame_Cadastro1btSalvarClick
        ExplicitLeft = 54
        ExplicitTop = -1
      end
      inherited BtCancelar: TSpeedButton
        Left = 110
        Top = -1
        OnClick = FFrame_Cadastro1BtCancelarClick
        ExplicitLeft = 110
        ExplicitTop = -1
      end
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 72
    Width = 123
    Height = 25
    BevelOuter = bvNone
    Enabled = False
    TabOrder = 1
    object edId: TEdit
      Left = 0
      Top = 1
      Width = 121
      Height = 23
      Color = clGrayText
      TabOrder = 0
    end
  end
  object edDescricao: TEdit
    Left = 8
    Top = 119
    Width = 585
    Height = 23
    CharCase = ecUpperCase
    MaxLength = 100
    TabOrder = 2
  end
  object edUn: TEdit
    Left = 8
    Top = 163
    Width = 50
    Height = 23
    CharCase = ecUpperCase
    MaxLength = 2
    TabOrder = 3
    OnKeyPress = edUnKeyPress
  end
  object edPreco: TEdit
    Left = 73
    Top = 163
    Width = 121
    Height = 23
    Alignment = taRightJustify
    TabOrder = 4
    OnExit = edPrecoExit
    OnKeyPress = edPrecoKeyPress
  end
end
