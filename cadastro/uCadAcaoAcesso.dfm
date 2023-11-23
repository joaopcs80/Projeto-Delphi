inherited frmCadAcaoAcesso: TfrmCadAcaoAcesso
  Caption = 'Cadastro de A'#231#227'o de Acesso'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ActivePage = tabManutencao
    inherited tabListagem: TTabSheet
      Font.Color = clBlack
      ParentFont = False
      inherited grdListagem: TDBGrid
        GradientEndColor = 4380153
        GradientStartColor = 49121
        TitleFont.Color = clBlack
        Columns = <
          item
            Expanded = False
            FieldName = 'acaoAcessoId'
            Title.Alignment = taCenter
            Title.Color = clGray
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Alignment = taCenter
            Title.Color = clGray
            Width = 381
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'chave'
            Title.Alignment = taCenter
            Title.Color = clGray
            Width = 366
            Visible = True
          end>
      end
      inherited pnlFundoPesquisa: TPanel
        inherited pnlListagemTopo: TPanel
          inherited lblIndice: TLabel
            Margins.Bottom = 0
          end
        end
      end
    end
    inherited tabManutencao: TTabSheet
      Font.Color = 5235967
      object edtAcaoAcessoId: TLabeledEdit
        Tag = 1
        Left = 3
        Top = 32
        Width = 121
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
      object edtDescricao: TLabeledEdit
        Tag = 2
        Left = 3
        Top = 80
        Width = 678
        Height = 21
        EditLabel.Width = 55
        EditLabel.Height = 13
        EditLabel.Caption = 'Descri'#231#227'o'
        EditLabel.Color = clWhite
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = 1560829
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentColor = False
        EditLabel.ParentFont = False
        MaxLength = 100
        TabOrder = 1
      end
      object edtChave: TLabeledEdit
        Tag = 2
        Left = 3
        Top = 130
        Width = 678
        Height = 21
        EditLabel.Width = 35
        EditLabel.Height = 13
        EditLabel.Caption = 'Chave'
        EditLabel.Color = clWhite
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = 1560829
        EditLabel.Font.Height = -11
        EditLabel.Font.Name = 'Tahoma'
        EditLabel.Font.Style = [fsBold]
        EditLabel.ParentColor = False
        EditLabel.ParentFont = False
        MaxLength = 60
        TabOrder = 2
      end
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT acaoAcessoId, descricao, chave FROM acaoAcesso')
    object QryListagemacaoAcessoId: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'acaoAcessoId'
      ReadOnly = True
    end
    object QryListagemdescricao: TWideStringField
      DisplayLabel = 'Descricao'
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object QryListagemchave: TWideStringField
      DisplayLabel = 'Chave'
      FieldName = 'chave'
      Required = True
      Size = 60
    end
  end
end
