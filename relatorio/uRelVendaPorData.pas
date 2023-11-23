unit uRelVendaPorData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RLReport,
  RLFilters, RLPDFFilter, RLHTMLFilter, RLXLSFilter;

type
  TfrmRelProVendaPorData = class(TForm)
    QryVendas: TZQuery;
    dtsVenda: TDataSource;
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
    BandaDoGrupo: TRLGroup;
    RLBand3: TRLBand;
    RLBand2: TRLBand;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLLabel8: TRLLabel;
    RLBand4: TRLBand;
    RLDraw4: TRLDraw;
    RLDBResult1: TRLDBResult;
    RLLabel11: TRLLabel;
    QryVendasvendaId: TIntegerField;
    QryVendasclienteId: TIntegerField;
    QryVendasnome: TWideStringField;
    QryVendasdataVenda: TDateTimeField;
    QryVendastotalVenda: TFloatField;
    RLBand5: TRLBand;
    RLDBResult2: TRLDBResult;
    RLLabel6: TRLLabel;
    RLDraw3: TRLDraw;
    RLPanel1: TRLPanel;
    RLLabel5: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel9: TRLLabel;
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelProVendaPorData: TfrmRelProVendaPorData;

implementation


{$R *.dfm}

procedure TfrmRelProVendaPorData.FormDestroy(Sender: TObject);
begin
  QryVendas.Close;
end;

end.
