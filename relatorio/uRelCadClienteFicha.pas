unit uRelCadClienteFicha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDTMConexao, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, RLReport,
  RLFilters, RLPDFFilter, RLHTMLFilter, RLXLSFilter, Vcl.Imaging.pngimage;

type
  TfrmRelCadClienteFicha = class(TForm)
    QryCliente: TZQuery;
    dtsCliente: TDataSource;
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
    RLBand1: TRLBand;
    RLDBText2: TRLDBText;
    RLBand2: TRLBand;
    RLXLSFilter1: TRLXLSFilter;
    RLHTMLFilter1: TRLHTMLFilter;
    RLDBText3: TRLDBText;
    QryClienteclienteId: TIntegerField;
    QryClientenome: TWideStringField;
    QryClientecep: TWideStringField;
    QryClienteendereco: TWideStringField;
    QryClientebairro: TWideStringField;
    QryClientecidade: TWideStringField;
    QryClienteestado: TWideStringField;
    QryClienteemail: TWideStringField;
    QryClientetelefone: TWideStringField;
    QryClientedataNascimento: TDateTimeField;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLLabel11: TRLLabel;
    RLDBText11: TRLDBText;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDBText12: TRLDBText;
    RLDraw3: TRLDraw;
    RLImage1: TRLImage;
    RLAngleLabel1: TRLAngleLabel;
    RLDBText1: TRLDBText;
    RLLabel14: TRLLabel;
    QryClientecpfcnpj: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCadClienteFicha: TfrmRelCadClienteFicha;

implementation


{$R *.dfm}

procedure TfrmRelCadClienteFicha.FormCreate(Sender: TObject);
begin
  QryCliente.Open;
end;

procedure TfrmRelCadClienteFicha.FormDestroy(Sender: TObject);
begin
  QryCliente.Close;
end;

end.
