unit uPDVDados;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, ZAbstractConnection, ZConnection;

type
  TdtmPDVConxao = class(TDataModule)
    ConexaoDB: TZConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsItensCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmPDVConxao: TdtmPDVConxao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdtmPDVConxao.cdsItensCalcFields(DataSet: TDataSet);
begin
  cdsItenssubtotal.AsCurrency := (cdsItensvalorunitario.AsCurrency * cdsItensquantidade.AsCurrency);
end;

procedure TdtmPDVConxao.DataModuleCreate(Sender: TObject);
begin
  cdsItens.Append;
  cdsItenscodigo.AsString := '0006';
  cdsItensItem.AsInteger := 1;
  cdsItensdescricao.AsString := 'COXA E SOBRE COXA SADIA BIO BD 1KG';
  cdsItensvalorunitario.AsCurrency := 16.50;
  cdsItensquantidade.AsCurrency := 1;
  cdsItens.Post;

  cdsItens.Append;
  cdsItenscodigo.AsString := '0008';
  cdsItensItem.AsInteger := 2;
  cdsItensdescricao.AsString :=
    'HOT POCKET SADIA X BURGUER MAIONESE GRILL 145G';
  cdsItensvalorunitario.AsCurrency := 5.60;
  cdsItensquantidade.AsCurrency := 1;
  cdsItens.Post;

  cdsItens.Append;
  cdsItenscodigo.AsString := '0003';
  cdsItensItem.AsInteger := 3;
  cdsItensdescricao.AsString := 'STEAK DE FRANGO SADIA 100G';
  cdsItensvalorunitario.AsCurrency := 2.50;
  cdsItensquantidade.AsCurrency := 1;
  cdsItens.Post;

  cdsItens.Open;
end;

end.
