unit uPDVIdentificarClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmPDVIdentificarClientes = class(TForm)
    pnlIdentificacaoCliente: TPanel;
    Panel2: TPanel;
    Shape1: TShape;
    pnlCPFCNPJ: TPanel;
    Label1: TLabel;
    Shape2: TShape;
    edtCPFCnpj: TEdit;
    pnlNome: TPanel;
    Label2: TLabel;
    Shape3: TShape;
    edtNome: TEdit;
    pnlButton: TPanel;
    Panel5: TPanel;
    Shape4: TShape;
    Panel6: TPanel;
    Panel7: TPanel;
    Image1: TImage;
    Panel8: TPanel;
    Panel9: TPanel;
    Shape5: TShape;
    Panel10: TPanel;
    Panel11: TPanel;
    Image4: TImage;
    Panel12: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Panel11Click(Sender: TObject);
  private
    FProc: TProc<String, String>;
  public
    class function New(AOWner: TComponent): TfrmPDVIdentificarClientes;
    function Embed(Value: TWinControl): TfrmPDVIdentificarClientes;
    function IdentificaCPF: TfrmPDVIdentificarClientes;
    function IdentificarCliente(Value: TProc<String, String>): TfrmPDVIdentificarClientes;
  end;

var
  frmPDVIdentificarClientes: TfrmPDVIdentificarClientes;

implementation

{$R *.dfm}

function TfrmPDVIdentificarClientes.Embed(
  Value: TWinControl): TfrmPDVIdentificarClientes;
begin
  Result := Self;
  Self.Parent := Value;
end;

procedure TfrmPDVIdentificarClientes.FormResize(Sender: TObject);
var
  lHeigth, lWidth: Integer;
begin
  lHeigth := Round((Self.Height - pnlIdentificacaoCliente.Height)/2);
  lWidth := Round((Self.Width - pnlIdentificacaoCliente.Width)/2);

  pnlIdentificacaoCliente.Margins.Left := lWidth;
  pnlIdentificacaoCliente.Margins.Right := lWidth;
  pnlIdentificacaoCliente.Margins.Top := lHeigth;
  pnlIdentificacaoCliente.Margins.Bottom := lHeigth;
  pnlIdentificacaoCliente.Align := alClient;
end;

procedure TfrmPDVIdentificarClientes.FormShow(Sender: TObject);
begin
  edtCPFCnpj.SetFocus;
end;

function TfrmPDVIdentificarClientes.IdentificaCPF: TfrmPDVIdentificarClientes;
begin
  Result := Self;
  pnlNome.Visible := False;
  pnlIdentificacaoCliente.Height := (pnlIdentificacaoCliente.Height-pnlNome.Height);
end;

function TfrmPDVIdentificarClientes.IdentificarCliente(
  Value: TProc<String, String>): TfrmPDVIdentificarClientes;
begin
  Result := Self;
  FProc := Value;
end;

class function TfrmPDVIdentificarClientes.New(
  AOWner: TComponent): TfrmPDVIdentificarClientes;
begin
  Result := Self.Create(AOWner);
end;

procedure TfrmPDVIdentificarClientes.Panel11Click(Sender: TObject);
begin
  if Assigned(FProc) then
    FProc(edtCPFCnpj.Text, edtNome.Text);
  Self.Close;
end;

end.
