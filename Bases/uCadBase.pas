unit uCadBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.Buttons,
  PngSpeedButton, Vcl.Imaging.jpeg, JvExExtCtrls, JvImage;

type
  TuPsqBase = class(TForm)
    pnlFundo: TPanel;
    dbgrdListagem: TDBGrid;
    pnlFundoPesquisa: TPanel;
    imgFundoPesquisa: TJvImage;
    pnlListagemTopo: TPanel;
    lblIndice: TLabel;
    btnPesquisa: TPngSpeedButton;
    mskPesquisar: TMaskEdit;
    pnlFundoBotoes: TPanel;
    imgFundoBotoes: TJvImage;
    pnlBotoes: TPanel;
    btnNovo: TPngSpeedButton;
    btnAlterar: TPngSpeedButton;
    btnVoltar: TPngSpeedButton;
    btnGravar: TPngSpeedButton;
    btnExcluir: TPngSpeedButton;
    btnLegendas: TPngSpeedButton;
    btnSair: TPngSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  uPsqBase: TuPsqBase;

implementation

{$R *.dfm}

end.
