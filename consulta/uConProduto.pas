unit uConProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    lblIndice: TLabel;
    mskPesquisa: TMaskEdit;
    grdPesquisa: TDBGrid;
    dtsListagem: TDataSource;
    QryListagem: TZQuery;
    pnlImagem: TPanel;
    pnlFundo: TPanel;
    imgImagem: TImage;
    lblProduto: TLabel;
    shpImagem: TShape;
    QryListagemprodutoId: TIntegerField;
    QryListagemnome: TWideStringField;
    QryListagemdescricao: TWideStringField;
    QryListagemvalor: TFloatField;
    QryListagemquantidade: TFloatField;
    QryListagemcategoriaId: TIntegerField;
    QryListagemDescricaoCategoria: TWideStringField;
    Panel3: TPanel;
    btnFechar: TBitBtn;
    procedure grdPesquisaCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.grdPesquisaCellClick(Column: TColumn);
var
Produto:string;
begin

  Produto := grdPesquisa.Columns.Items[0].Field.Text;

  lblProduto.Caption := Produto



end;

end.
