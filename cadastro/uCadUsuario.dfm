inherited frmCadUsuario: TfrmCadUsuario
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 392
  ClientWidth = 344
  ExplicitWidth = 344
  ExplicitHeight = 392
  PixelsPerInch = 96
  TextHeight = 13
  inherited imgFundo: TJvImage
    Width = 344
    Height = 392
    ExplicitWidth = 344
    ExplicitHeight = 392
  end
  inherited pgcPrincipal: TPageControl
    Width = 344
    Height = 320
    ExplicitWidth = 344
    ExplicitHeight = 320
    inherited tabListagem: TTabSheet
      Font.Color = clBlack
      ParentFont = False
      ExplicitWidth = 336
      ExplicitHeight = 292
      inherited grdListagem: TDBGrid
        Width = 336
        Height = 235
        GradientEndColor = 4380153
        GradientStartColor = 49121
        Font.Color = clBlack
        ParentFont = False
        Columns = <
          item
            Expanded = False
            FieldName = 'usuarioId'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBlack
            Title.Font.Height = -11
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 207
            Visible = True
          end>
      end
      inherited pnlFundoPesquisa: TPanel
        Width = 336
        ExplicitWidth = 336
        inherited imgFundoPesquisa: TJvImage
          Width = 336
          ExplicitTop = -4
          ExplicitWidth = 334
        end
        inherited pnlListagemTopo: TPanel
          Width = 336
          ExplicitWidth = 336
          inherited lblIndice: TLabel
            Margins.Bottom = 0
          end
        end
      end
    end
    inherited tabManutencao: TTabSheet
      ExplicitWidth = 336
      ExplicitHeight = 292
      inherited imgFundoManutencao: TJvImage
        Width = 336
        Height = 292
        ExplicitWidth = 336
        ExplicitHeight = 292
      end
      object edtUsuarioId: TLabeledEdit
        Tag = 1
        Left = 8
        Top = 32
        Width = 313
        Height = 21
        EditLabel.Width = 38
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = 1560829
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 8
        Top = 75
        Width = 313
        Height = 21
        EditLabel.Width = 43
        EditLabel.Height = 13
        EditLabel.Caption = 'Usu'#225'rio'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = 1560829
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        MaxLength = 50
        TabOrder = 1
      end
      object edtSenha: TLabeledEdit
        Tag = 2
        Left = 8
        Top = 123
        Width = 313
        Height = 21
        EditLabel.Width = 35
        EditLabel.Height = 13
        EditLabel.Caption = 'Senha'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = 1560829
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentFont = False
        MaxLength = 40
        PasswordChar = '*'
        TabOrder = 2
      end
    end
  end
  inherited pnlrodape: TPanel
    Top = 341
    Width = 344
    ExplicitTop = 341
    ExplicitWidth = 344
    inherited btnSair: TPngSpeedButton
      Left = 300
      ExplicitLeft = 300
    end
  end
  inherited pnlTop: TPanel
    Width = 344
    ExplicitWidth = 344
    inherited lblTiTulo: TLabel
      Width = 340
    end
  end
  inherited QryListagem: TZQuery
    Active = True
    SQL.Strings = (
      'SELECT usuarioId,'
      '       nome,'
      '       senha'
      '  FROM usuarios')
    Left = 52
    Top = 176
    object QryListagemusuarioId: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'usuarioId'
      ReadOnly = True
    end
    object QryListagemnome: TWideStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'nome'
      Required = True
      Size = 50
    end
    object QryListagemsenha: TWideStringField
      DisplayLabel = 'Senha'
      FieldName = 'senha'
      Required = True
      Size = 40
    end
  end
  inherited dtsListagem: TDataSource
    OnDataChange = dtsListagemDataChange
    Left = 124
    Top = 168
  end
end
