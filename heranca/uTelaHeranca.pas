unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, uDTMConexao, ZAbstractRODataset, ZAbstractDataset, ZDataset, uEnum, RxToolEdit,
  RxCurrEdit, ZAbstractConnection, ZConnection, cUsuarioLogado, Vcl.Imaging.pngimage, RxColors, PngSpeedButton, Math,
  Vcl.Imaging.jpeg, JvExExtCtrls, JvImage, cFuncao;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlrodape: TPanel;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    grdListagem: TDBGrid;
    QryListagem: TZQuery;
    dtsListagem: TDataSource;
    btnNovo: TPngSpeedButton;
    btnAlterar: TPngSpeedButton;
    btnVoltar: TPngSpeedButton;
    btnGravar: TPngSpeedButton;
    btnExcluir: TPngSpeedButton;
    btnSair: TPngSpeedButton;
    imgFundo: TJvImage;
    btnLegendas: TPngSpeedButton;
    imgFundoManutencao: TJvImage;
    pnlFundoPesquisa: TPanel;
    pnlListagemTopo: TPanel;
    lblIndice: TLabel;
    btnPesquisa: TPngSpeedButton;
    mskPesquisar: TMaskEdit;
    imgFundoPesquisa: TJvImage;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column:TColumn);
    procedure mskPesquisarChange(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
    procedure grdListagemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure imgPesquisarClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);

  private
    { Private declarations }
    SelectOriginal: string;
    F_Legendas: Boolean;
    procedure ControlarBotoes(pgcPrincipal: TpageControl; Flag:Boolean);
    procedure ControlarIndiceTab(pgcPrincipal: TpageControl; Indice: Integer);
    function RetornarCampoTraduzido(Campo: string): string;
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
    function ExisteCampoObrigatorio: Boolean;
    procedure DesabilitarEditPK;
    procedure LimparEdits;
    procedure CarregarDados;
  public
    { Public declarations }
    EstadoDoCadastro:TEstadoDoCadastro;
    IndiceAtual:string;
    iForm: TForm;
    function  Apagar:Boolean; virtual;
    function  Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean; virtual;
    procedure BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
    property pLegendas: Boolean Read F_Legendas Write F_Legendas;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

uses uPrincipal;

{$REGION 'OBSEERVA�OES'}
 //TAG: 1 - Chave Prim�ria - PK
 //TAG: 2 - Campos Obrigat�rios
{$ENDREGION}

{$REGION 'FUN��ES E PROCESSOS'}

procedure TfrmTelaHeranca.BloqueiaCTRL_DEL_DBGrid (var Key: Word; Shift: TShiftState);
begin
   if (Shift = [ssCtrl]) and (KEY_READ = 46) then
      KEY :=0;
end;

procedure TfrmTelaHeranca.CarregarDados;
begin
  if (QryListagem.SQL.Text <> EmptyStr) then
  begin
    QryListagem.IndexFieldNames := IndiceAtual;
    ExibirLabelIndice(IndiceAtual, lblIndice);
    SelectOriginal := QryListagem.SQL.Text;
    QryListagem.Open;
  end;
end;

procedure TfrmTelaHeranca.ControlarBotoes(pgcPrincipal: TpageControl; Flag:Boolean);
begin
   pgcPrincipal.ActivePageIndex := ifthen(Flag, 0, 1);
   btnNovo.Enabled                  := Flag;
   btnAlterar.Enabled               := Flag;
   btnVoltar.Enabled                := not(Flag);
   btnGravar.Enabled                := not(Flag);
   btnExcluir.Enabled               := Flag;
end;

procedure TfrmTelaHeranca.ControlarIndiceTab (pgcPrincipal: TpageControl;
                                              Indice: Integer);
begin
   if (pgcPrincipal.Pages[Indice].TabVisible) then
       pgcPrincipal.TabIndex:=Indice;
end;

function TfrmTelaHeranca.RetornarCampoTraduzido (Campo:string) :string;
var i:Integer;
begin
  for I := 0 to QryListagem.Fields.Count-1 do begin
    if LowerCase(QryListagem.Fields[i].FieldName)=LowerCase(Campo) then begin
       Result:= QryListagem.Fields[i].DisplayLabel;
       Break;
    end;
  end;
end;


procedure TfrmTelaHeranca.ExibirLabelIndice(Campo:string; aLabel:TLabel);
begin
  aLabel.Caption:=RetornarCampoTraduzido(Campo);
end;

function TfrmTelaHeranca.ExisteCampoObrigatorio:Boolean;
var i:Integer;
begin
  Result:=False;
  for i := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then begin
       if (TLabeledEdit(Components[i]).Tag =2) and
          (TLabeledEdit (Components[i]).Text=EmptyStr) then begin
          MessageDlg(TLabeledEdit (Components[i]).EditLabel.Caption +
                     ' � um campo obrigat�rio',mtInformation, [mbOK],0);
          TLabeledEdit (Components[i]).SetFocus;
          Result:=True;
          Break;
        end;
    end;
  end;
end;

procedure TfrmTelaHeranca.DesabilitarEditPK;
var i:Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then begin
       if (TLabeledEdit(Components[i]).Tag =1) then begin
          TLabeledEdit(Components[i]).Enabled:=False;
          Break;
       end;
    end;
  end;
end;

procedure TfrmTelaHeranca.LimparEdits;
var i:Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then
      TLabeledEdit(Components[i]).Text:= EmptyStr
    else if (components[i] is TEdit) then
      TEdit(Components[i]).Text:=''

    else if (components[i] is TMaskEdit) then
      TMaskEdit(Components[i]).Text:=''
    else if (components[i] is TMemo) then
      TMemo(Components[i]).Text:=''
    else if (components[i] is TDBLookupComboBox) then
      TDBLookupComboBox(Components[i]).KeyValue:=null
    else if (components[i] is TCurrencyEdit) then
      TCurrencyEdit(Components[i]).value:=0
    else if (components[i] is TDateEdit) then
      TDateEdit(Components[i]).date:=0;
  end;
end;



{$ENDREGION}

{$REGION 'M�TODOS VIRTUAIS'}
function TfrmTelaHeranca.Apagar: Boolean;
begin
  ShowMessage('DELETADO');
  Result :=True;
end;

function  TfrmTelaHeranca.Gravar(EstadoDoCadastro:TEstadoDoCadastro) :Boolean;
begin
  if (EstadoDoCadastro=ecInserir) then
     ShowMessage('Inserir')
  else if (EstadoDoCadastro=ecAlterar) then
     ShowMessage('Alterado');

  Result :=True;
end;

{$ENDREGION}

{$REGION 'BOT�ES'}
procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TPngSpeedButton(Sender).Name, DtmPrincipal.ConexaoDB) then
  begin
     MessageDlg('Usu�rio: '+oUsuarioLogado.nome +', n�o tem permiss�o de acesso',mtWarning,[mbOK],0);
     Abort;
  end;
  ControlarBotoes(pgcPrincipal, False);
  EstadoDoCadastro:=ecInserir;
  LimparEdits;
end;

procedure TfrmTelaHeranca.btnPesquisaClick(Sender: TObject);
var I: Integer;
    TipoCampo:TFieldType;
    NomeCampo: string;
    WhereOrAnd:string;
    CondicaoSQL:string;
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TPngSpeedButton(Sender).Name, DtmPrincipal.ConexaoDB) then
  begin
     MessageDlg('Usu�rio: '+oUsuarioLogado.nome +', n�o tem permiss�o de acesso',mtWarning,[mbOK],0);
     Abort;
  end;

  if mskPesquisar.Text='' then
  begin
    QryListagem.Close;
    QryListagem.SQL.Clear;
    QryListagem.SQL.Add(SelectOriginal);
    QryListagem.Open;
    Abort;
  end;

  for I:= 0 to QryListagem.FieldCount-1 do
  begin
     if QryListagem.Fields[i].FieldName=IndiceAtual then
     begin
       TipoCampo := QryListagem.Fields[i].DataType;
       if QryListagem.FIelds[i].Origin<>'' then
       begin
         if Pos('.', QryListagem.Fields[i].Origin) > 0 then
           NomeCampo := QryListagem.Fields[i].Origin
         else
           NomeCampo := QryListagem.Fields[i].Origin+'.'+QryListagem.Fields[i].FieldName;
       end
       else
       begin
       NomeCampo := QryListagem.Fields[i].FieldName;
       Break;
       end;
     end;
  end;

  if Pos ('where',LowerCase(SelectOriginal)) > 1 then
  begin
    WhereOrAnd := ' and '
  end
  else
  begin
    WhereOrAnd := ' where ';
  end;

  if (TipoCampo=ftString) or (TipoCampo=ftWideString) then
  begin
    CondicaoSQL := WhereOrAnd+' '+ NomeCampo + ' LIKE '+QuotedStr('%'+mskPesquisar.Text+'%');
  end
  else if (TipoCampo = ftInteger) or (TipoCampo = ftSmallint) then
  begin
    CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+mskPesquisar.Text
  end
  else if (TipoCampo = ftDate) or (TipoCampo = ftDateTime) then
  begin
    CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+QuotedStr(mskPesquisar.Text)
  end
  else if (TipoCampo  = ftFloat) or (TipoCampo = ftCurrency) then
  begin
    CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+StringReplace(mskPesquisar.Text,',','.',[rfReplaceAll]);
  end;

  QryListagem.Close;
  QryListagem.SQL.Clear;
  QryListagem.SQL.Add(SelectOriginal);
  QryListagem.SQL.Add(CondicaoSQL);
  QryListagem.Open;

  mskPesquisar.Text:='';
  mskPesquisar.SetFocus;

end;

procedure TfrmTelaHeranca.btnPesquisarClick(Sender: TObject);
var I: Integer;
    TipoCampo:TFieldType;
    NomeCampo: string;
    WhereOrAnd:string;
    CondicaoSQL:string;
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TBitBtn(Sender).Name, DtmPrincipal.ConexaoDB) then
  begin
     MessageDlg('Usu�rio: '+oUsuarioLogado.nome +', n�o tem permiss�o de acesso',mtWarning,[mbOK],0);
     Abort;
  end;

  if mskPesquisar.Text='' then
  begin
    QryListagem.Close;
    QryListagem.SQL.Clear;
    QryListagem.SQL.Add(SelectOriginal);
    QryListagem.Open;
    Abort;
  end;

  for I:= 0 to QryListagem.FieldCount-1 do
  begin
     if QryListagem.Fields[i].FieldName=IndiceAtual then
     begin
       TipoCampo := QryListagem.Fields[i].DataType;
       if QryListagem.FIelds[i].Origin<>'' then
       begin
         if Pos('.', QryListagem.Fields[i].Origin) > 0 then
           NomeCampo := QryListagem.Fields[i].Origin
         else
           NomeCampo := QryListagem.Fields[i].Origin+'.'+QryListagem.Fields[i].FieldName;
       end
       else
       begin
       NomeCampo := QryListagem.Fields[i].FieldName;
       Break;
       end;
     end;
  end;

  if Pos ('where',LowerCase(SelectOriginal)) > 1 then
  begin
    WhereOrAnd := ' and '
  end
  else
  begin
    WhereOrAnd := ' where ';
  end;

  if (TipoCampo=ftString) or (TipoCampo=ftWideString) then
  begin
    CondicaoSQL := WhereOrAnd+' '+ NomeCampo + ' LIKE '+QuotedStr('%'+mskPesquisar.Text+'%');
  end
  else if (TipoCampo = ftInteger) or (TipoCampo = ftSmallint) then
  begin
    CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+mskPesquisar.Text
  end
  else if (TipoCampo = ftDate) or (TipoCampo = ftDateTime) then
  begin
    CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+QuotedStr(mskPesquisar.Text)
  end
  else if (TipoCampo  = ftFloat) or (TipoCampo = ftCurrency) then
  begin
    CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+StringReplace(mskPesquisar.Text,',','.',[rfReplaceAll]);
  end;

  QryListagem.Close;
  QryListagem.SQL.Clear;
  QryListagem.SQL.Add(SelectOriginal);
  QryListagem.SQL.Add(CondicaoSQL);
  QryListagem.Open;

  mskPesquisar.Text:='';
  mskPesquisar.SetFocus;

end;

procedure TfrmTelaHeranca.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHeranca.btnVoltarClick(Sender: TObject);
begin
  ControlarBotoes(pgcPrincipal, True);
  EstadoDoCadastro:=ecNenhum;
  LimparEdits;
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TPngSpeedButton(Sender).Name, DtmPrincipal.ConexaoDB) then
  begin
     MessageDlg('Usu�rio: '+oUsuarioLogado.nome +', n�o tem permiss�o de acesso',mtWarning,[mbOK],0);
     Abort;
  end;

  ControlarBotoes(pgcPrincipal, False);
  EstadoDoCadastro:=ecAlterar;
  CarregarDados;
end;

procedure TfrmTelaHeranca.btnApagarClick(Sender: TObject);
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TBitBtn(Sender).Name, DtmPrincipal.ConexaoDB) then
  begin
     MessageDlg('Usu�rio: '+oUsuarioLogado.nome +', n�o tem permiss�o de acesso',mtWarning,[mbOK],0);
     Abort;
  end;

  try
    if (Apagar) then begin
      ControlarBotoes(pgcPrincipal, True);
      ControlarIndiceTab(pgcPrincipal, 0);
      LimparEdits;
      QryListagem.Refresh;
    end
    else begin
      MessageDlg('Erro na Exclus�o', mtError, [mbOK] ,0);
    end;
  Finally
    EstadoDoCadastro:=ecNenhum;
  end;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
  ControlarBotoes(pgcPrincipal, True);
  ControlarIndiceTab(pgcPrincipal, 0);
  EstadoDoCadastro:=ecNenhum;
  LimparEdits;
end;

procedure TfrmTelaHeranca.btnExcluirClick(Sender: TObject);
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TPngSpeedButton(Sender).Name, DtmPrincipal.ConexaoDB) then
  begin
     MessageDlg('Usu�rio: '+oUsuarioLogado.nome +', n�o tem permiss�o de acesso',mtWarning,[mbOK],0);
     Abort;
  end;

  try
    if (Apagar) then begin
      ControlarBotoes(pgcPrincipal, True);
      LimparEdits;
      QryListagem.Refresh;
    end
    else begin
      MessageDlg('Erro na Exclus�o', mtError, [mbOK] ,0);
    end;
  Finally
    EstadoDoCadastro:=ecNenhum;
  end;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TPngSpeedButton(Sender).Name, DtmPrincipal.ConexaoDB) then
  begin
     MessageDlg('Usu�rio: '+oUsuarioLogado.nome +', n�o tem permiss�o de acesso',mtWarning,[mbOK],0);
     Abort;
  end;

  if (ExisteCampoObrigatorio) then
     Abort;
  Try
    if Gravar(EstadoDoCadastro) then  begin
      ControlarBotoes(pgcPrincipal, True);
      EstadoDoCadastro:=ecNenhum;
      LimparEdits;
      QryListagem.Refresh;
    end
    else begin
      MessageDlg('Erro na Grava��o', mtError, [mbOK] ,0);
    end;
  finally
  End;
  CarregarDados;
end;
{$ENDREGION}

{$REGION 'FORMS'}
procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   QryListagem.Close;
end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
begin
  QryListagem.Connection :=dtmPrincipal.conexaoDB;
  dtsListagem.DataSet :=QryListagem;
  grdListagem.DataSource :=dtsListagem;
  grdListagem.Options:= [dgTitles,dgIndicator,dgColumnResize,dgColLines,dgRowLines,
                         dgTabs,dgRowSelect,dgAlwaysShowSelection,dgCancelOnExit,
                         dgTitleClick,dgTitleHotTrack];
end;

procedure TfrmTelaHeranca.FormShow(Sender: TObject);
begin
  CarregarDados;
  DesabilitarEditPK;
  ControlarBotoes(pgcPrincipal, True);


  tabListagem.TabVisible := False;
  tabManutencao.TabVisible := False;
  pgcPrincipal.ActivePageIndex  := 0;

  btnLegendas.Visible:=  pLegendas;
end;

{$ENDREGION}

{$REGION 'GRIDS'}
procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;
end;

procedure TfrmTelaHeranca.grdListagemDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

if not odd(QryListagem.RecNo) then
  if not (gdSelected in State) then
    begin
    grdListagem.Canvas.Brush.Color := $004FE4FF;
    grdListagem.Canvas.FillRect(Rect);
    grdListagem.DefaultDrawDataCell(rect,Column.Field,state);
  end;

end;


procedure TfrmTelaHeranca.grdListagemKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  BloqueiaCTRL_DEL_DBGrid(Key,Shift);
end;

procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual := Column.FieldName;
  QryListagem.IndexFieldNames:=IndiceAtual;
  ExibirLabelIndice (IndiceAtual, lblIndice);
end;

procedure TfrmTelaHeranca.imgPesquisarClick(Sender: TObject);
var I: Integer;
    TipoCampo:TFieldType;
    NomeCampo: string;
    WhereOrAnd:string;
    CondicaoSQL:string;
begin
  if not TUsuarioLogado.TenhoAcesso(oUsuarioLogado.codigo, self.Name+'_'+TPngSpeedButton(Sender).Name, DtmPrincipal.ConexaoDB) then
  begin
     MessageDlg('Usu�rio: '+oUsuarioLogado.nome +', n�o tem permiss�o de acesso',mtWarning,[mbOK],0);
     Abort;
  end;

  if mskPesquisar.Text='' then
  begin
    QryListagem.Close;
    QryListagem.SQL.Clear;
    QryListagem.SQL.Add(SelectOriginal);
    QryListagem.Open;
    Abort;
  end;

  for I:= 0 to QryListagem.FieldCount-1 do
  begin
     if QryListagem.Fields[i].FieldName=IndiceAtual then
     begin
       TipoCampo := QryListagem.Fields[i].DataType;
       if QryListagem.FIelds[i].Origin<>'' then
       begin
         if Pos('.', QryListagem.Fields[i].Origin) > 0 then
           NomeCampo := QryListagem.Fields[i].Origin
         else
           NomeCampo := QryListagem.Fields[i].Origin+'.'+QryListagem.Fields[i].FieldName;
       end
       else
       begin
       NomeCampo := QryListagem.Fields[i].FieldName;
       Break;
       end;
     end;
  end;

  if Pos ('where',LowerCase(SelectOriginal)) > 1 then
  begin
    WhereOrAnd := ' and '
  end
  else
  begin
    WhereOrAnd := ' where ';
  end;

  if (TipoCampo=ftString) or (TipoCampo=ftWideString) then
  begin
    CondicaoSQL := WhereOrAnd+' '+ NomeCampo + ' LIKE '+QuotedStr('%'+mskPesquisar.Text+'%');
  end
  else if (TipoCampo = ftInteger) or (TipoCampo = ftSmallint) then
  begin
    CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+mskPesquisar.Text
  end
  else if (TipoCampo = ftDate) or (TipoCampo = ftDateTime) then
  begin
    CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+QuotedStr(mskPesquisar.Text)
  end
  else if (TipoCampo  = ftFloat) or (TipoCampo = ftCurrency) then
  begin
    CondicaoSQL := WhereOrAnd+' '+NomeCampo + '='+StringReplace(mskPesquisar.Text,',','.',[rfReplaceAll]);
  end;

  QryListagem.Close;
  QryListagem.SQL.Clear;
  QryListagem.SQL.Add(SelectOriginal);
  QryListagem.SQL.Add(CondicaoSQL);
  QryListagem.Open;

  mskPesquisar.Text:='';
  mskPesquisar.SetFocus;

end;


procedure TfrmTelaHeranca.mskPesquisarChange(Sender: TObject);
begin
  QryListagem.Locate(IndiceAtual, TMaskEdit(Sender).Text, [loPartialKey]);
end;

{$ENDREGION}

end.
