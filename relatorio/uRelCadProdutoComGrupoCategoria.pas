unit uRelCadProdutoComGrupoCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RLReport,
  RLFilters, RLPDFFilter, RLHTMLFilter, RLXLSFilter;

type
  TfrmRelCadProdutoComGrupoCategoria = class(TForm)
    QryProdutos: TZQuery;
    dtsProdutos: TDataSource;
    Relatorio: TRLReport;
    Cabecalho: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLPDFFilter1: TRLPDFFilter;
    Rodape: TRLBand;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLXLSFilter1: TRLXLSFilter;
    RLHTMLFilter1: TRLHTMLFilter;
    QryProdutosprodutoId: TIntegerField;
    QryProdutosNome: TWideStringField;
    QryProdutosValor: TFloatField;
    QryProdutosQuantidade: TFloatField;
    QryProdutosdescricao: TWideStringField;
    QryProdutoscategoriaId: TIntegerField;
    QryProdutosDescricaoCategoria: TWideStringField;
    BandaDoGrupo: TRLGroup;
    RLBand3: TRLBand;
    RLBand2: TRLBand;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel10: TRLLabel;
    RLBand4: TRLBand;
    RLDraw4: TRLDraw;
    RLDBResult1: TRLDBResult;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLDBResult2: TRLDBResult;
    RLPanel1: TRLPanel;
    RLLabel5: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel13: TRLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadProdutoComGrupoCategoria: TfrmRelCadProdutoComGrupoCategoria;

implementation


{$R *.dfm}

procedure TfrmRelCadProdutoComGrupoCategoria.FormCreate(Sender: TObject);
begin
  QryProdutos.Open;
end;

procedure TfrmRelCadProdutoComGrupoCategoria.FormDestroy(Sender: TObject);
begin
  QryProdutos.Close;
end;

end.
