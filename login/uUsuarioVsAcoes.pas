unit uUsuarioVsAcoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids,
  Vcl.DBGrids, uDTMConexao, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.jpeg, JvExExtCtrls, JvImage, PngSpeedButton;

type
  TfrmUsuarioVsAcoes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Splitter1: TSplitter;
    grdAcoes: TDBGrid;
    grdUsuarios: TDBGrid;
    QryAcoes: TZQuery;
    QryUsuario: TZQuery;
    dtsAcoes: TDataSource;
    dtsUsuario: TDataSource;
    QryUsuariousuarioId: TIntegerField;
    QryUsuarionome: TWideStringField;
    QryAcoesusuarioId: TIntegerField;
    QryAcoesacaoAcessoId: TIntegerField;
    QryAcoesdescricao: TWideStringField;
    QryAcoesativo: TBooleanField;
    btnFechar: TPngSpeedButton;
    imgFundo: TJvImage;
    procedure btnFecharClick(Sender: TObject);
    procedure QryUsuarioAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure grdAcoesDblClick(Sender: TObject);
    procedure grdAcoesDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure SelecionarAcoesAcessoPorUsuario;
  public
    { Public declarations }
  end;

var
  frmUsuarioVsAcoes: TfrmUsuarioVsAcoes;

implementation

{$R *.dfm}

{$REGION 'Bot�es'}
procedure TfrmUsuarioVsAcoes.btnFecharClick(Sender: TObject);
begin
  Close;
end;
{$ENDREGION}

{$REGION 'Grids'}
procedure TfrmUsuarioVsAcoes.grdAcoesDblClick(Sender: TObject);
var Qry:TZQuery;
    bmRegistroAtual:TBookmark;
begin
  try
    bmRegistroAtual := QryAcoes.GetBookMark; //Marcar o Registro Selecionado
    Qry:=TZQuery.Create(nil);
    Qry.Connection:=DtmPrincipal.ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE usuariosAcaoAcesso '+
                '   SET ativo=:ativo '+
                ' WHERE usuarioId=:usuarioId '+
                '   AND acaoAcessoId=:acaoAcessoId ');
    Qry.ParamByName('usuarioId').AsInteger    :=QryAcoes.FieldByName('usuarioId').AsInteger;
    Qry.ParamByName('acaoAcessoId').AsInteger :=QryAcoes.FieldByName('acaoAcessoId').AsInteger;
    Qry.ParamByName('ativo').AsBoolean        :=not QryAcoes.FieldByName('ativo').AsBoolean;
    Try

      DtmPrincipal.ConexaoDB.StartTransaction;
      Qry.ExecSQL;
      DtmPrincipal.ConexaoDB.Commit;
    Except
      DtmPrincipal.ConexaoDB.Rollback;
    End;

  finally
    SelecionarAcoesAcessoPorUsuario;
    QryAcoes.GotoBookMark(bmRegistroAtual);  //Faz o Retorno do Registro depois que a query foi fechada e aberta
    if Assigned(Qry) then
       FreeAndNil(Qry);
  end;
end;


procedure TfrmUsuarioVsAcoes.grdAcoesDrawColumnCell(Sender: TObject; const Rect: TRect;
          DataCol: Integer; Column: TColumn;
          State: TGridDrawState);
begin
  If not QryAcoes.FieldByName('ativo').AsBoolean  then
  begin
    TDBGrid(Sender).Canvas.Font.Color:= clWhite;
    TDBGrid(Sender).Canvas.Brush.Color:=clRed
  end;
  TDBGrid(Sender).DefaultDrawDataCell(Rect, TDBGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmUsuarioVsAcoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  grdUsuarios.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadUsuarioVsAcoes.cfg');

end;

procedure TfrmUsuarioVsAcoes.FormShow(Sender: TObject);
begin
  Try
    QryUsuario.DisableControls;
    QryUsuario.Open;
    SelecionarAcoesAcessoPorUsuario;
  Finally
    QryUsuario.EnableControls;
  End;

  if not FileExists(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadUsuarioVsAcoes.cfg') then begin
    grdUsuarios.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadUsuarioVsAcoes.cfg');
  end;

  grdUsuarios.Columns.LoadFromFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadUsuarioVsAcoes.cfg');

end;
{$ENDREGION}

{$REGION 'Processos'}
procedure TfrmUsuarioVsAcoes.QryUsuarioAfterScroll(DataSet: TDataSet);
begin
  SelecionarAcoesAcessoPorUsuario;
end;

procedure TfrmUsuarioVsAcoes.SelecionarAcoesAcessoPorUsuario;
begin
  QryAcoes.Close;
  QryAcoes.ParamByName('usuarioId').AsInteger := QryUsuario.FieldByName('usuarioID').AsInteger;
  QryAcoes.Open;
end;
{$ENDREGION}

end.
