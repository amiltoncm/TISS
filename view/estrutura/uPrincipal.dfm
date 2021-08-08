object frmPrincipal: TfrmPrincipal
  Left = 36
  Top = 107
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Gerador XML - SP/SADT - [ENVIO_LOTE_GUIAS] '
  ClientHeight = 565
  ClientWidth = 999
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 103
    Height = 13
    Caption = 'Selecione o conv'#234'nio'
  end
  object Label2: TLabel
    Left = 276
    Top = 8
    Width = 104
    Height = 13
    Caption = 'Selecione a cobran'#231'a'
  end
  object Gauge: TGauge
    Left = 12
    Top = 421
    Width = 970
    Height = 17
    BorderStyle = bsNone
    Color = clBtnFace
    ForeColor = clNavy
    ParentColor = False
    Progress = 0
  end
  object btGerar: TBitBtn
    Left = 868
    Top = 21
    Width = 105
    Height = 25
    Hint = 'Gera guia SP/SADT'
    Caption = '&Gerar'
    Glyph.Data = {
      36030000424D3603000000000000360000002800000010000000100000000100
      18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF993300FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF993300
      993300FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF993300993300993300FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF993300AA5F1F993300FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF993300BA7D4899330099
      3300FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF993300CDA27CD8B596993300993300FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF993300E1
      C6B0ECDCCDEDDDD1993300FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF993300F4E9E2FDF9F5FBF4EC9933009933
      00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF99
      3300E1C0ABF7E9DAF4E0CCE1BA9C993300993300FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF993300F6E6D6F3DEC8F0D5BAE3B995993300FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF99
      3300EDCAA8EAC199E7B98BDFA875993300FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF993300E3AE79E0A56BDD9C5CDA94
      4F993300FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF993300993300993300993300993300993300FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btGerarClick
  end
  object cbCobranca: TwwDBLookupCombo
    Left = 276
    Top = 24
    Width = 88
    Height = 21
    Hint = 'Selecione a cobran'#231'a'
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'rec_vencimento'#9'13'#9'Vencimento'#9'F'
      'rec_codigo'#9'8'#9'ID'#9'F'
      'rec_nome'#9'30'#9'Cliente'#9'F'#9
      'rec_valor'#9'13'#9'Valor'#9'F'
      'his_id'#9'10'#9'Hist'#243'rico'#9'F')
    LookupTable = dmDados.qyReceber
    LookupField = 'rec_vencimento'
    Options = [loColLines, loRowLines, loTitles]
    AutoSelect = False
    ButtonEffects.Transparent = True
    ButtonEffects.Flat = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    AutoDropDown = False
    ShowButton = True
    SeqSearchOptions = []
    PreciseEditRegion = False
    AllowClearKey = True
    ShowMatchText = True
    OnEnter = cbCobrancaEnter
  end
  object dbID: TDBEdit
    Left = 361
    Top = 24
    Width = 54
    Height = 21
    Hint = 'ID do recebimento'
    TabStop = False
    DataField = 'rec_codigo'
    DataSource = dsReceber
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 4
  end
  object dbCliente: TDBEdit
    Left = 414
    Top = 24
    Width = 187
    Height = 21
    Hint = 'Cliente'
    TabStop = False
    DataField = 'rec_nome'
    DataSource = dsReceber
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 5
  end
  object dbValor: TDBEdit
    Left = 600
    Top = 24
    Width = 84
    Height = 21
    Hint = 'Valor'
    TabStop = False
    DataField = 'rec_valor'
    DataSource = dsReceber
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 6
  end
  object cbRefazer: TCheckBox
    Left = 797
    Top = 24
    Width = 65
    Height = 17
    Hint = 'Selecione para refazer o TISS de uma cobran'#231'a'
    TabStop = False
    Caption = 'Refazer'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = cbRefazerClick
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 52
    Width = 974
    Height = 366
    ActivePage = tsStatus
    TabOrder = 7
    OnChange = PageControl1Change
    object tsStatus: TTabSheet
      Caption = 'Status'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object reXML: TMemo
        Left = 0
        Top = 0
        Width = 966
        Height = 338
        Hint = 'TISS Gerado'
        TabStop = False
        Align = alClient
        Lines.Strings = (
          'reXML')
        ParentShowHint = False
        ScrollBars = ssVertical
        ShowHint = True
        TabOrder = 0
      end
    end
    object tsTreeView: TTabSheet
      Caption = 'Tree View'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object TreeView1: TTreeView
        Left = 0
        Top = 0
        Width = 966
        Height = 338
        Align = alClient
        Indent = 19
        PopupMenu = PopupMenu1
        RightClickSelect = True
        RowSelect = True
        SortType = stBoth
        TabOrder = 0
      end
    end
    object tsExames: TTabSheet
      Caption = 'Exames'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object DBGrid1: TDBGrid
        Left = 3
        Top = 3
        Width = 907
        Height = 332
        TabStop = False
        DataSource = dsExamesCob
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'exa_id'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'res_nome'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'res_cpf'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'med_nome'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'med_cpf'
            Width = 64
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 420
    Width = 974
    Height = 135
    BevelInner = bvLowered
    TabOrder = 8
    object Label3: TLabel
      Left = 8
      Top = 22
      Width = 56
      Height = 13
      Caption = 'Codifica'#231#227'o'
    end
    object Label5: TLabel
      Left = 111
      Top = 22
      Width = 63
      Height = 13
      Caption = 'Compactador'
    end
    object Label4: TLabel
      Left = 118
      Top = 63
      Width = 99
      Height = 13
      Caption = 'Tipo de identifica'#231#227'o'
    end
    object lbCodigo: TLabel
      Left = 8
      Top = 63
      Width = 95
      Height = 13
      Caption = 'C'#243'digo do prestador'
    end
    object Label6: TLabel
      Left = 8
      Top = 4
      Width = 82
      Height = 13
      Caption = 'Configura'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 262
      Top = 22
      Width = 75
      Height = 13
      Caption = 'Vers'#227'o do TISS'
    end
    object Label8: TLabel
      Left = 413
      Top = 22
      Width = 57
      Height = 13
      Caption = 'Usar equipe'
    end
    object Label9: TLabel
      Left = 495
      Top = 22
      Width = 99
      Height = 13
      Caption = 'Grau de participa'#231#227'o'
    end
    object Label10: TLabel
      Left = 269
      Top = 63
      Width = 103
      Height = 13
      Caption = 'Indicador de acidente'
    end
    object cbCodificacao: TComboBox
      Left = 8
      Top = 36
      Width = 97
      Height = 21
      Hint = 'Selecione a codifica'#231#227'o'
      ItemIndex = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TabStop = False
      Text = 'ISO-8859-1'
      Items.Strings = (
        'ISO-8859-1'
        'UTF-8')
    end
    object cbCompactador: TComboBox
      Left = 111
      Top = 36
      Width = 145
      Height = 21
      Hint = 'Selecione o compactador'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      TabStop = False
      Text = 'cbCompactador'
      Items.Strings = (
        'WinRar'
        'WinZip')
    end
    object cbZerado: TCheckBox
      Left = 599
      Top = 36
      Width = 97
      Height = 17
      Hint = 'Selecione para gerar o TISS com os valores zerados'
      Caption = 'Gerar zerado'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object cbTipoDoc: TComboBox
      Left = 118
      Top = 82
      Width = 145
      Height = 21
      Hint = 'Selecione o tipo de documento a ser utilizado na gera'#231#227'o'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = 'cbTipoDoc'
      OnChange = cbTipoDocChange
      Items.Strings = (
        'CNPJ'
        'C'#243'digo')
    end
    object edCodigo: TMaskEdit
      Left = 9
      Top = 82
      Width = 103
      Height = 21
      Hint = 'C'#243'digo do prestador junto ao conv'#234'nio'
      EditMask = '00000000000000;1;_'
      MaxLength = 14
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      Text = '              '
    end
    object btFechar: TBitBtn
      Left = 857
      Top = 81
      Width = 105
      Height = 25
      Hint = 'Fecha o aplicativo'
      Caption = '&Fechar'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCA5D00
        CA5D00CA5D00CA5D00CA5D00CA5D00CA5D00CA5D00CA5D00CA5D00CA5D00CA5D
        00FF00FFFF00FFFF00FFFF00FFCA5D00FFFFFFFFFFFBFFFBEFFFF3E0FFEDD4FF
        E8C8FFE3BFFFE2BBFFE1BAFFEFD0CA5D00FF00FFFF00FFFF00FFFF00FFCA5D00
        FFFFFFFFF8F3FEF4E9FFEFDCFEE9D1FEE3C4FEDDB8FED9B0FED6AAFFE3BDCA5D
        00FF00FFFF00FFFF00FFFF00FFCA5D00FFFFFFFFFEFCFFFAF5FFF5EBFFF0DFFF
        EAD2FFE4C6FFDEBBFFD9B0FFE4BECA5D00FF00FFFF00FFFF00FFFF00FFCA5D00
        FFFFFFFFFFFFFFFFFEFFFBF7FFF6EDFEF0E1FFEBD5FEE5C8FEDFBCFFE8C5CA5D
        00FF00FFFF00FFFF00FFFF00FFCA5D00FFFFFFFFFFFFFFFFFFFFFFFEFFFCF8FE
        F6EDFEF2E2FFECD6FEE5C9FFEDD1CA5D00FF00FFFF00FFFF00FFFF00FFCA5D00
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCF9FFF7EF001B80FEEBD6FFF3E0CA5D
        00001B80FF00FFFF00FFFF00FFCA5D00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF001B802355FF001B80FFFFFF001B800033FF001B80FF00FFFF00FFCA5D00
        EEB67CECB074ECB074ECB074ECB074ECB074ECB174001B802757FF001B801243
        FF001B80FF00FFFF00FFFF00FFFF00FFCA5C00CA5D00CA5D00CA5D00CA5D00CA
        5D00CA5D00CA5D00001B802B5BFF001B80FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF001B804271FF001B802E5F
        FF001B80FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF001B804A79FF001B80FF00FF001B803262FF001B80FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF001B80FF00FFFF00FFFF00
        FF001B80FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btFecharClick
    end
    object pnUltArq: TPanel
      Left = 2
      Top = 112
      Width = 970
      Height = 21
      Align = alBottom
      Alignment = taLeftJustify
      BevelInner = bvLowered
      Caption = #218'ltimo arquivo gerado:'
      TabOrder = 6
      object lbArqGer: TLabel
        Left = 114
        Top = 4
        Width = 41
        Height = 13
        Hint = 'Clique para abrir no Treview'
        Caption = 'lbArqGer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Transparent = True
        OnClick = lbArqGerClick
      end
    end
    object cbVersao: TComboBox
      Left = 262
      Top = 36
      Width = 145
      Height = 21
      Hint = 'Define a vers'#227'o de gera'#231#227'o do TISS'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      TabStop = False
      Text = 'cbVersao'
      OnChange = cbVersaoChange
      Items.Strings = (
        '3.01.00'
        '3.02.00'
        '3.02.01'
        '3.03.01'
        '3.03.02'
        '3.03.03')
    end
    object btAbrir: TBitBtn
      Left = 746
      Top = 81
      Width = 105
      Height = 25
      Hint = 'Selecionar e abrir TISS (XML)'
      Caption = '&Abrir'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF29ABD735B3DC23A9D7FF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF29ABD7
        AFF6FC86EFFA49C2E449C2E449C2E434B4DD24AAD7FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF29ABD7A6E9F59EFFFF97FCFF99FBFF95F7FF8D
        F2FE83EAFA49C2E449C2E43AB8DFFF00FFFF00FFFF00FFFF00FFFF00FF29ABD7
        8BD7ECABFEFF90F8FF91F6FF90F5FF8FF5FF8FF4FF90F4FF95F6FF75DDF52DAF
        DBFF00FFFF00FFFF00FFFF00FF29ABD729ABD7AAF0FA91FAFF91F6FF90F5FF8E
        F4FF8DF2FE8BF1FE8CF1FF77DFF656CAEAFF00FFFF00FFFF00FFFF00FF29ABD7
        7BE5F429ABD79EFEFF8DF7FF8EF6FF8CF4FF8DF2FE8BF1FE8CF1FF72DDF579E1
        F62CB0DAFF00FFFF00FFFF00FF29ABD793F9FD29ABD7A8E9F5A8F0FAA4F1FBA1
        F7FF8CF3FF8AF1FE8CF1FF70DAF305740B58CDEAFF00FFFF00FFFF00FF29ABD7
        9DFEFF86F2FB29ABD729ABD729ABD729ABD7AFF2FB90F4FF88F2FF05740B5BE7
        8C05740B1FA8D6FF00FFFF00FF29ABD79AFCFF96FBFF95FBFF95FAFF90F7FF6C
        DEF329ABD79FE3F405740B50D77A45D26C31C14F05740BFF00FFFF00FF29ABD7
        9BFDFF94FAFF92F8FF91F6FF92F7FF93F9FF84EFFD29ABD729ABD7168C2330C1
        4C16982434AFDAFF00FFFF00FF29ABD7A4FFFF94FCFF92F9FF93F8FF8FEDFA90
        ECFA95EEFC96F1FD9AF4FF0C81161AAF2C088310FF00FFFF00FFFF00FF25A8D6
        29ABD79EF5FB9FF7FD86EAF82BAED925A8D628ABD72AACD832B0DA0C90170EA0
        1AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF29ABD730AED92CADD8FF00FFFF
        00FFFF00FFFF00FF0A89120EA11A08810FFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF05710A09790F0B89160A8C13067A0DFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 9
      OnClick = btAbrirClick
    end
    object cbEquipe: TComboBox
      Left = 413
      Top = 36
      Width = 77
      Height = 21
      ItemIndex = 0
      TabOrder = 8
      Text = 'Sim'
      Items.Strings = (
        'Sim'
        'N'#227'o')
    end
    object edGrauPart: TEdit
      Left = 495
      Top = 36
      Width = 98
      Height = 21
      Hint = 'Grau de participa'#231#227'o'
      TabStop = False
      NumbersOnly = True
      ReadOnly = True
      TabOrder = 10
      Text = 'edGrauPart'
    end
    object cbAcidente: TComboBox
      Left = 269
      Top = 82
      Width = 324
      Height = 21
      TabOrder = 11
      Text = 'cbAcidente'
      Items.Strings = (
        'Sem indica'#231#227'o'
        '0 - Acidente ou doen'#231'a relacionada a trabalho'
        '1 - Acidente ou doen'#231'a relacionada a tr'#226'nsito'
        '2 - Outros')
    end
  end
  object cbConvenio: TwwDBLookupCombo
    Left = 8
    Top = 24
    Width = 257
    Height = 21
    Hint = 'Selecione o conv'#234'nio'
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'cov_descricao'#9'20'#9'Conv'#234'nio'#9'F'
      'cov_codigo'#9'10'#9'ID'#9'F')
    LookupTable = dmDados.lkConvenios
    LookupField = 'cov_descricao'
    Options = [loColLines, loRowLines, loTitles]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    AutoDropDown = False
    ShowButton = True
    PreciseEditRegion = False
    AllowClearKey = False
    ShowMatchText = True
    OnExit = cbConvenioExit
    OnKeyPress = cbConvenioKeyPress
  end
  object dbHisID: TDBEdit
    Left = 683
    Top = 24
    Width = 81
    Height = 21
    DataField = 'his_id'
    DataSource = dsReceber
    TabOrder = 9
  end
  object dsConvenios: TDataSource
    DataSet = dmDados.qyConvenios
    Left = 248
    Top = 216
  end
  object dsReceber: TDataSource
    DataSet = dmDados.qyReceber
    Left = 336
    Top = 160
  end
  object dsEmpresa: TDataSource
    DataSet = dmDados.qyEmpresa
    Left = 408
    Top = 160
  end
  object dsTiss: TDataSource
    DataSet = dmDados.qyTiss
    Left = 336
    Top = 216
  end
  object dsMedicos: TDataSource
    DataSet = dmDados.qyMedicos
    Left = 408
    Top = 216
  end
  object SaveDialog1: TSaveDialog
    Left = 488
    Top = 160
  end
  object XMLDocument1: TXMLDocument
    Left = 64
    Top = 112
    DOMVendorDesc = 'MSXML'
  end
  object PopupMenu1: TPopupMenu
    Left = 72
    Top = 192
    object Expandirtodos1: TMenuItem
      Caption = 'Expandir todos'
      OnClick = Expandirtodos1Click
    end
    object Recolhertodos1: TMenuItem
      Caption = 'Recolher todos'
      OnClick = Recolhertodos1Click
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivos XML|*.xml'
    InitialDir = 'C:\Genesis\guias'
    Title = 'Abrir'
    Left = 652
    Top = 332
  end
  object TissSP: TTissSP_SADT
    ansVersaoXSD = v3_02_00
    Versao.Versao = '1.0.0'
    Tissconfig.TissUsarBenefic = True
    Tissconfig.TissUsarContratado = True
    Tissconfig.TissUsarPrestadorExec = True
    Tissconfig.TissUsarPrestadorExecCompl = False
    Tissconfig.TissUsarDiagnostico = False
    Tissconfig.TissUsarProc = True
    Tissconfig.TissUsarProfissional = True
    Tissconfig.TissUsarProfissionalCompl = False
    Tissconfig.TissUsarOPM = False
    Tissconfig.TissUsarOutDespesas = False
    Tissconfig.TissCabecalho.TissTipoTrans = True
    Tissconfig.TissCabecalho.TissDataRegistroTrans = True
    Tissconfig.TissCabecalho.TissHoraRegistroTrans = True
    Tissconfig.TissCabecalho.TissSequencialTrans = True
    Tissconfig.TissCabecalho.TissCNPJCPF = True
    Tissconfig.TissCabecalho.TissRegANS = True
    Tissconfig.TissCabecalho.TissNumLote = True
    Tissconfig.TissCabecalho.TissTipoGeral = True
    Tissconfig.TissCabecalho.TissUsarNomeArqu = False
    Tissconfig.TissCabecalho.TissArqNomeHash = True
    Tissconfig.TissCabecalho.TissNomeAplica = True
    Tissconfig.TissCabecalho.TissVersaoAplica = True
    Tissconfig.TissCabecalho.TissFabricaAplica = True
    Tissconfig.TissBenefic.TissNumCarteira = True
    Tissconfig.TissBenefic.TissBenific = True
    Tissconfig.TissBenefic.TissNomePlano = True
    Tissconfig.TissBenefic.TissValidadeCart = False
    Tissconfig.TissBenefic.TissNumCNS = False
    Tissconfig.TissContratado.TissTipoGeral = True
    Tissconfig.TissContratado.TissCNPJCPF = True
    Tissconfig.TissContratado.TissNomeContradado = True
    Tissconfig.TissContratado.TisstipoLogradouro = False
    Tissconfig.TissContratado.TissLogradouro = False
    Tissconfig.TissContratado.TissEndNum = False
    Tissconfig.TissContratado.TissComplemento = False
    Tissconfig.TissContratado.TisscodigoIBGE = False
    Tissconfig.TissContratado.TissMunicipio = False
    Tissconfig.TissContratado.TissUF = False
    Tissconfig.TissContratado.TissCEP = False
    Tissconfig.TissContratado.TissCNES = False
    Tissconfig.TissContratado.TissUsarEnd = False
    Tissconfig.TissPrestadorExec.TissTipoGeral = False
    Tissconfig.TissPrestadorExec.TissCNPJCPF = False
    Tissconfig.TissPrestadorExec.TissNomeContradado = True
    Tissconfig.TissPrestadorExec.TisstipoLogradouro = False
    Tissconfig.TissPrestadorExec.TissLogradouro = False
    Tissconfig.TissPrestadorExec.TissEndNum = False
    Tissconfig.TissPrestadorExec.TissComplemento = False
    Tissconfig.TissPrestadorExec.TisscodigoIBGE = False
    Tissconfig.TissPrestadorExec.TissMunicipio = False
    Tissconfig.TissPrestadorExec.TissUF = False
    Tissconfig.TissPrestadorExec.TissCEP = False
    Tissconfig.TissPrestadorExec.TissCNES = True
    Tissconfig.TissPrestadorExec.TissUsarEnd = False
    Tissconfig.TissPrestadorExecCompl.TissTipoGeral = False
    Tissconfig.TissPrestadorExecCompl.TissCNPJCPF = False
    Tissconfig.TissPrestadorExecCompl.TissNomeContradado = False
    Tissconfig.TissPrestadorExecCompl.TisstipoLogradouro = False
    Tissconfig.TissPrestadorExecCompl.TissLogradouro = False
    Tissconfig.TissPrestadorExecCompl.TissEndNum = False
    Tissconfig.TissPrestadorExecCompl.TissComplemento = False
    Tissconfig.TissPrestadorExecCompl.TisscodigoIBGE = False
    Tissconfig.TissPrestadorExecCompl.TissMunicipio = False
    Tissconfig.TissPrestadorExecCompl.TissUF = False
    Tissconfig.TissPrestadorExecCompl.TissCEP = False
    Tissconfig.TissPrestadorExecCompl.TissCNES = False
    Tissconfig.TissPrestadorExecCompl.TissUsarEnd = False
    Tissconfig.TissDiagnostico.TissCIDNomeTab = False
    Tissconfig.TissDiagnostico.TissCIDCodDiag = False
    Tissconfig.TissDiagnostico.TissCIDDescDiag = False
    Tissconfig.TissDiagnostico.TissValor = False
    Tissconfig.TissDiagnostico.TissUnTemp = False
    Tissconfig.TissDiagnostico.TissTipDoenc = False
    Tissconfig.TissDiagnostico.TissIndicAcid = True
    Tissconfig.TissProc.TissUsarEquipe = True
    Tissconfig.TissProc.TissEquipe.TissCodProf = True
    Tissconfig.TissProc.TissEquipe.TissTipoMemb = True
    Tissconfig.TissProc.TissEquipe.TissProfiss.TissProf = True
    Tissconfig.TissProc.TissEquipe.TissProfiss.TissUsarConselho = True
    Tissconfig.TissProc.TissEquipe.TissProfiss.TissSiglaConselho = True
    Tissconfig.TissProc.TissEquipe.TissProfiss.TissNumConselho = True
    Tissconfig.TissProc.TissEquipe.TissProfiss.TissUFConselho = True
    Tissconfig.TissProc.TissEquipe.TissProfiss.TissfCBOS = True
    Tissconfig.TissProc.TissEquipe.TissProfiss.TissPosicProf = True
    Tissconfig.TissProc.TissProcs.TissCodigo = True
    Tissconfig.TissProc.TissProcs.TissTipTabela = True
    Tissconfig.TissProc.TissProcs.TissDescricao = True
    Tissconfig.TissProc.TissData = True
    Tissconfig.TissProc.TissHsInicio = True
    Tissconfig.TissProc.TissHsFim = True
    Tissconfig.TissProc.TissQtde = True
    Tissconfig.TissProc.TissVdeAcesso = True
    Tissconfig.TissProc.TissTecUtil = True
    Tissconfig.TissProc.TissReducAcres = True
    Tissconfig.TissProc.TissValor = True
    Tissconfig.TissProc.TissValorTotal = True
    Tissconfig.TissProc.TissValorTotalGeral = True
    Tissconfig.TissProfissional.TissProf = False
    Tissconfig.TissProfissional.TissUsarConselho = False
    Tissconfig.TissProfissional.TissSiglaConselho = True
    Tissconfig.TissProfissional.TissNumConselho = True
    Tissconfig.TissProfissional.TissUFConselho = True
    Tissconfig.TissProfissional.TissfCBOS = True
    Tissconfig.TissProfissional.TissPosicProf = False
    Tissconfig.TissProfissionalCompl.TissProf = False
    Tissconfig.TissProfissionalCompl.TissUsarConselho = False
    Tissconfig.TissProfissionalCompl.TissSiglaConselho = False
    Tissconfig.TissProfissionalCompl.TissNumConselho = False
    Tissconfig.TissProfissionalCompl.TissUFConselho = False
    Tissconfig.TissProfissionalCompl.TissfCBOS = False
    Tissconfig.TissProfissionalCompl.TissPosicProf = False
    Tissconfig.TissOPM.TissCodigo = False
    Tissconfig.TissOPM.TissTipTab = False
    Tissconfig.TissOPM.TissDescricao = False
    Tissconfig.TissOPM.TissQtde = False
    Tissconfig.TissOPM.TissCodBar = False
    Tissconfig.TissOPM.TissVlrUnt = False
    Tissconfig.TissOPM.TissVlrTot = False
    Tissconfig.TissOutDesp.TissIdentCodTab = False
    Tissconfig.TissOutDesp.TissIdentTipTab = False
    Tissconfig.TissOutDesp.TissIdentDesc = False
    Tissconfig.TissOutDesp.TissTipoDesp = False
    Tissconfig.TissOutDesp.TissDTRealizacao = False
    Tissconfig.TissOutDesp.TissHSInicial = False
    Tissconfig.TissOutDesp.TissHSFinal = False
    Tissconfig.TissOutDesp.TissReducAcres = False
    Tissconfig.TissOutDesp.TissQtde = True
    Tissconfig.TissOutDesp.TissVlrUnt = True
    Tissconfig.TissOutDesp.TissTotalGeral = True
    Tissconfig.TissNumGuiaPrest = True
    Tissconfig.TissNumGuiaOper = True
    Tissconfig.TissNumGuiaPrinc = False
    Tissconfig.TissDataEmis = True
    Tissconfig.TissDataAut = True
    Tissconfig.TissSenhaAut = False
    Tissconfig.TissSenhaValid = False
    Tissconfig.TissTipoSP = True
    Tissconfig.TissindicClinica = True
    Tissconfig.TisscaraterAtend = True
    Tissconfig.TissDataAtend = True
    Tissconfig.TissHoraAtend = False
    Tissconfig.TissTipoSaida = True
    Tissconfig.TissTipoAtend = True
    Tissconfig.TissCNPJCPF = True
    Tissconfig.TissRegANS = True
    Tissconfig.TissNumLote = True
    Tissconfig.PadraoTipFontPg = RegistroANS
    Tissconfig.TissUsarObs = False
    Tissconfig.TissNomeAplica = True
    Tissconfig.TissVersaoAplica = True
    Tissconfig.TissFabricaAplica = True
    Tisscabecalho.TissVersaoXml = '1.0'
    Tisscabecalho.TissEncoding = 'ISO-8859-1'
    Tisscabecalho.TissMensagemTissXml = 
      'xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ansTISS="http://w' +
      'ww.ans.gov.br/padroes/tiss/schemas"'
    Tisscabecalho.TissVersaoTISS = '3.02.00'
    Tisscabecalho.TissTipoGeral = JuridicoGeral
    Tisscabecalho.TissZerosArq = 20
    Tisscabecalho.TissNomeAplica = 'GENESIS'
    Tisscabecalho.TissVersaoAplica = '1.1'
    Tisscabecalho.TissFabricaAplica = 'NEXT'
    TissContratado.TissTipoGeral = FisicGeral
    TissPrestadorExec.TissTipoGeral = JuridicoGeral
    TissPrestadorExecCompl.TissTipoGeral = JuridicoGeral
    TissProfissional.TissSiglaConselho = '6'
    TissProfissional.TissPosicProf = 0
    TissProfissionalCompl.TissPosicProf = 0
    TissVersaoAplica = '1.1'
    TissTipoSP = JuridicoSP_SADT
    TisscaraterAtend = '1'
    TissDiagnostico.TissValor = 0
    TissDiagnostico.TissIndicAcid = 0
    TissTipoAtend = 0
    TissProc.TissEquipe.TissTipoMemb = FisicGeral
    TissProc.TissEquipe.TissProfiss.TissPosicProf = 0
    TissProc.TissProcs.TissTipTabela = 0
    TissProc.TissVdeAcesso = '1'
    TissProc.TissTecUtil = '1'
    TissOutDesp.TissDespesa.TissTipDespesa = 0
    TissValid.UsarValidacao = True
    TissValidado = False
    Left = 240
    Top = 152
  end
  object dsExamesCob: TDataSource
    DataSet = dmDados.qyExamesCob
    Left = 488
    Top = 216
  end
end
