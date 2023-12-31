inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Cliente'
  ClientHeight = 391
  ClientWidth = 729
  ExplicitTop = 8
  ExplicitWidth = 735
  ExplicitHeight = 420
  PixelsPerInch = 96
  TextHeight = 13
  inherited imgFundo: TJvImage
    Width = 729
    Height = 391
    ExplicitWidth = 757
    ExplicitHeight = 435
  end
  inherited pgcPrincipal: TPageControl
    Width = 729
    Height = 342
    ActivePage = tabManutencao
    ExplicitWidth = 729
    ExplicitHeight = 342
    inherited tabListagem: TTabSheet
      Font.Color = clBlack
      ParentFont = False
      ExplicitWidth = 721
      ExplicitHeight = 273
      inherited grdListagem: TDBGrid
        Width = 721
        Height = 257
        FixedColor = clBtnShadow
        GradientEndColor = 4380153
        GradientStartColor = 49121
        Font.Color = clBlack
        ParentFont = False
        TitleFont.Color = clBlack
        OnKeyPress = grdListagemKeyPress
        Columns = <
          item
            Expanded = False
            FieldName = 'statusclienteId'
            Title.Alignment = taCenter
            Title.Color = clGray
            Width = 18
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'clienteId'
            Title.Alignment = taCenter
            Title.Color = clGray
            Width = 41
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Alignment = taCenter
            Title.Color = clGray
            Width = 193
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'estado'
            Title.Alignment = taCenter
            Title.Color = clGray
            Width = 43
            Visible = True
          end
          item
            Alignment = taLeftJustify
            Expanded = False
            FieldName = 'telefone'
            Title.Alignment = taCenter
            Title.Color = clGray
            Width = 149
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Title.Alignment = taCenter
            Title.Color = clGray
            Width = 303
            Visible = True
          end>
      end
      inherited pnlFundoPesquisa: TPanel
        Width = 721
        ExplicitWidth = 721
        inherited imgFundoPesquisa: TJvImage
          Width = 721
          ExplicitWidth = 716
        end
        inherited pnlListagemTopo: TPanel
          Width = 890
          ExplicitWidth = 890
        end
      end
    end
    inherited tabManutencao: TTabSheet
      Font.Color = clWhite
      ExplicitWidth = 721
      ExplicitHeight = 273
      inherited imgFundoManutencao: TJvImage
        Width = 721
        Height = 314
        ExplicitWidth = 749
        ExplicitHeight = 317
      end
      object pnlManutencao: TPanel
        Left = 0
        Top = 0
        Width = 721
        Height = 314
        Align = alClient
        Color = 5263440
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1560829
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        ExplicitHeight = 273
        object lblcpfcnpj: TLabel
          Left = 581
          Top = 24
          Width = 53
          Height = 13
          Caption = 'CPF/CNPJ'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1560829
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblData: TLabel
          Left = 581
          Top = 66
          Width = 113
          Height = 13
          Caption = 'Data de Nascimento'
        end
        object Label2: TLabel
          Left = 495
          Top = 199
          Width = 49
          Height = 13
          Caption = 'Telefone'
        end
        object Label1: TLabel
          Left = 8
          Top = 107
          Width = 20
          Height = 13
          Caption = 'CEP'
        end
        object lblPessoa: TLabel
          Left = 338
          Top = 24
          Width = 40
          Height = 13
          Caption = 'Pessoa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1560829
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblStatus: TLabel
          Left = 160
          Top = 24
          Width = 37
          Height = 13
          Caption = 'Status'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 1560829
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object imgExiste: TImage
          Left = 556
          Top = 42
          Width = 21
          Height = 21
          Transparent = True
        end
        object lblCodigo: TLabel
          Left = 8
          Top = 24
          Width = 38
          Height = 13
          Caption = 'C'#243'digo'
        end
        object edtEstado: TLabeledEdit
          Left = 660
          Top = 124
          Width = 42
          Height = 21
          Color = 13882323
          EditLabel.Width = 38
          EditLabel.Height = 13
          EditLabel.Caption = 'Estado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 2
          ParentFont = False
          TabOrder = 7
          OnExit = edtEstadoExit
        end
        object edtDataNascimento: TDateEdit
          Left = 581
          Top = 82
          Width = 121
          Height = 21
          ClickKey = 114
          Color = 13882323
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 4
        end
        object edtEmail: TLabeledEdit
          Left = 8
          Top = 218
          Width = 481
          Height = 21
          Color = 13882323
          EditLabel.Width = 30
          EditLabel.Height = 13
          EditLabel.Caption = 'Email'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 100
          ParentFont = False
          TabOrder = 10
        end
        object edtBairro: TLabeledEdit
          Left = 495
          Top = 168
          Width = 207
          Height = 21
          Color = 13882323
          EditLabel.Width = 34
          EditLabel.Height = 13
          EditLabel.Caption = 'Bairro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 40
          ParentFont = False
          TabOrder = 9
        end
        object edtCidade: TLabeledEdit
          Left = 8
          Top = 168
          Width = 481
          Height = 21
          Color = 13882323
          EditLabel.Width = 38
          EditLabel.Height = 13
          EditLabel.Caption = 'Cidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 50
          ParentFont = False
          TabOrder = 8
        end
        object edtCpfCnpj: TEdit
          Left = 582
          Top = 40
          Width = 121
          Height = 21
          Color = 13882323
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = edtCpfCnpjChange
          OnExit = edtCpfCnpjExit
        end
        object medtCep: TMaskEdit
          Left = 8
          Top = 124
          Width = 137
          Height = 21
          Color = 13882323
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Text = ''
          OnChange = medtCepChange
          OnExit = medtCepExit
        end
        object edtTelefone: TEdit
          Left = 495
          Top = 218
          Width = 208
          Height = 21
          Color = 13882323
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          OnChange = edtTelefoneChange
          OnExit = edtTelefoneExit
        end
        object edtEndereco: TLabeledEdit
          Left = 160
          Top = 124
          Width = 481
          Height = 21
          Color = 13882323
          EditLabel.Width = 52
          EditLabel.Height = 13
          EditLabel.Caption = 'Endere'#231'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 60
          ParentFont = False
          TabOrder = 6
        end
        object edtNome: TLabeledEdit
          Tag = 2
          Left = 8
          Top = 82
          Width = 560
          Height = 21
          Color = 13882323
          EditLabel.Width = 32
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxLength = 60
          ParentFont = False
          TabOrder = 3
        end
        object edtClienteId: TMaskEdit
          Left = 8
          Top = 40
          Width = 137
          Height = 21
          TabStop = False
          Color = 13882323
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          Text = ''
          OnChange = medtCepChange
          OnExit = medtCepExit
        end
        object lkpStatusCliente: TDBLookupComboBox
          Left = 160
          Top = 40
          Width = 161
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'statusclienteId'
          ListField = 'descricao'
          ListSource = dtmVendas.dtsStatusCliente
          ParentFont = False
          TabOrder = 0
          OnClick = lkpStatusClienteClick
        end
        object lkpPessoa: TDBLookupComboBox
          Left = 338
          Top = 40
          Width = 212
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          KeyField = 'pessoaId'
          ListField = 'descricao'
          ListSource = dtmVendas.dtsPessoa
          ParentFont = False
          TabOrder = 1
          OnClick = lkpPessoaClick
        end
      end
    end
  end
  inherited pnlrodape: TPanel
    Top = 340
    Width = 729
    ExplicitTop = 340
    ExplicitWidth = 729
    inherited btnSair: TPngSpeedButton
      Left = 685
      ExplicitLeft = 712
    end
    inherited btnLegendas: TPngSpeedButton
      OnClick = btnLegendasClick
    end
  end
  inherited QryListagem: TZQuery
    AutoCalcFields = False
    SQL.Strings = (
      'select clienteId,'
      '       statusclienteId,'
      '       nome,'
      '       endereco,'
      '       cidade,'
      '       bairro,'
      '       estado,'
      '       cpfcnpj,'
      '       cep,'
      '       telefone,'
      '       email,'
      '       datanascimento'
      'from clientes')
    Left = 540
    Top = 16
    object QryListagemstatusclienteId: TIntegerField
      DisplayLabel = ' '
      FieldName = 'statusclienteId'
      Required = True
      OnGetText = QryListagemstatusclienteIdGetText
    end
    object QryListagemclienteId: TIntegerField
      Alignment = taCenter
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object QryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemcpfcnpj: TWideStringField
      FieldName = 'cpfcnpj'
      Size = 25
    end
    object QryListagemendereco: TWideStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'endereco'
      Size = 60
    end
    object QryListagemcidade: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 50
    end
    object QryListagembairro: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'bairro'
      Size = 40
    end
    object QryListagemestado: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Estado'
      FieldName = 'estado'
      EditMask = '<LL;1;_'
      Size = 2
    end
    object QryListagemcep: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'cep'
      Size = 10
    end
    object QryListagemtelefone: TWideStringField
      Alignment = taCenter
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 14
    end
    object QryListagememail: TWideStringField
      DisplayLabel = 'Email'
      FieldName = 'email'
      Size = 100
    end
    object QryListagemdatanascimento: TDateTimeField
      DisplayLabel = 'Data Nascimento'
      FieldName = 'datanascimento'
    end
  end
  inherited dtsListagem: TDataSource
    OnDataChange = dtsListagemDataChange
    Top = 22
  end
  object imgListLegenda: TImageList
    BlendColor = clFuchsia
    BkColor = clFuchsia
    Left = 475
    Top = 17
    Bitmap = {
      494C010107000900040010001000FF00FF00FF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009A9A9A002424240000000000000000000000000000000000242424009B9B
      9B00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E1EFE300A7D0AD008AC191008AC19100A8D1AE00E2EFE300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF003E3E
      3E00010101000A0A0A001E1E1E002D2D2D002B2B2B001B1B1B000B0B0B000101
      01003E3E3E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5FA
      F50086BF8E00449B5000439B4F00439B4F00439B4F00439B4F00449C500088BF
      8F00F5FAF500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9EB
      F700A6AAE000FDFDFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFE00A6AA
      E000E9EBF700FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF003E3E3E000404
      0400202020003232320033333300333333003333330033333300313131001D1D
      1D00030303003E3E3E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5FAF50064AD
      6E00439B4F00439B4F00439B4F00439B4F00439B4F00439B4F00439B4F00439B
      4F0065AD6F00F5FAF500FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9EBF7004B54
      C0002C37B500787FD000FDFDFE00FFFFFF00FFFFFF00FDFDFE00787FD0002C37
      B5004B54C000E9EBF700FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF009A9A9A00010101002020
      2000333333003333330033333300333333003333330033333300333333003333
      33001E1E1E00010101009A9A9A00FFFFFF00FFFFFF00FFFFFF0085BE8D00439B
      4F00439B4F00439B4F004A9F55004A9F5600439B4F00439B4F00439B4F00439B
      4F00439B4F0088BF8F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5AADF002C37
      B5002C37B5002C37B500787FD000FDFDFE00FDFDFE00787FD0002C37B5002C37
      B5002C37B500A6AAE000FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00242424000C0C0C003232
      3200333333003333330033333300333333003333330033333300333333003333
      3300313131000909090024242400FFFFFF00FFFFFF00E1EFE300449B5000439B
      4F00439B4F004A9F5500CDE4D000D2E7D5004CA05700439B4F00439B4F00439B
      4F00439B4F00449C5000E2EFE300FFFFFF00FFFFFF00FFFFFF00FDFDFE00787F
      D0002C37B5002C37B5002C37B500787FD000787FD0002C37B5002C37B5002C37
      B500787FD000FDFDFE00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000202020003333
      3300333333003333330033333300333333003333330033333300333333003333
      3300333333001C1C1C0000000000FFFFFF00FFFFFF00A5CFAB00439B4F00439B
      4F004A9F5600CEE5D100F1F8F200F0F7F100CEE5D1004A9F5600439B4F00439B
      4F00439B4F00439B4F00A7D0AC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFD
      FE007980D0002C37B5002C37B5002C37B5002C37B5002C37B5002C37B500737A
      CE00FCFCFE00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00000000002E2E2E003333
      3300333333003333330033333300333333003333330033333300333333003333
      3300333333002D2D2D0000000000FFFFFF00FFFFFF008BC19200439B4F00439B
      4F00ABD2B000F1F8F20066AE700066AD6F00F0F7F100CEE5D1004A9F5600439B
      4F00439B4F00439B4F008CC29300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFE007980D0002C37B5002C37B5002C37B5002C37B500737ACE00FCFC
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000303030003333
      3300333333003333330039393900444444004848480044444400393939003333
      3300333333002C2C2C0000000000FFFFFF00FFFFFF008AC19100439B4F00439B
      4F004DA0590063AC6D00439B4F00439B4F0066AD6F00F0F7F100CEE5D1004A9F
      5600439B4F00439B4F008BC19300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FDFDFE007A81D0002C37B5002C37B5002C37B5002C37B500747BCE00FCFC
      FE00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000000000202020003333
      330033333300484848005B5B5B00686868006D6D6D00686868005B5B5B004848
      4800333333001D1D1D0000000000FFFFFF00FFFFFF00A5CFAB00439B4F00439B
      4F00439B4F00439B4F00439B4F00439B4F00439B4F0066AD6F00F0F7F100D1E7
      D4004CA05700439B4F00A7D0AC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFD
      FE007A81D0002C37B5002C37B5002C37B5002C37B5002C37B5002C37B500747B
      CE00FCFCFE00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00242424000C0C0C003232
      320048484800646464007B7B7B008B8B8B00919191008B8B8B007B7B7B006464
      6400464646000B0B0B0024242400FFFFFF00FFFFFF00E0EFE200449B5000439B
      4F00439B4F00439B4F00439B4F00439B4F00439B4F00439B4F0066AD6F00E6F2
      E80066AD6F00449B5000E1EFE300FFFFFF00FFFFFF00FFFFFF00FDFDFE00787F
      D0002C37B5002C37B5002C37B500787FD000787FD0002C37B5002C37B5002C37
      B500777ECF00FDFDFE00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF009A9A9A00010101002626
      26005B5B5B007B7B7B0098989800ADADAD00B6B6B600ADADAD00989898007B7B
      7B0037373700010101009A9A9A00FFFFFF00FFFFFF00FFFFFF0085BE8C00439B
      4F00439B4F00439B4F00439B4F00439B4F00439B4F00439B4F00439B4F00479D
      5200439B4F0087BF8E00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A5AADF002C37
      B5002C37B5002C37B500787FD000FDFDFE00FDFDFE00787FD0002C37B5002C37
      B5002C37B500A5AADF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF003E3E3E000707
      07004646460089898900ADADAD00CCCCCC00DBDBDB00CCCCCC00A9A9A9005959
      59000707070042424200FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F9F50063AC
      6D00439B4F00439B4F00439B4F00439B4F00439B4F00439B4F00439B4F00439B
      4F0064AD6E00F5FAF500FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9EBF7004B54
      C0002C37B500787FD000FDFDFE00FFFFFF00FFFFFF00FDFDFE00787FD0002C37
      B5004B54C000E9EBF700FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF004343
      430002020200282828007A7A7A00CBCBCB00EFEFEF008A8A8A002A2A2A000202
      02004C4C4C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4F9
      F50085BE8C00449B5000439B4F00439B4F00439B4F00439B4F00449B500085BE
      8D00F5FAF500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E9EB
      F700A5AADF00FDFDFE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FDFDFE00A6AA
      E000E9EBF700FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A4A4A40037373700010101000101010001010100010101003E3E3E00ABAB
      AB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00E0EFE200A6D0AB008AC191008AC19100A6D0AB00E1EFE300FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A0E390002AB4190000990000019A0000019A0000009900002AB41900A1E3
      9100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0090B0E600193CB9000001990000019A0000019A0000019900193BB90091B0
      E700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00ABF2FF0036DBFF0001CCFF0001CCFF0001CCFF0001CCFF0035DAFF00ABF2
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DDDDDD00AAAAAA008F8F8F0090909000909090008F8F8F00A9A9A900DDDD
      DD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0044BF
      3100019A00000DA6000025BE000037D0000034CD000022BB00000EA70000019A
      000043BE3100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003157
      C60000029A00001AAD00004DD5000070F3000069EE000044CF00001CAF000002
      9A003155C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0051E0
      FF0001CCFF0016D3FF0041E2FF005FECFF0059EAFF003ADFFF0018D4FF0001CC
      FF004FDFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B6B6
      B600909090009B9B9B00B4B4B400C5C5C500C2C2C200B0B0B0009C9C9C009090
      9000B5B5B500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0043BE3100059E
      000025BE000035CE000033CC000031CA000031CA000031CA000031CA00001EB7
      0000049D000041BD3100FFFFFF00FFFFFF00FFFFFF00FFFFFF003155C600000A
      A100004AD800006CFD000069FF000065FF000063FF000065FF000065FB00003E
      D20000089F003151C600FFFFFF00FFFFFF00FFFFFF00FFFFFF004FDFFF0008CF
      FF0040E1FF005EEBFF005BEAFF0058E9FF0057E9FF0058E9FF0057E9FF0036DE
      FF0006CEFF004CDFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5B5B5009494
      9400B4B4B400C5C5C500C4C4C400C2C2C200C2C2C200C2C2C200C2C2C200AEAE
      AE0093939300B4B4B400FFFFFF00FFFFFF00FFFFFF009EE09100019A000021BA
      00002FC800002AC3000026BF000024BD000023BC000024BD000026BF00002AC3
      00001BB40000019A00009CDE9100FFFFFF00FFFFFF0091ABE60000029B000043
      D900005FFF000056FF00004EFF00004AFF000049FF00004AFF00004EFF000056
      FF000037D40000019A0091A8E600FFFFFF00FFFFFF00A7F0FF0002CDFF003ADF
      FF0054E8FF004DE6FF0047E4FF0044E3FF0043E2FF0044E3FF0047E4FF004DE6
      FF0031DCFF0001CCFF00A4EFFF00FFFFFF00FFFFFF00DBDBDB0090909000B1B1
      B100C0C0C000BDBDBD00BABABA00B8B8B800B8B8B800B8B8B800BABABA00BDBD
      BD00ABABAB0090909000DADADA00FFFFFF00FFFFFF0026B019000CA5000028C1
      000023BC00001DB6000019B2000017B0000016AF000017B0000019B200001DB6
      000022BB000007A0000024AE1900FFFFFF00FFFFFF001932B9000018B2000053
      FD000047FF00003DFF000035FF000030FF00002EFF000030FF000035FF00003D
      FF000044FB00000FAB00192FB900FFFFFF00FFFFFF002FD8FF0015D3FF004AE4
      FF0042E2FF003ADFFF0034DDFF0031DCFF002FDCFF0031DCFF0034DDFF003ADF
      FF0040E1FF000ED1FF002CD7FF00FFFFFF00FFFFFF00A7A7A7009B9B9B00BBBB
      BB00B7B7B700B3B3B300B0B0B000AEAEAE00AEAEAE00AEAEAE00B0B0B000B3B3
      B300B6B6B60097979700A5A5A500FFFFFF00FFFFFF000099000018B100001EB7
      000017B0000011AA00000CA500000AA3000009A200000AA300000CA5000011AA
      000017B0000010A9000000990000FFFFFF00FFFFFF00000099000031D900003E
      FF000030FF000024FF00001BFF000016FF000013FF000016FF00001BFF000024
      FF000030FF000022D10000009900FFFFFF00FFFFFF0000CCFF002CDBFF003BE0
      FF0031DCFF0028D9FF0021D7FF001DD6FF001BD5FF001DD6FF0021D7FF0028D9
      FF0031DCFF0020D7FF0000CCFF00FFFFFF00FFFFFF008F8F8F00AAAAAA00B4B4
      B400AEAEAE00AAAAAA00A6A6A600A4A4A400A4A4A400A4A4A400A6A6A600AAAA
      AA00AEAEAE00A3A3A3008F8F8F00FFFFFF00FFFFFF000099000019B2000014AD
      00000CA50000059E0000019901000B9D0B000E9F0E000B9D0B0001990100059E
      00000CA5000012AB000000990000FFFFFF00FFFFFF00000099000035F500002A
      FF000019FF00000CFF000002FF000707FF000B0BFF000707FF000002FF00000C
      FF000019FF000025F30000009900FFFFFF00FFFFFF0000CCFF0033DDFF002BDA
      FF001FD6FF0016D3FF000ED1FF0009CFFF0007CEFF0009CFFF000ED1FF0016D3
      FF001FD6FF0026D8FF0000CCFF00FFFFFF00FFFFFF008F8F8F00AFAFAF00ACAC
      AC00A6A6A600A1A1A1009D9D9D009A9A9A009A9A9A009A9A9A009D9D9D00A1A1
      A100A6A6A600A8A8A8008F8F8F00FFFFFF00FFFFFF000099000013AC00000AA3
      0000019A000015A1150027A9270033AD330037AF370033AD330027A9270015A1
      1500019A000009A2000000990000FFFFFF00FFFFFF00000099000027F9000016
      FF000004FF001212FF002424FF003030FF003434FF003030FF002424FF001212
      FF000004FF000013F10000009900FFFFFF00FFFFFF0000CCFF0028D9FF001DD6
      FF000FD1FF0004CDFF000BCEFF0018D1FF001DD2FF0018D1FF000BCEFF0004CD
      FF000FD1FF0019D5FF0000CCFF00FFFFFF00FFFFFF008F8F8F00AAAAAA00A4A4
      A4009E9E9E009B9B9B00A3A3A300A8A8A800A9A9A900A8A8A800A3A3A3009B9B
      9B009E9E9E00A1A1A1008F8F8F00FFFFFF00FFFFFF000099000008A10000019A
      00001CA41C0037AF37004DB84D005CBE5C0061C061005CBE5C004DB84D0037AF
      37001CA41C00019A000000990000FFFFFF00FFFFFF00000099000010D9000004
      FF001919FF003434FF004A4AFF005858FF005D5DFF005858FF004A4AFF003434
      FF001919FF000002D40000009900FFFFFF00FFFFFF0000CCFF0014D2FF000FD1
      FF0000CCFF001DD2FF0035D7FF0045DAFF004ADBFF0045DAFF0035D7FF001DD2
      FF0000CCFF0009CFFF0000CCFF00FFFFFF00FFFFFF008F8F8F009E9E9E009E9E
      9E009E9E9E00A9A9A900B2B2B200B9B9B900BBBBBB00B9B9B900B2B2B200A9A9
      A9009E9E9E00989898008F8F8F00FFFFFF00FFFFFF001DA71900019A000015A1
      150037AF370057BC570071C6710083CD83008AD08A0083CD830071C6710057BC
      570035AE3500059B05001AA41900FFFFFF00FFFFFF001921B9000003B1001212
      FD003434FF005454FF006E6EFF008080FF008787FF008080FF006E6EFF005454
      FF003232FC000404AF00191CB900FFFFFF00FFFFFF0022D4FF0005CEFF0004CD
      FF001DD2FF003FD9FF005CDEFF0070E2FF0077E4FF0070E2FF005CDEFF003FD9
      FF001CD2FF0001CCFF001ED3FF00FFFFFF00FFFFFF009F9F9F00939393009B9B
      9B00A9A9A900B6B6B600C1C1C100C9C9C900CCCCCC00C9C9C900C1C1C100B6B6
      B600A8A8A800929292009E9E9E00FFFFFF00FFFFFF0092D59000009900001AA4
      1A004DB84D0071C6710091D39100AADDAA00B3E1B300AADDAA0091D3910071C6
      71002FAC2F000099000091D39100FFFFFF00FFFFFF009095E60000009A001818
      DD004A4AFF006E6EFF008E8EFF00A6A6FF00B0B0FF00A6A6FF008E8EFF006E6E
      FF002D2DD70000009A009191E600FFFFFF00FFFFFF0096EBFF0000CCFF0007CD
      FF0035D7FF005CDEFF007FE5FF009AEBFF00A5EDFF009AEBFF007FE5FF005CDE
      FF0020D3FF0000CCFF0094EAFF00FFFFFF00FFFFFF00D3D3D3008F8F8F009C9C
      9C00B2B2B200C1C1C100CFCFCF00D9D9D900DDDDDD00D9D9D900CFCFCF00C1C1
      C100A4A4A4008F8F8F00D1D1D100FFFFFF00FFFFFF00FFFFFF0033AD3300059B
      05003EB23E0081CC8100AADDAA00CCEBCC00DDF1DD00CCEBCC00A6DBA60054BA
      5400069B06003EB13E00FFFFFF00FFFFFF00FFFFFF00FFFFFF003333C6000505
      A3003B3BDD007E7EFD00A6A6FF00C8C8FF00D9D9FF00C8C8FF00A2A2FD005252
      DB000606A0003D3DC600FFFFFF00FFFFFF00FFFFFF00FFFFFF0033D7FF0002CD
      FF002ED5FF006EE2FF009AEBFF00BFF2FF00D2F6FF00BFF2FF0096EAFF0048DA
      FF0005CDFF0037D7FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A7A7A7009292
      9200ABABAB00C8C8C800D9D9D900E7E7E700EEEEEE00E7E7E700D7D7D700B4B4
      B40092929200ABABAB00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003FB2
      3F00029A020026A8260078C97800CDEACD00EFF9EF008CD18C0029AA2900029A
      020049B64900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003E3E
      C60001019B002626B5007676DD00C9C9F700EFEFF9008989D9002929B1000202
      9A004848C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0038D7
      FF0001CCFF0021D3FF006FE2FF00C2F3FF00EFFCFF0085E7FF0026D4FF0001CC
      FF0044DAFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ABAB
      AB0090909000A0A0A000C3C3C300E7E7E700F8F8F800CBCBCB00A1A1A1009090
      9000AFAFAF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A1DAA10035AE3500019901000199010001990100019901003EB13E00A9DD
      A900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A1A1E6003535B900010199000101990001019900010199003D3DB900A8A8
      E600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009DEBFF0031D6FF0001CCFF0001CCFF0001CCFF0001CCFF003AD7FF00A5ED
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00D6D6D600A7A7A7008F8F8F008F8F8F008F8F8F008F8F8F00AAAAAA00D9D9
      D900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object pmLegendas: TPopupMenu
    Images = imgListLegenda
    Left = 420
    Top = 23
    object mniAtivo1: TMenuItem
      Caption = 'Ativo'
      ImageIndex = 0
    end
    object mniBloqueado: TMenuItem
      Caption = 'Bloqueado'
      ImageIndex = 1
    end
    object mniAtencao: TMenuItem
      Caption = 'Aten'#231#227'o'
      ImageIndex = 2
    end
    object mniInativo: TMenuItem
      Caption = 'Inativo'
      ImageIndex = 3
    end
    object Prospecto1: TMenuItem
      Caption = 'Prospecto'
      ImageIndex = 4
    end
    object mniExiste: TMenuItem
      Caption = 'Existe'
      ImageIndex = 5
    end
    object mniNaoExiste: TMenuItem
      Caption = 'N'#227'o Existe'
      ImageIndex = 6
    end
  end
end
