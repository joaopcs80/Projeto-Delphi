unit uSelecionarData;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, RxToolEdit, Vcl.Buttons, System.DateUtils, Vcl.ExtCtrls,
  RxColors, cUsuarioLogado, Vcl.Imaging.jpeg, JvExExtCtrls, JvImage ;

type
  TfrmSelecionarData = class(TForm)
    edtDataInicio: TDateEdit;
    Label3: TLabel;
    edtDataFinal: TDateEdit;
    Label1: TLabel;
    pnlAcessar: TPanel;
    shpAcessar: TShape;
    lblAcessar: TLabel;
    pnlFechar: TPanel;
    shpFechar: TShape;
    lblFechar: TLabel;
    pnlFundo: TPanel;
    imgFundo: TJvImage;
    procedure FormShow(Sender: TObject);
    procedure lblAcessarClick(Sender: TObject);
    procedure lblFecharClick(Sender: TObject);
    procedure lblAcessarMouseLeave(Sender: TObject);
    procedure lblAcessarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lblFecharMouseLeave(Sender: TObject);
    procedure lblFecharMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelecionarData: TfrmSelecionarData;
  oUsuarioLogado: TUsuarioLogado;

implementation

{$R *.dfm}

uses uRelVendaPorData, uDTMConexao;

procedure TfrmSelecionarData.FormShow(Sender: TObject);
begin
  edtDataInicio.Date := StartOfTheMonth(Date);
  edtDataFinal.Date  := EndOfTheMonth(Date);
end;

procedure TfrmSelecionarData.lblAcessarClick(Sender: TObject);
begin


  if (edtDataFinal.Date) < (edtDataInicio.Date) then begin
    MessageDlg('Data Final não pode ser maior que a data inicio',mtInformation,[mbok],0);
    edtDataFinal.SetFocus;
    Abort;
  end;

  if (edtDataFinal.Date=0) or (edtDataInicio.Date=0) then begin
    MessageDlg('Data Inicial ou Final são Campos Obrigatórios',mtInformation,[mbOK],0);
    edtDataInicio.SetFocus;
    Abort;
  end;

  frmSelecionarData:=TfrmSelecionarData.Create(self);

  frmRelProVendaPorData:=TfrmRelProVendaPorData.Create(self);
  frmRelProVendaPorData.QryVendas.Close;
  frmRelProVendaPorData.QryVendas.ParamByName('DataInicio').AsDate:=edtDataInicio.Date;
  frmRelProVendaPorData.QryVendas.ParamByName('DataFim').AsDate:=edtDataFinal.Date;
  frmRelProVendaPorData.QryVendas.Open;
  frmRelProVendaPorData.Relatorio.PreviewModal;

end;

procedure TfrmSelecionarData.lblFecharClick(Sender: TObject);
begin
  Close;
end;

 {$REGION 'Animacao dos botoes'}

procedure TfrmSelecionarData.lblAcessarMouseLeave(Sender: TObject);
begin
  shpAcessar.Brush.Color :=clHtmLightGoldenrod1;
end;

procedure TfrmSelecionarData.lblAcessarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  shpAcessar.Brush.Color :=clHtmGold1;
end;

procedure TfrmSelecionarData.lblFecharMouseLeave(Sender: TObject);
begin
  shpFechar.Brush.Color :=clHtmFirebrick2;
end;

procedure TfrmSelecionarData.lblFecharMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  shpFechar.Brush.Color :=clHtmFirebrick3;
end;

 {$ENDREGION}

end.
