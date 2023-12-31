unit uProVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  RxToolEdit, RxCurrEdit, uDTMVenda,  uEnum, cProVenda, ZAbstractConnection,
  ZConnection, Vcl.Imaging.jpeg,
  Vcl.ImgList, System.ImageList, cCadProduto, Vcl.Imaging.pngimage, RxColors, PngSpeedButton, JvExExtCtrls, JvImage;

type
  TfrmProVenda = class(TfrmTelaHeranca)
    edtVendaId: TLabeledEdit;
    lkpCliente: TDBLookupComboBox;
    Label1: TLabel;
    edtDataVenda: TDateEdit;
    Label3: TLabel;
    pnlItemVenda: TPanel;
    pnlItens: TPanel;
    pnlTotalizador: TPanel;
    Label2: TLabel;
    edtValorTotal: TCurrencyEdit;
    Panel2: TPanel;
    lkpProduto: TDBLookupComboBox;
    Label4: TLabel;
    edtQuantidade: TCurrencyEdit;
    Label5: TLabel;
    edtValorUnitario: TCurrencyEdit;
    Label6: TLabel;
    edtTotalProduto: TCurrencyEdit;
    Label7: TLabel;
    dbgridItensVenda: TDBGrid;
    QryListagemvendaId: TIntegerField;
    QryListagemclienteId: TIntegerField;
    QryListagemnome: TWideStringField;
    QryListagemdataVenda: TDateTimeField;
    QryListagemtotalVenda: TFloatField;
    pnlAdicionarItem: TPanel;
    shpAdicionarItem: TShape;
    imgAdicionarItem: TImage;
    pnlRemoverItem: TPanel;
    shpRemoverItem: TShape;
    imgRemoverItem: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgridItensVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lkpProdutoExit(Sender: TObject);
    procedure edtQuantidadeExit(Sender: TObject);
    procedure dbgridItensVendaDblClick(Sender: TObject);
    procedure dbgridItensVendaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure imgNovoClick(Sender: TObject);
    procedure imgAlterarClick(Sender: TObject);
    procedure imgApagarClick(Sender: TObject);
    procedure imgSalvarClick(Sender: TObject);
    procedure imgVoltarClick(Sender: TObject);
    procedure imgAdicionarItemClick(Sender: TObject);
    procedure imgRemoverItemClick(Sender: TObject);
    procedure imgAdicionarItemMouseLeave(Sender: TObject);
    procedure imgAdicionarItemMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure imgRemoverItemMouseLeave(Sender: TObject);
    procedure imgRemoverItemMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure grdListagemDblClick(Sender: TObject);
  private
    { Private declarations }
    //ConexaoDB:TZConnection;
    //F_vendaId:Integer;
    dtmVendas: TdtmVendas;
    oVenda:TVenda;
    oProduto:TProduto;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):boolean; override;
    function Apagar:Boolean; override;
    function TotalizarProduto(valorUnitario, Quantidade: Double): Double;
    procedure CarregarRegistroSelecionado;
    procedure LimparComponenteItem;
    procedure LimparCds;
    function TotalizarVenda: Double;

  public
    { Public declarations }
    //property VendaId:Integer     read F_vendaId    write F_vendaId;
  end;

var
  frmProVenda: TfrmProVenda;

implementation

{$R *.dfm}

uses uDTMConexao, uRelProVenda;

{$region 'Override'}
function TfrmProVenda.Apagar: Boolean;
begin
  if oVenda.Selecionar(QryListagem.FieldByName('vendaId').AsInteger, dtmVendas.cdsItensVendas) then begin
     Result:=oVenda.Apagar;
  end;
end;

function TfrmProVenda.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  Result:=False;
  if edtVendaId.Text<>EmptyStr then
     oVenda.VendaId:=StrToInt(edtVendaId.Text)
  else
     oVenda.VendaId:=0;

  oVenda.ClienteId        :=lkpCliente.KeyValue;
  oVenda.DataVenda        :=edtDataVenda.Date;
  oVenda.TotalVenda       :=edtValorTotal.Value;

  if (EstadoDoCadastro=ecInserir) then begin
     oVenda.VendaId:=oVenda.Inserir(dtmVendas.cdsItensVendas);
  end
  else if (EstadoDoCadastro=ecAlterar) then
     oVenda.Atualizar(dtmVendas.cdsItensVendas);

  frmRelProVenda:=TfrmRelProVenda.Create(self);
  frmRelProVenda.QryVendas.Close;
  frmRelProVenda.QryVendas.ParamByName('VendaId').AsInteger:= oVenda.VendaId;
  frmRelProVenda.QryVendas.Open;

  frmRelProVenda.QryVendasItens.Close;
  frmRelProVenda.QryVendasItens.ParamByName('VendaId').AsInteger:= oVenda.VendaId;
  frmRelProVenda.QryVendasItens.Open;


  frmRelProVenda.Relatorio.PreviewModal;
  frmRelProVenda.Release;

  Result:=true;
end;

procedure TfrmProVenda.grdListagemDblClick(Sender: TObject);
begin
  btnAlterar.Click;

end;

{$endregion}

{$REGION 'Botoes Novos'}

procedure TfrmProVenda.imgNovoClick(Sender: TObject);
begin
  inherited;

  edtDataVenda.Date:=Date;
  lkpCliente.SetFocus;
  LimparCds;

  if not FileExists(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadItensVendas.cfg') then begin
    dbgridItensVenda.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadItensVendas.cfg');
  end;

  dbgridItensVenda.Columns.LoadFromFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadItensVendas.cfg');

end;

procedure TfrmProVenda.imgAlterarClick(Sender: TObject);
begin
  if oVenda.Selecionar(QryListagem.FieldByName('vendaId').AsInteger, dtmVendas.cdsItensVendas) then begin
     edtVendaId.Text     :=IntToStr(oVenda.VendaId);
     lkpCliente.KeyValue :=oVenda.ClienteId;
     edtDataVenda.Date   :=oVenda.DataVenda;
     edtValorTotal.Value :=oVenda.TotalVenda;
  end
  else begin
    btnVoltar.Click;
    Abort;
  end;
  inherited;

  if not FileExists(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadItensVendas.cfg') then begin
    dbgridItensVenda.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadItensVendas.cfg');
  end;

  dbgridItensVenda.Columns.LoadFromFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadItensVendas.cfg');

end;

procedure TfrmProVenda.imgVoltarClick(Sender: TObject);
begin
  inherited;

  LimparCds;

  dbgridItensVenda.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadItensVendas.cfg');

end;

procedure TfrmProVenda.imgSalvarClick(Sender: TObject);
begin
  inherited;

  LimparCds;

  dbgridItensVenda.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadItensVendas.cfg');

end;

procedure TfrmProVenda.imgApagarClick(Sender: TObject);
begin
  inherited;

  if lkpProduto.KeyValue=Null then begin
     MessageDlg('Selecione o Produto a ser exclu�do' ,mtInformation,[mbOK],0);
     dbgridItensVenda.SetFocus;
     abort;
  end;

  if dtmVendas.cdsItensVendas.Locate('produtoId', lkpProduto.KeyValue, []) then begin
     dtmVendas.cdsItensVendas.Delete;
     LimparComponenteItem;
  end;

  edtValorTotal.Value:=TotalizarVenda;

end;

procedure TfrmProVenda.imgRemoverItemClick(Sender: TObject);
begin
  inherited;

  if lkpProduto.KeyValue=Null then begin
     MessageDlg('Selecione o Produto a ser exclu�do' ,mtInformation,[mbOK],0);
     dbgridItensVenda.SetFocus;
     abort;
  end;

  if dtmVendas.cdsItensVendas.Locate('produtoId', lkpProduto.KeyValue, []) then begin
     dtmVendas.cdsItensVendas.Delete;
     LimparComponenteItem;
  end;

  edtValorTotal.Value:=TotalizarVenda;

end;

procedure TfrmProVenda.imgAdicionarItemClick(Sender: TObject);
begin
  inherited;

  if lkpProduto.KeyValue=Null then begin
     MessageDlg('Produto � um campo obrigat�rio' ,mtInformation,[mbOK],0);
     lkpProduto.SetFocus;
     abort;
  end;

  if edtValorUnitario.value<=0 then begin
     MessageDlg('Valor Unit�rio n�o pode ser Zero' ,mtInformation,[mbOK],0);
     edtValorUnitario.SetFocus;
     abort;
  end;

  if edtQuantidade.value<=0 then begin
     MessageDlg('Quantidade n�o pode ser Zero' ,mtInformation,[mbOK],0);
     edtQuantidade.SetFocus;
     abort;
  end;

  if dtmVendas.cdsItensVendas.Locate('produtoId', lkpProduto.KeyValue, []) then begin
     MessageDlg('Este Produto j� foi selecionado' ,mtInformation,[mbOK],0);
     lkpProduto.SetFocus;
     abort;
  end;


  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);

  dtmVendas.cdsItensVendas.Append;
  dtmVendas.cdsItensVendas.FieldByName('produtoId').AsString:=lkpProduto.KeyValue;
  dtmVendas.cdsItensVendas.FieldByName('nomeProduto').AsString:=dtmVendas.QryProdutos.FieldByName('nome').AsString;
  dtmVendas.cdsItensVendas.FieldByName('quantidade').AsFloat:=edtQuantidade.Value;
  dtmVendas.cdsItensVendas.FieldByName('valorUnitario').AsFloat:=edtValorUnitario.Value;
  dtmVendas.cdsItensVendas.FieldByName('valorTotalProduto').AsFloat:=edtTotalProduto.Value;
  dtmVendas.cdsItensVendas.Post;
  edtValorTotal.Value:=TotalizarVenda;
  LimparComponenteItem;
  lkpProduto.SetFocus;

end;

{$ENDREGION}

{$REGION 'Animacoes de botoes'}

//btnAdicionarItens
procedure TfrmProVenda.imgAdicionarItemMouseLeave(Sender: TObject);
begin
  inherited;
  shpAdicionarItem.Brush.Color := clBtnFace;
end;

procedure TfrmProVenda.imgAdicionarItemMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  shpAdicionarItem.Brush.Color := clHtmYellowGreen;
end;

//btnRemoverItens
procedure TfrmProVenda.imgRemoverItemMouseLeave(Sender: TObject);
begin
  inherited;
  shpRemoverItem.Brush.Color := clBtnFace;
end;

procedure TfrmProVenda.imgRemoverItemMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  shpRemoverItem.Brush.Color := clRed;
end;

{$ENDREGION}

{$REGION 'Grids'}

procedure TfrmProVenda.dbgridItensVendaDblClick(Sender: TObject);
begin
  btnAlterar.Click;
  CarregarRegistroSelecionado;
end;

procedure TfrmProVenda.dbgridItensVendaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
if not odd(dtmVendas.cdsItensVendas.RecNo) then
  if not (gdSelected in State) then
    begin
    dbgridItensVenda.Canvas.Brush.Color := clGray;
    dbgridItensVenda.Canvas.FillRect(Rect);
    dbgridItensVenda.DefaultDrawDataCell(rect,Column.Field,state);
  end;
end;

procedure TfrmProVenda.dbgridItensVendaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  BloqueiaCTRL_DEL_DBGrid(key, shift);
end;


{$ENDREGION}

{$REGION 'Edts'}

procedure TfrmProVenda.edtQuantidadeExit(Sender: TObject);
begin
  inherited;
  edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
end;

procedure TfrmProVenda.lkpProdutoExit(Sender: TObject);
begin
  inherited;
  if lkpProduto.KeyValue<>Null then begin
    edtValorUnitario.Value:=dtmVendas.QryProdutos.FieldByName('valor').AsFloat;
    edtQuantidade.Value:=1;
    edtTotalProduto.Value:=TotalizarProduto(edtValorUnitario.Value, edtQuantidade.Value);
  end;
end;

{$ENDREGION}

{$REGION 'Forms'}

procedure TfrmProVenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  grdListagem.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\proVendas.cfg');
  dbgridItensVenda.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\cadItensVendas.cfg');

  if Assigned(dtmVendas) then
     FreeAndNil(dtmVendas);

  if Assigned(oVenda) then
     FreeAndNil(oVenda);
end;

procedure TfrmProVenda.FormCreate(Sender: TObject);
begin
  inherited;

  dtmVendas := TdtmVendas.Create(self);

  oVenda:=TVenda.Create(dtmPrincipal.ConexaoDB);

  IndiceAtual:='nome';

end;

procedure TfrmProVenda.FormShow(Sender: TObject);
begin
  inherited;

  if not FileExists(ExtractFilePath(Application.ExeName)+'\GridsConfigs\proVendas.cfg') then begin
    grdListagem.Columns.SaveToFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\proVendas.cfg');
  end;

  grdListagem.Columns.LoadFromFile(ExtractFilePath(Application.ExeName)+'\GridsConfigs\proVendas.cfg');


end;

{$ENDREGION}

{$REGION 'Processos'}

function TfrmProVenda.TotalizarProduto(valorUnitario, Quantidade:Double):Double;
begin
  result :=valorUnitario * Quantidade;
end;

procedure TfrmProVenda.CarregarRegistroSelecionado;
begin
  lkpProduto.KeyValue   := dtmVendas.cdsItensVendas.FieldByName('produtoId').AsString;
  edtQuantidade.Value   := dtmVendas.cdsItensVendas.FieldByName('quantidade').AsFloat;
  edtValorUnitario.Value:= dtmVendas.cdsItensVendas.FieldByName('valorUnitario').AsFloat;
  edtTotalProduto.Value := dtmVendas.cdsItensVendas.FieldByName('valorTotalProduto').AsFloat;
end;

procedure TfrmProVenda.LimparComponenteItem;
begin
  lkpProduto.KeyValue   := null;
  edtQuantidade.Value   := 0;
  edtValorUnitario.Value:= 0;
  edtTotalProduto.Value := 0;
end;

procedure TfrmProVenda.LimparCds;
begin
  dtmVendas.cdsItensVendas.First;
  while not dtmVendas.cdsItensVendas.Eof do
    dtmVendas.cdsItensVendas.Delete;

end;

function TfrmProVenda.TotalizarVenda:Double;
begin
  result:=0;
  dtmVendas.cdsItensVendas.First;
  while not dtmVendas.cdsItensVendas.Eof do begin
    result := result + dtmVendas.cdsItensVendas.FieldByName('valorTotalProduto').AsFloat;
    dtmVendas.cdsItensVendas.Next;
  end;
end;

{$ENDREGION}

end.
