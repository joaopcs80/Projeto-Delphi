unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, RxColors;

type
  TfrmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    Label3: TLabel;
    pnlFundo: TPanel;
    pnlAcessar: TPanel;
    pnlFechar: TPanel;
    shpAcessar: TShape;
    shpFechar: TShape;
    lblAcessar: TLabel;
    lblFechar: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnAcessarClick(Sender: TObject);
    procedure lblAcessarClick(Sender: TObject);
    procedure lblFecharClick(Sender: TObject);
    procedure lblAcessarMouseLeave(Sender: TObject);
    procedure lblAcessarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure lblFecharMouseLeave(Sender: TObject);
    procedure lblFecharMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    bFechar:Boolean;
    procedure FecharAplicacao;
    procedure FecharFormulario;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses cCadUsuario, uDTMConexao, uPrincipal;

{$R *.dfm}

{$REGION 'Botões'}

procedure TfrmLogin.btnAcessarClick(Sender: TObject);
var oUsuario:TUsuario;
begin
  Try
    oUsuario:=TUsuario.Create(dtmPrincipal.ConexaoDB);
    if oUsuario.Logar(edtUsuario.Text,edtSenha.Text) then begin
       oUsuarioLogado.codigo := oUsuario.codigo;
       oUsuarioLogado.nome   := oUsuario.nome;
       oUsuarioLogado.senha  := oUsuario.senha;

       FecharFormulario //Fecha o Formulario do Login
    end
    else begin
      MessageDlg('Usuário Inválido',mtInformation,[mbok],0);
      edtUsuario.SetFocus;
    end;

  Finally
    if Assigned(oUsuario) then
       FreeAndNil(oUsuario);
  End;
end;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin
  FecharAplicacao;
end;

{$ENDREGION}

{$REGION 'Forms'}

procedure TfrmLogin.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose:=bFechar;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  bFechar:=False;
  edtUsuario.SetFocus;
end;

procedure TfrmLogin.lblAcessarClick(Sender: TObject);
var oUsuario:TUsuario;
begin
  Try
    oUsuario:=TUsuario.Create(dtmPrincipal.ConexaoDB);
    if oUsuario.Logar(edtUsuario.Text,edtSenha.Text) then begin
       oUsuarioLogado.codigo := oUsuario.codigo;
       oUsuarioLogado.nome   := oUsuario.nome;
       oUsuarioLogado.senha  := oUsuario.senha;

       FecharFormulario //Fecha o Formulario do Login
    end
    else begin
      MessageDlg('Usuário Inválido',mtInformation,[mbok],0);
      edtUsuario.SetFocus;
    end;

  Finally
    if Assigned(oUsuario) then
       FreeAndNil(oUsuario);
  End;
end;

procedure TfrmLogin.lblFecharClick(Sender: TObject);
begin
  FecharAplicacao;
end;

{$ENDREGION}

{$REGION 'Animacao Botoes'}

//btnAcessar
procedure TfrmLogin.lblAcessarMouseLeave(Sender: TObject);
begin
  shpAcessar.Brush.Color :=clHtmLightGoldenrod1;
end;

procedure TfrmLogin.lblAcessarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  shpAcessar.Brush.Color :=clHtmGold1;
end;

//btnCancelar
procedure TfrmLogin.lblFecharMouseLeave(Sender: TObject);
begin
  shpFechar.Brush.Color :=clHtmFirebrick2;
end;

procedure TfrmLogin.lblFecharMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  shpFechar.Brush.Color :=clHtmFirebrick3;
end;

{$ENDREGION}

{$REGION 'Processos'}

procedure TfrmLogin.FecharAplicacao;
begin
  bFechar := True;
  Application.Terminate;
end;

procedure TfrmLogin.FecharFormulario;
begin
  bFechar := True;
  Close;
end;

{$ENDREGION}

end.
