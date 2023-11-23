inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categorias'
  ClientHeight = 400
  ClientWidth = 371
  ExplicitWidth = 377
  ExplicitHeight = 429
  PixelsPerInch = 96
  TextHeight = 13
  inherited imgFundo: TJvImage
    Width = 371
    Height = 400
    ExplicitWidth = 371
    ExplicitHeight = 400
  end
  inherited pgcPrincipal: TPageControl
    Width = 371
    Height = 328
    ActivePage = tabManutencao
    Font.Color = 1560829
    ParentFont = False
    ExplicitWidth = 371
    ExplicitHeight = 328
    inherited tabListagem: TTabSheet
      Font.Color = clBlack
      ParentFont = False
      ExplicitWidth = 363
      ExplicitHeight = 300
      inherited pnlFundoPesquisa: TPanel [0]
        Width = 363
        ExplicitWidth = 363
        inherited imgFundoPesquisa: TJvImage
          Width = 363
          Visible = False
          ExplicitWidth = 363
          ExplicitHeight = 300
        end
        inherited pnlListagemTopo: TPanel
          Width = 359
          Anchors = [akLeft, akTop, akRight, akBottom]
          ParentBackground = False
          ExplicitWidth = 359
          inherited lblIndice: TLabel
            Margins.Bottom = 0
          end
        end
      end
      inherited grdListagem: TDBGrid [1]
        Width = 363
        Height = 243
        GradientEndColor = 4380153
        GradientStartColor = 49121
        TitleFont.Color = clBlack
        Columns = <
          item
            Expanded = False
            FieldName = 'categoriaId'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Alignment = taCenter
            Title.Color = clBlack
            Width = 296
            Visible = True
          end>
      end
    end
    inherited tabManutencao: TTabSheet
      Font.Color = 1560829
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 363
      ExplicitHeight = 300
      inherited imgFundoManutencao: TJvImage
        Width = 363
        Height = 300
        ExplicitWidth = 363
        ExplicitHeight = 300
      end
      object lblCategoriaId: TLabel
        Left = 3
        Top = 21
        Width = 38
        Height = 13
        Caption = 'C'#243'digo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1560829
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object lblDescricao: TLabel
        Left = 4
        Top = 77
        Width = 55
        Height = 13
        Caption = 'Descri'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 1560829
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object edtCategoriaId: TEdit
        Left = 3
        Top = 40
        Width = 121
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object edtDescricao: TEdit
        Left = 4
        Top = 94
        Width = 349
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  inherited pnlrodape: TPanel
    Top = 349
    Width = 371
    ExplicitTop = 349
    ExplicitWidth = 371
    inherited btnSair: TPngSpeedButton
      Left = 327
      ExplicitLeft = 327
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT categoriaId,'
      '       descricao'
      '   FROM categorias')
    object QryListagemcategoriaId: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryListagemdescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 30
    end
  end
end
